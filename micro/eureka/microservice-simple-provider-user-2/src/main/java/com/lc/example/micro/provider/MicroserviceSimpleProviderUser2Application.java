package com.lc.example.micro.provider;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class MicroserviceSimpleProviderUser2Application {

    public static void main(String[] args) {
        SpringApplication.run(MicroserviceSimpleProviderUser2Application.class, args);
    }

}
