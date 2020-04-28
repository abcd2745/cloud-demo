package com.lc.demo.controller;

import com.lc.demo.service.ISkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class HelloController {

    @Autowired
    private ISkuService skuService;

    @GetMapping("hello")
    public String hello() {
        Map<String, Object> skuIdMap = skuService.loadSkuInfo("01L240809L");
        return "hello" + skuIdMap.get("skuId");
    }

}
