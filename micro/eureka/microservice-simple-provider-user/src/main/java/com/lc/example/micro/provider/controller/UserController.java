package com.lc.example.micro.provider.controller;

import com.lc.example.micro.provider.dao.UserRepository;
import com.lc.example.micro.provider.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DiscoveryClient discoveryClient;

    @GetMapping("/{id}")
    public User findById(@PathVariable Long id) {
        Optional<User> findOne = userRepository.findById(id);
        return findOne.get();
    }
}
