package com.lc.cloud.demo.config.prop;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * yml @see YmlConfigBean.class
 */
@Component
@PropertySource(value = "classpath:config/test.properties")
@ConfigurationProperties(prefix = "my")
@Data
public class ConfigBean {

    private String name;

    private int age;

    private int number;

    private String uuid;

    private int max;

    private String value;

    private String greeting;
}
