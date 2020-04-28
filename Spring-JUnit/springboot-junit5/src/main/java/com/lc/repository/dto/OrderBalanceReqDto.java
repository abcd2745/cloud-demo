package com.lc.repository.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 订单dto，非新增
 *
 * @author abcd2
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderBalanceReqDto {

    private String storeId;

    private String posId;

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public String getPosId() {
        return posId;
    }

    public void setPosId(String posId) {
        this.posId = posId;
    }
}
