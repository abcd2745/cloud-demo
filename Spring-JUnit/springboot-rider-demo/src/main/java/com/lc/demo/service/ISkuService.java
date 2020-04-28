package com.lc.demo.service;

import java.util.Map;

/**
 * @author Thinkpad
 */
public interface ISkuService {

    /**
     * sku信息
     *
     * @param skuId
     * @return
     */
    Map<String, Object> loadSkuInfo(String skuId);
}
