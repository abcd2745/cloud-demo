package com.lc.cloud.demo.config.prop;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource(value = "classpath:config/test2.yml",factory = YmlPropertiesFactory.class)
@ConfigurationProperties(prefix = "my2")
@Data
public class YmlConfigBean {

    private String name;

    private int age;

    private int number;

    private String uuid;

    private int max;

    private String value;

    private String greeting;
}
