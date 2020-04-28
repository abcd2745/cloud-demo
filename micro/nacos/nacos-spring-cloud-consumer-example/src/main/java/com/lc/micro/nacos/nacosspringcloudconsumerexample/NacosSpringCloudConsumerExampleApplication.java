package com.lc.micro.nacos.nacosspringcloudconsumerexample;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@EnableDiscoveryClient
@SpringBootApplication
//方式三：Feign调用
@EnableFeignClients
public class NacosSpringCloudConsumerExampleApplication {

    public static void main(String[] args) {
        SpringApplication.run(NacosSpringCloudConsumerExampleApplication.class, args);
    }

    /**
     * 调用方式一
     */
    @Slf4j
    @RestController
    static class TestController {

        @Autowired
        LoadBalancerClient loadBalancerClient;

        @GetMapping("/test")
        public String test() {
            // 通过spring cloud common中的负载均衡接口选取服务提供节点实现接口调用
            ServiceInstance serviceInstance = loadBalancerClient.choose("1111231");
            String url = serviceInstance.getUri() + "/hello?name=" + "didi";
            RestTemplate restTemplate = new RestTemplate();
            String result = restTemplate.getForObject(url, String.class);
            return "Invoke : " + url + ", return : " + result;
        }
    }

    /**
     * 调用方式二
     */
    @Slf4j
    @RestController
    static class TestController2 {

        @Autowired
        RestTemplate restTemplate;

        @GetMapping("/test2")
        public String test() {
            String result = restTemplate.getForObject("http://1111231/hello?name=didi", String.class);
            return "Return : " + result;
        }
    }

    @Bean
    @LoadBalanced
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    /**
     * 方式三
     * @return
     */
    @Slf4j
    @RestController
    static class TestController3 {

        @Autowired
        Client client;

        @GetMapping("/test3")
        public String test() {
            String result = client.hello("didi");
            return "Return : " + result;
        }
    }

    @FeignClient("1111231")
    interface Client {

        @GetMapping("/hello")
        String hello(@RequestParam(name = "name") String name);

    }
}
