package com.lc.java8.hash;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class HashTest {

    /**
     * String方法的hash算法
     * hash=s[0]∗31^(n−1)+s[1]∗31^(n−2)+...+s[n−1]*31^0
     */
    @Test
    void testStringHashCode() {
        Assertions.assertEquals(97, "a".hashCode());
    }
}
