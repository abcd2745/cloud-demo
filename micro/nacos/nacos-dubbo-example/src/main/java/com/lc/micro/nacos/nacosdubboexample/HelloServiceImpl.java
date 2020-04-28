package com.lc.micro.nacos.nacosdubboexample;

import com.lc.micro.nacos.HelloService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.stereotype.Component;

@Service
@Component
public class HelloServiceImpl implements HelloService {

    @Override
    public String hello(String name) {
        return "hello " + name;
    }

}
