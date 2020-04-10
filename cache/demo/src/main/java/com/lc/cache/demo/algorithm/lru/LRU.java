package com.lc.cache.demo.algorithm.lru;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * HashMap + 双链表 方式实现LRU 算法
 * JDK 自带LinkedHashMap 实现了LRU算法
 * LinkedHashMap中本身就实现了一个方法removeEldestEntry用于判断是否需要移除最不常读取的数，
 * 方法默认是直接返回false，不会移除元素
 * 所以需要重写该方法，即当缓存满后就移除最不常用的数。
 *
 * @param <K>
 * @param <V>
 */
public class LRU<K, V> {

    private static final float hashLoadFactory = 0.75f;
    private LinkedHashMap<K, V> map;
    private int cacheSize;

    public LRU(int cacheSize) {
        this.cacheSize = cacheSize;
        int capacity = (int) Math.ceil(cacheSize / hashLoadFactory) + 1;
        map = new LinkedHashMap<K, V>(capacity, hashLoadFactory, true) {
            private static final long serialVersionUID = 1;

            @Override
            protected boolean removeEldestEntry(Map.Entry eldest) {
                return size() > LRU.this.cacheSize;
            }
        };
    }

    public synchronized V get(K key) {
        return map.get(key);
    }

    public synchronized void put(K key, V value) {
        map.put(key, value);
    }

    public synchronized void clear() {
        map.clear();
    }

    public synchronized int usedSize() {
        return map.size();
    }

    public void print() {
        for (Map.Entry<K, V> entry : map.entrySet()) {
            System.out.print(entry.getValue() + "--");
        }
        System.out.println();
    }
}