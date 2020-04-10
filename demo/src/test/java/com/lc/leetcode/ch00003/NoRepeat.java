package com.lc.leetcode.ch00003;

import org.junit.Assert;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.hamcrest.Matchers.is;

/**
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 */
public class NoRepeat {

    /**
     * 思路： abccalkdjfa1234kladf1
     * 将已遍历的数据放到map中
     */
    @Test
    public void test() {

        Assert.assertThat(3, is(search("abcabcbb")));
        Assert.assertThat(2, is(search("aab")));

    }

    private int search(String str) {
        char[] chars = str.toCharArray();
        int length = chars.length;
        /**
         * 存所有可能结果
         */
        int result = 0;
        for (int i = 0; i < length; i++) {
            //存要比较的字符
            Map<Character, Integer> resultMap = new HashMap<>((length - i) * 2);
            resultMap.put(chars[i], i);
            for (int j = i + 1; j < chars.length; j++) {
                if (resultMap.containsKey(chars[j])) {
                    int size = j - i;
                    result = result < size ? size : result;
                    break;
                }
                resultMap.put(chars[j], j);
                if (j == length - 1) {
                    int size = (j - i) + 1;
                    result = result < size ? size : result;
                }
            }

        }
        return result;
    }

}
