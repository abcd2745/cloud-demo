package com.lc.cloud.demo.controller;

import com.lc.cloud.demo.config.prop.ConfigBean;
import com.lc.cloud.demo.config.prop.YmlConfigBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ConfigBeanController {

    @Autowired
    private ConfigBean configBean;

    @Autowired
    private YmlConfigBean ymlConfigBean;

    @GetMapping("/getConfigBean")
    public ConfigBean getConfigBean() {
        return configBean;
    }

    @GetMapping("/getYmlConfigBean")
    public YmlConfigBean getYmlConfigBean() {
        return ymlConfigBean;
    }
}
