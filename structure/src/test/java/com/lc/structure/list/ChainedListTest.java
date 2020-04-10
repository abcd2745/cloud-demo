package com.lc.structure.list;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ChainedListTest {

    /**
     * 下标0
     * size 代表下标
     * length 代表长度
     */
    private ChainedList list = new ChainedList();

    @Test
    void clear() throws Exception {
        list.insert("11");
        list.insert("22");
        list.insert("33");
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

        list.insert(2, "2");
        list.display();
    }

    @Test
    void get() {
        list.insert(0, "1");
        //每次插入都是放到第0个位置，那么后买你的位置都是后移的
        list.insert(0, "2");
        list.insert(0, "3");
        list.insert(0, "4");

        assertEquals("4", list.get(0));
        list.display();
        list.insert(3, "//3");
        list.display();

    }

    @Test
    void insert() throws Exception {
        assertThrows(RuntimeException.class, () -> {
            list.insert(1, "sad");
        });

        assertThrows(RuntimeException.class, () -> {
            list.insert(10, "sad");
        });
        list.insert(1, "sad");
    }

    @Test
    void remove() {
        list.insert("1");
        list.insert("2");

        list.remove(0);
        list.insert("3");
        list.remove(1);

        list.display();
    }

}