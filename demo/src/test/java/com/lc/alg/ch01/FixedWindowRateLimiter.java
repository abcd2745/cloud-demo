package com.lc.alg.ch01;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 固定窗口
 */
public class FixedWindowRateLimiter implements RateLimiter, Runnable {

    private static final int DEFAULT_ALLOWED_VISIT_PER_SECOND = 5;

    private final int maxVisitPerSecond;

    private AtomicInteger count;

    FixedWindowRateLimiter() {
        this.maxVisitPerSecond = DEFAULT_ALLOWED_VISIT_PER_SECOND;
        this.count = new AtomicInteger();
    }

    FixedWindowRateLimiter(int maxVisitPerSecond) {
        this.maxVisitPerSecond = maxVisitPerSecond;
        this.count = new AtomicInteger();
    }

    @Override
    public boolean isOverLimit() {
        return currentQPS() > maxVisitPerSecond;
    }

    @Override
    public int currentQPS() {
        return count.get();
    }

    @Override
    public boolean visit() {
        count.incrementAndGet();
        System.out.print(isOverLimit());
        return isOverLimit();
    }

    @Override
    public void run() {
        System.out.println(this.currentQPS());
        count.set(0);
    }

    public static void main(String[] args) {
        ScheduledExecutorService scheduledExecutorService = Executors.newSingleThreadScheduledExecutor();
        FixedWindowRateLimiter rateLimiter = new FixedWindowRateLimiter();
        scheduledExecutorService.scheduleAtFixedRate(rateLimiter, 0, 1, TimeUnit.SECONDS);
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
            while (true) {
                rateLimiter.visit();
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
}