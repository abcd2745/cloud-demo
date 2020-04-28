package com.lc.repository.dto;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author jit
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class PosSalPosPayLog {

    @JsonProperty("Id")
    private String sid;

    @JsonProperty("StoreId")
    private String storeId;

    @JsonProperty("OrderCode")
    private String billNo;

    private String tillId;

    @JsonProperty("PosId")
    private String posId;

    @JsonProperty("ModeCode")
    private String payId;

    @JsonProperty("PayChannel")
    private String payChannel;

    @JsonProperty("PayMoney")
    private BigDecimal payMoney;

    @JsonProperty("AlPayAmount")
    private BigDecimal alpayAmount;

    @JsonProperty("Detail")
    private String detail;

    @JsonProperty("PayState")
    private boolean payState;

    @JsonProperty("VipCode")
    private String vipId;

    private String isUp;

    @JsonProperty("CreateUserId")
    private String createUserId;

    private Date createDate;

    private String modifyUserId;

    private Date modifyDate;

    private String recordState;

}