package com.lc.example.micro.consumer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RibbonController {
//
//    @Value("${eureka.client.provider.serviceId}")
//    private String serviceId;
//
//    @Autowired
//    private LoadBalancerClient loadBalancerClient;
//
//    /**
//     * 启动多个服务提供者，测试消费者负载均衡
//     *
//     * @return
//     */
//    @GetMapping("/testRibbon")
//    public String testRibbon() {
//        ServiceInstance instance = loadBalancerClient.choose(serviceId);
//        return instance.getHost() + ":" + instance.getPort();
//    }
}
