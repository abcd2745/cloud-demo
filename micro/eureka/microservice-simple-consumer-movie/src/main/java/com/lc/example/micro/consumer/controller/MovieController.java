package com.lc.example.micro.consumer.controller;

import com.lc.example.micro.consumer.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class MovieController {

    @Autowired
    private RestTemplate restTemplate;

    /**
     * 调用远程接口
     * 服务提供者注册到eureka，注册的实例名称：microservice-simple-provider-user
     * 服务消费者通过 实例名 调用接口
     *
     * @param id
     * @return
     */
    @GetMapping("/user/{id}")
    public User findById(@PathVariable Long id) {
        return this.restTemplate.getForObject("http://microservice-simple-provider-user/" + id, User.class);
    }
}
