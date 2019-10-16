package com.lc.example.micro.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * Eureka 概念
 * 1.Register -- 服务注册
 * Eureka Client向Eureka Server注册时，client 提供自身的元数据
 * 2.Renew -- 服务续约
 * Eureka Client默认每<b>30s</b>发送一次心跳进行服务续约，告知Eureka Server自身可用
 * 如果Eureka Server在<b>90s</b>内未收到心跳检测，则删除Eureka Client示例
 * 3.Fetch Registries -- 获取服务注册列表信息
 * Eureka Client 本地缓存服务注册表信息，默认使用json格式通信（支持xml格式）
 * 4.Cancel -- 服务下线
 * 调用代码：DiscoveryManager.getInstance().shutdownComponent();
 * 5.Eviction -- 服务剔除
 * 90s内未发送服务器续约，Eureka Server会将实例从服务注册列表中删除，即服务剔除
 * <p>
 * 自我保护模式：
 * 如果Eureka Server收到的心跳包不足正常值的85%（可配置）就会进入自我保护模式，在这种模式下，Eureka Server不会删除任何服务信息
 * </P>
 */
@SpringBootApplication
@EnableEurekaServer
public class MicroserviceDiscoveryEurekaApplication {

    public static void main(String[] args) {
        SpringApplication.run(MicroserviceDiscoveryEurekaApplication.class, args);
    }

}
