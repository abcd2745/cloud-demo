package com.lc.cloud.log4j2.split;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

/**
 * 参考：https://my.oschina.net/u/2300159/blog/887687
 */
@SpringBootApplication
public class SplitThreadApplication {

    public static void main(String[] args) {
        SpringApplication.run(SplitThreadApplication.class, args);
    }

}
