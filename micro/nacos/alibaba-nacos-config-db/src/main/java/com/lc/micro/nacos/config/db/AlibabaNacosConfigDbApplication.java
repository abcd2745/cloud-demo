package com.lc.micro.nacos.config.db;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@EnableDiscoveryClient
@SpringBootApplication
public class AlibabaNacosConfigDbApplication {

    public static void main(String[] args) {
        SpringApplication.run(AlibabaNacosConfigDbApplication.class, args);
    }

    @Slf4j
    @RestController
    @RefreshScope
    static class TestController {

        @Value("${spring.datasource.driver-class-name:}")
        private String title;

        @Value("${spring.datasource.username:}")
        private String userName;

        @GetMapping("/test")
        public String hello() {
            return title + "\t" + userName;
        }

    }

}
