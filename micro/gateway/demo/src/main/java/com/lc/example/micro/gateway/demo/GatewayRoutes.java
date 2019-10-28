package com.lc.example.micro.gateway.demo;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GatewayRoutes {

    @Bean
    public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
        return builder.routes()
                .route("path_route", r -> r.path("/java/**")
                        .filters(f -> f.stripPrefix(1))
                        .uri("http://localhost:8090/demo.json"))
                .build();
    }

    /**
     *  @Bean
     *     public RouteLocator routeLocator(RouteLocatorBuilder builder) {
     *        return builder.routes()
     *         .route(p -> p
     *             .predicate(exchange -> exchange.getRequest().getPath().subPath(0).toString().startsWith(("/openhome/")))
     *             .filters(f -> f.filter((exchange, chain) -> {
     *                 ServerHttpRequest req = exchange.getRequest();
     *                 addOriginalRequestUrl(exchange, req.getURI());
     *                 String path = req.getURI().getRawPath();
     *                 String newPath = path.replaceAll("/openhome/(?<remaining>.*)", "/${remaining}");
     *                 ServerHttpRequest request = req.mutate()
     *                         .path(newPath)
     *                         .build();
     *
     *                 exchange.getAttributes().put(GATEWAY_REQUEST_URL_ATTR, request.getURI());
     *
     *                 return chain.filter(exchange.mutate().request(request).build());
     *             }))
     *             .uri("https://openhome.cc"))
     *         .build();
     *     }
     */
}