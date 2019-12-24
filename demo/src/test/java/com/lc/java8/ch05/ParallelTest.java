package com.lc.java8.ch05;

import org.junit.Assert;
import org.junit.Test;

import java.util.stream.LongStream;

public class ParallelTest {

    @Test
    public void test() {

        long start = System.currentTimeMillis();
        long result = sum(100_000_000);
        System.out.println("顺序耗时：" + (System.currentTimeMillis() - start) + "毫秒。结果：" + result);
        long start2 = System.currentTimeMillis();
        long result2 = parallelSum(100_000_000);
        System.out.println("并行耗时：" + (System.currentTimeMillis() - start2) + "毫秒。结果：" + result2);

        long start3 = System.currentTimeMillis();
        long result3 = parallelSum2(100_000_000);
        System.out.println("并行耗时：" + (System.currentTimeMillis() - start3) + "毫秒。结果：" + result3);
        Assert.assertEquals(result, result3);
    }

    /**
     * 给定数n，计算 1~n 的值汇总
     */
    public long sum(long n) {
        return LongStream.rangeClosed(0, n).sum();
    }

    public long parallelSum(long n) {
        return LongStream.rangeClosed(0, n).parallel().sum();
    }

    public long parallelSum2(long n) {
        return LongStream.rangeClosed(0, n).parallel().reduce(0L, Long::sum);
    }
}
