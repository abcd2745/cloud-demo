package com.lc.cache.demo.algorithm.lru;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class LRUTest {

    @Test
    void get() {
        LRU<String, String> lru = new LRU<>(3);

        lru.put("1","1");
        assertNotNull(lru.get("1"));
        assertNull(lru.get("2"));

        lru.put("2","2");
        lru.put("3","3");

        lru.put("4","4");
        assertNull(lru.get("1"));

        lru.get("3");
        //根据lru算法这里要过去2 （最少最未使用）
        lru.put("1","1");
        assertNull(lru.get("2"));
    }

}