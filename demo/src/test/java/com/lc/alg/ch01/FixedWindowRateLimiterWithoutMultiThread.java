package com.lc.alg.ch01;

import java.util.concurrent.atomic.AtomicInteger;

public class FixedWindowRateLimiterWithoutMultiThread implements RateLimiter {
    private Long lastVisitAt = System.currentTimeMillis();
    private static final int DEFAULT_ALLOWED_VISIT_PER_SECOND = 5;

    private final int maxVisitPerSecond;

    private AtomicInteger count;

    public FixedWindowRateLimiterWithoutMultiThread(int maxVisitPerSecond) {
        this.maxVisitPerSecond = maxVisitPerSecond;
        this.count = new AtomicInteger();
    }

    public FixedWindowRateLimiterWithoutMultiThread() {
        this(DEFAULT_ALLOWED_VISIT_PER_SECOND);
    }

    @Override
    public boolean isOverLimit() {
        return count.get() > maxVisitPerSecond;
    }

    @Override
    public int currentQPS() {
        return count.get();
    }

    @Override
    public boolean visit() {
        long now = System.currentTimeMillis();
        synchronized (lastVisitAt) {
            if (now - lastVisitAt > 1000) {
                lastVisitAt = now;
                System.out.println(currentQPS());
                count.set(1);
            }
        }
        count.incrementAndGet();
        return isOverLimit();
    }

    public static void main(String[] args) {
        RateLimiter rateLimiter = new FixedWindowRateLimiterWithoutMultiThread();
        new Thread(() -> {
            while (true) {
                rateLimiter.visit();
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();

        new Thread(() -> {
            rateLimiter.visit();
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();

    }
}