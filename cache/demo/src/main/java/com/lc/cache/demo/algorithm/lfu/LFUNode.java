package com.lc.cache.demo.algorithm.lfu;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 存储的数据结构
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LFUNode implements Comparable<LFUNode> {

    private Object key;

    private Object value;

    /**
     * 访问时间
     */
    private long time;

    /**
     * 访问次数
     */
    private int count;

    /**
     * 升序
     *
     * @param o
     * @return
     */
    @Override
    public int compareTo(LFUNode o) {
        int compare = Integer.compare(this.count, o.count);
        //在数目相同的情况下 比较时间
        if (compare == 0) {
            return Long.compare(this.time, o.time);
        }
        return compare;
    }
}
