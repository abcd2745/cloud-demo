package com.lc.a.code;

import org.junit.Assert;
import org.junit.Test;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Base64;

import static org.hamcrest.Matchers.is;

/**
 * 根据base64定义
 * 实现base64的转换
 */
public class MyBase64Util {

    /**
     * base64索引表
     * 0-25    A-Z
     * 26-51   a-z
     * 52-61  0-9
     * 62  +
     * 63  /
     * 空  =
     */
    private static final char[] BASE_64 = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
            'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
            'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
            '+', '/', '='};

    /**
     * 每3个ascii码转成4个base64码，不足3个则后补0
     * 补充的 0 ，转成base64 是 “=”
     *
     * @param ascii
     * @return
     */
    public String encode(String ascii) {
        //步骤一：传入字符串按3位分组，最后不足3位补0
        //步骤二：讲字符串转成二进制数，按6位切分
        //步骤三：每6位前补2个0
        //步骤四：结果转成int类型，按索引表转成base64字符
        if (ascii == null || ascii.length() < 1) {
            return ascii;
        }

        char[] asciiChr = ascii.toCharArray();

        StringBuilder result = new StringBuilder();

        for (int i = 0, length = asciiChr.length; i < length; i += 3) {
            if (length < i + 3) {
                // 只有1位
                if (length - i == 1) {
                    String bit = supplement0(Integer.toBinaryString(asciiChr[i]));
                    Integer base64Index = Integer.parseUnsignedInt(bit.substring(0, 6), 2);
                    result.append(BASE_64[base64Index]);
                    //这里是后补0，需要补上计算二进制值
                    Integer base64Index2 = Integer.parseUnsignedInt(bit.substring(6, 8) + "0000", 2);
                    result.append(BASE_64[base64Index2]);
                    result.append("=");
                    result.append("=");
                }
                if (length - i == 2) {
                    StringBuilder bit = new StringBuilder();
                    bit.append(supplement0(Integer.toBinaryString(asciiChr[i])));
                    bit.append(supplement0(Integer.toBinaryString(asciiChr[i + 1])));
                    Integer base64Index = Integer.parseUnsignedInt(bit.substring(0, 6), 2);
                    result.append(BASE_64[base64Index]);
                    Integer base64Index2 = Integer.parseUnsignedInt(bit.substring(6, 12), 2);
                    result.append(BASE_64[base64Index2]);
                    //这里是后补0，需要补上计算二进制值
                    Integer base64Index3 = Integer.parseUnsignedInt(bit.substring(12, 16) + "00", 2);
                    result.append(BASE_64[base64Index3]);
                    result.append("=");
                }

            } else {
                StringBuilder bit = new StringBuilder();
                bit.append(supplement0(Integer.toBinaryString(asciiChr[i])));
                bit.append(supplement0(Integer.toBinaryString(asciiChr[i + 1])));
                bit.append(supplement0(Integer.toBinaryString(asciiChr[i + 2])));

                Integer base64Index = Integer.parseUnsignedInt(bit.substring(0, 6), 2);
                result.append(BASE_64[base64Index]);
                Integer base64Index2 = Integer.parseUnsignedInt(bit.substring(6, 12), 2);
                result.append(BASE_64[base64Index2]);
                Integer base64Index3 = Integer.parseUnsignedInt(bit.substring(12, 18), 2);
                result.append(BASE_64[base64Index3]);
                Integer base64Index4 = Integer.parseUnsignedInt(bit.substring(18, 24), 2);
                result.append(BASE_64[base64Index4]);
            }
        }

        return result.toString();
    }

    @Test
    public void testTransform() throws UnsupportedEncodingException {
        Assert.assertEquals(Base64.getEncoder().encodeToString("8".getBytes("UTF-8")), encode("8"));
        Assert.assertEquals(Base64.getEncoder().encodeToString("12".getBytes("UTF-8")), encode("12"));
        Assert.assertEquals(Base64.getEncoder().encodeToString("adfasdfasd  asdf 43123vwetrAwE2Q3R4243@#@!$@#$#@r%FGDSF".getBytes("UTF-8")), encode("adfasdfasd  asdf 43123vwetrAwE2Q3R4243@#@!$@#$#@r%FGDSF"));
    }

    private static final String SUPPLEMENT_ZERO = "00000000";

    /**
     * 不足8位，前补0
     *
     * @param bitString
     * @return
     */
    public String supplement0(String bitString) {
        if (bitString == null || bitString.length() < 1) {
            return bitString;
        }
        int length = bitString.length();

        int residue = length % 8;

        if (residue == 0) {
            return bitString;
        }

        return (SUPPLEMENT_ZERO.substring(residue)) + bitString;
    }

    /**
     * ascii(8位) 转 base64（6位）  3*8 = 4*6
     * 后续需要补充0
     * 不全是补充的0 ，则是 A
     * 全是补充的0 则是 =
     * eg：ascii 字符 '8' (序号 56 ，二进制是：0011_1000)
     * 转换过程： ascii  0011_1000
     * 按6位拆分,不足补0：00_1110 00_0000 空 空 （关键是这步，ascii不足3位，则这里补齐，总结果是24位）
     * 前补2位0： 0000_1110 0000_0000 空 空
     * 二进制转int：14 0 空 空
     * 查base64序号：O A = =
     * 结果：OA==
     *
     * @throws UnsupportedEncodingException
     */
    @Test
    public void testBase64Util() throws UnsupportedEncodingException {
        // 编码
        String encode = Base64.getEncoder().encodeToString("8".getBytes("UTF-8"));
        System.out.println(encode);
        // 解码
        byte[] decode = Base64.getDecoder().decode(encode);
        System.out.println(Arrays.toString(decode));
        Assert.assertEquals("8", new String(decode, "UTF-8"));


    }

    /**
     * 测试获取字符的ascii码
     * ascii码间：https://baike.baidu.com/item/ASCII/309296?fr=aladdin （百度百科）
     */
    @Test
    public void testAscii() {
        Assert.assertTrue(Integer.valueOf('A').equals(65));
        Assert.assertTrue(Integer.valueOf('_').equals(95));
        Assert.assertTrue(Integer.valueOf(' ').equals(32));
        Assert.assertTrue(Integer.valueOf('|').equals(124));
        /*特殊字符  （\n\t\r)*/
        //制表符
        Assert.assertTrue(Integer.valueOf('\t').equals(9));
        //换行键
        Assert.assertTrue(Integer.valueOf('\n').equals(10));
        //回车键
        Assert.assertTrue(Integer.valueOf('\r').equals(13));
        //退格键
        Assert.assertTrue(Integer.valueOf('\b').equals(8));

        System.out.println((int)'a');
    }

    /**
     * 转二进制
     * Integer.toBinaryString()  不会前补0，则需要单独实现
     */
    @Test
    public void testIntegerToBit() {
        Assert.assertEquals("10", Integer.toBinaryString(2));
        Assert.assertEquals("11", Integer.toBinaryString(3));
    }

    @Test
    public void testSupplement0() {
        Assert.assertEquals("00000010", supplement0(Integer.toBinaryString(2)));
        Assert.assertEquals("00000000", supplement0(Integer.toBinaryString(0)));
        Assert.assertEquals("0000000100000000", supplement0(Integer.toBinaryString(256)));
    }

    @Test
    public void testBinaryStringToInteger() {
        Assert.assertThat(Integer.parseUnsignedInt("00000010"), is(2));
        Assert.assertThat(Integer.parseUnsignedInt("00000000"), is(0));
        Assert.assertThat(Integer.parseUnsignedInt("01111111"), is(127));
        Assert.assertThat(Integer.parseUnsignedInt("11111111"), is(255));
    }

}
