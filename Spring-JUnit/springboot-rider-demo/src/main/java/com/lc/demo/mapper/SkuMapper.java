package com.lc.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author Thinkpad
 */
@Mapper
@Component
public interface SkuMapper {

    /**
     * 查sku信息
     *
     * @param skuId
     * @return
     */
    Map<String, Object> loadSkuInfo(@Param("skuId") String skuId);

}
