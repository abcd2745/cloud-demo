package com.lc.cache.demo.algorithm;

public interface CacheAlgorithm<K, V> {

    /**
     * 添加元素
     *
     * @param key
     * @param data
     */
    void put(K key, V data);

    /**
     * 获取元素
     *
     * @param key
     * @return
     */
    V get(K key);

    /**
     * 过期
     */
    void expire();
}
