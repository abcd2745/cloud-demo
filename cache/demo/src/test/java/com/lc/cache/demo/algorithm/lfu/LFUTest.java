package com.lc.cache.demo.algorithm.lfu;

import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class LFUTest {

    @Test
    void sort() {
        List<LFUNode> nodeList = new ArrayList<>();
        nodeList.add(new LFUNode("1", "1", System.nanoTime() - 2, 1));
        nodeList.add(new LFUNode("2", "2", System.nanoTime() - 1, 0));
        nodeList.add(new LFUNode("3", "3", System.nanoTime() - 1, 1));
        nodeList.add(new LFUNode("4", "4", System.nanoTime(), 4));
        //先比较 count ，后比较 time (升序）
        Collections.sort(nodeList, LFUNode::compareTo);
        assertEquals("2", nodeList.get(0).getKey());
        assertEquals("1", nodeList.get(1).getKey());
        assertEquals("3", nodeList.get(2).getKey());
        assertEquals("4", nodeList.get(3).getKey());
    }

    @Test
    void get() {
        LFU<String, Object> lfu = new LFU<>();
        assertThrows(RuntimeException.class, () -> lfu.get(null));
        lfu.put("", "");
        assertEquals("", lfu.get(""));
        assertThrows(RuntimeException.class, () -> lfu.put(null, ""));
        assertThrows(RuntimeException.class, () -> lfu.put("", null));
    }

    /**
     * 测试是否已过期数据
     */
    @Test
    void put() {
        LFU<String, Object> lfu = new LFU<>(2);

        lfu.put("1", "1");
        lfu.put("2", "2");
        lfu.put("3", "3");

        assertNull(lfu.get("1"));

        lfu.put("2", "2");
        assertNotNull(lfu.get("3"));

        lfu.put("1", "1");
        assertNull(lfu.get("3"));

        lfu.put("1","1_1");
        assertEquals("1_1",lfu.get("1"));
    }
}