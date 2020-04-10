package com.lc.java8.base;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

/**
 * 计算机基础:原码、反码、补码
 * java 使用补码表示数据 （最高位为符号位，1 负数，0 正数）
 * 反码存在 +0/-0
 * 原码加减法运算结果不正确
 * 正数：原码 = 反码 = 补码
 * 负数：反码 = 原码除符号位取反 ； 补码 = 反码 + 1
 */
public class WeiYi {

    @Test
    void testJavaUseBuMa() {
        //java byte 占4字节 ，32位
        int i = -2;
        //原码：1000,0000 0000,0000 0000,0000 0000,0010
        //反码：1111,1111 1111,1111 1111,1111 1111,1101
        //反码：1111,1111 1111,1111 1111,1111 1111,1110
        System.out.println("-2的二进制表示法：" + Integer.toBinaryString(i));
        //位移操作
        // << i左移n = i * 2 ^ (n%32)  （eg:左移1位，等于乘2）,后补0
        Assertions.assertEquals(-4, i << 1);
        // >> i右移n = i / 2 ^ (n%32)   (eg:右移1位，等于除2）前补符号位
        Assertions.assertEquals(-1, i >> 1);
        //-2 有符号右移任意位，都是 1111,1111 1111,1111 1111,1111 1111,1111 （值：-1）
        Assertions.assertEquals(-1, i >> 2);
        Assertions.assertEquals(-1, i >> 31);
        // >>> 无符号右移  ,前补0  (负数无符号右移会得到正数）
        Assertions.assertEquals(Integer.MAX_VALUE, i >>> 1);//1111,1111 1111,1111 1111,1111 1111,1110
    }
}
