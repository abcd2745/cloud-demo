package com.lc.cloud.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

/**
 * https://docs.spring.io/spring-boot/docs/current/reference/html/index.html
 */
@SpringBootApplication
@EnableConfigurationProperties
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

}
