package com.lc.cloud.demo.repository.entity.master;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class MasterSku {

    private String skuId;

    private String styleId;

    private String colorId;

    private String sizeId;

    private Date modifyDate;

    /**
     * 1 已删除
     * 0 未删除
     */
    private boolean delete;

    /**
     * 吊牌价
     */
    private BigDecimal price;

    private  BigDecimal salePrice;
}
