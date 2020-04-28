package com.lc.demo.service.impl;

import com.lc.demo.mapper.SkuMapper;
import com.lc.demo.service.ISkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.awt.*;
import java.util.Map;

@Component
public class SkuService implements ISkuService {

    @Autowired
    private SkuMapper skuMapper;

    @Override
    public Map<String, Object> loadSkuInfo(String skuId) {
        return skuMapper.loadSkuInfo(skuId);
    }
}
