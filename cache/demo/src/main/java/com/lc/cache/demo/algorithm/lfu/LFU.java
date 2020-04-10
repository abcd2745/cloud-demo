package com.lc.cache.demo.algorithm.lfu;

import com.lc.cache.demo.algorithm.CacheAlgorithm;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Least Frequently Used（最不经常使用策略）
 * 在一段时间内,数据被使用频次最少的,优先被淘汰
 */
public class LFU<K, V> implements CacheAlgorithm<K, V> {

    private final ConcurrentHashMap<K, LFUNode> cache;

    private final static int DEFAULT_INITIAL_CAPACITY = 1024;

    /**
     * 缓存数量
     */
    private int size;

    /**
     * 缓存的最大容量
     */
    private final int initialCapacity;

    public LFU(int initialCapacity) {
        this.initialCapacity = initialCapacity;
        cache = new ConcurrentHashMap<>(initialCapacity * 2);
        size = 0;
    }

    public LFU() {
        this(DEFAULT_INITIAL_CAPACITY);
    }

    /**
     * 添加元素
     *
     * @param key
     * @param data
     */
    @Override
    public void put(K key, V data) {

        if (key == null) {
            throw new RuntimeException("key must be not null");
        }

        if (data == null) {
            throw new RuntimeException("value must be not null");
        }

        LFUNode node;

        if (cache.containsKey(key)) {
            node = cache.get(key);
            node.setValue(data);
            node.setTime(System.nanoTime());
            node.setCount(node.getCount() + 1);
        } else {
            //看看是不是超出最大数量（不考虑map的自动扩容）
            if (size >= initialCapacity) {
                //这里需要先过期数据,只过期最后1个
                expire();
                size--;
            }
            node = new LFUNode(key, data, System.nanoTime(), 0);
        }
        cache.put(key, node);
        size++;
    }

    @Override
    public V get(K key) {
        if (key == null) {
            throw new RuntimeException("key must be not null");
        }
        if (!cache.containsKey(key)) {
            return null;
        }

        LFUNode node = cache.get(key);

        node.setCount(node.getCount() + 1);
        //更新使用次数
        cache.put(key, node);

        return (V) node.getValue();
    }

    /**
     * 这个算法只要过期最后一个
     */
    @Override
    public void expire() {
        //获取所有value，排序，删除最后一位 (key 在value 中）
        Collection<LFUNode> values = cache.values();
        LFUNode min = Collections.min(values);
        cache.remove(min.getKey());
    }

}
