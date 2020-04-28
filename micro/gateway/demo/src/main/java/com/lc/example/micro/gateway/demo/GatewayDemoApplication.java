package com.lc.example.micro.gateway.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

/**
 * webflux与mvc不兼容，如类路径中引用了webmvc会导致项目启动不起来
 * https://blog.csdn.net/yichen0429/article/details/98203775
 */
@SpringBootApplication
public class GatewayDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(GatewayDemoApplication.class, args);
    }

    @Bean
    public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
        return builder.routes()
                .route(r -> r.header("storeid", "11002054")
                                .and()
                                .path("/posOSS/**")
//                        .filters(f -> f.addRequestHeader("Hello", "World"))
                                .uri("http://localhost:8081/posOSS")
                )
                .route(r -> r.header("storeid", "11002126")
                        .and()
                        .path("/posOSS/**")
//                        .filters(f -> f.addRequestHeader("Hello", "World"))
                        .uri("http://10.0.17.17:8080/posOSS"))
                .build();

    }

}
