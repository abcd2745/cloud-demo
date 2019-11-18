package com.lc.alg.ch01;

/**
 * 限流算法
 * https://segmentfault.com/a/1190000016359991
 * 目前比较常见的限流算法有以下几种：
 * 固定窗口
 * 滑动窗口
 * 令牌桶算法
 * 漏桶算法
 */
public interface RateLimiter {

    boolean isOverLimit();

    int currentQPS();

    boolean visit();
}
