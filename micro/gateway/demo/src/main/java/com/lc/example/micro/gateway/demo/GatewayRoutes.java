package com.lc.example.micro.gateway.demo;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GatewayRoutes {

    /**
     * gateway中使用RouteLocator的Bean进行路由转发，将请求进行处理，最后转发到目标的下游服务。
     * 本例中将请求转发到http://httpbin.org:80这个地址上
     * httpbin.org 这个网站能测试 HTTP 请求和响应的各种信息
     * 比如 cookie、ip、headers 和登录验证等，且支持 GET、POST 等多种方法
     *
     * @param builder
     * @return
     */
    @Bean
    public RouteLocator myRoutes(RouteLocatorBuilder builder) {
//        return builder.routes()
//                //适用于lambda表达式的接口称之为函数型接口(只有一个抽象方法)
//                //含参Lambda表达式：(x) -> x.f()
//                //添加一个route让请求“/hello”请求都转发到“http://httpbin.org/get”
//                .route(p -> p.path("/hello")
//                        .filters(f -> f.addRequestHeader("flag", "HelloWorld"))
//                        .uri("http://httpbin.org:80/get"))
//                .build();
        System.out.println("11");
        return builder.routes()
                .route("path_route", r -> r.path("/java/**")
                        .filters(f -> f.stripPrefix(1))
                        .uri("http://httpbin.org:80/get"))
                .build();
    }
}