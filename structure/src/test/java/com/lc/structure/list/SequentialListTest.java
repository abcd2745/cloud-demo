package com.lc.structure.list;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class SequentialListTest {

    /**
     * 下标0 开始
     */
    private SequentialList list = new SequentialList();

    @Test
    void clear() throws Exception {

        list.insert("11");
        list.insert("11");
        list.insert("11");
        list.clear();
        assertEquals(0, list.length());
        assertTrue(list.isEmpty());
    }

    /**
     * junit5 测试异常方法 assertThrows
     *
     * @throws Exception
     */
    @Test
    void isEmpty() throws Exception {

        list.insert("1");

        assertEquals(1, list.length());

        assertEquals("1", list.get(0));

        list.remove(0);

        assertTrue(list.isEmpty());

    }

    @Test
    void length() throws Exception {
        list.insert("1");
        list.insert("1");
        list.insert("1");
        assertEquals(3, list.length());
    }

    @Test
    void get() {
        list.insert(0, "1");
        list.insert(0, "2");
        list.insert(0, "3");
        list.insert(0, "4");

        assertEquals("4",list.get(0));
    }

    @Test
    void insert() throws Exception {
        assertThrows(RuntimeException.class, () -> {
            list.insert(1, "sad");
        });

        assertThrows(RuntimeException.class, () -> {
            list.insert(10, "sad");
        });
        list.insert(0, "1");
        System.out.println(list.get(0));
    }

    @Test
    void remove() {
    }

    @Test
    void indexOf() {
    }

    @Test
    void display() {
    }
}