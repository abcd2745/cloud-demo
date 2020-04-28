package com.lc.repository.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单新增dto
 *
 * @author abcd2
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderReqDto {

    @JsonProperty("OrderGuid")
    private String orderGuid;

    @JsonProperty("StoreId")
    private String storeId;

    @JsonProperty("StoreName")
    private String storeName;

    @JsonProperty("PosId")
    private String posId;


    @JsonProperty("OrderCode")
    private String billNo;

    @JsonProperty("CouponId")
    private String couponId;

    /**
     * 会员号
     */
    @JsonProperty("OrderVipCode")
    private String vipId;

    @JsonProperty("CreateUserName")
    private String createUserId;

    @JsonProperty("OldOrderCode")
    private String orgBillNo;

    /**
     * 手工单号码
     */
    @JsonProperty("ManualSaleId")
    private String manualSaleId;

    @JsonProperty("Remark")
    private String mstRemark;

    /**
     * 身份证号码
     */
    @JsonProperty("UserIDCard")
    private String idCard;

    /**
     * 主表中应收金额
     */
    @JsonProperty("OrderPrice")
    private BigDecimal amount;

    /**
     * 未打折的原价的总金额
     */
    @JsonProperty("OrderTotalOriginalPrice")
    private BigDecimal orderTotalOriginalPrice;

    @JsonProperty("OrderTotalPrice")
    private BigDecimal orderTotalPrice;

    @JsonProperty("ActualTotalPrice")
    private BigDecimal actualTotalPrice;

    @JsonProperty("OrderPayPrice")
    private BigDecimal payMoney;

    @JsonProperty("OrderBackMoney")
    private BigDecimal backMoney;

    @JsonProperty("OrderNoPaid")
    private BigDecimal leaveMoney;

    @JsonProperty("DiscountCode")
    private String discountCode;

    @JsonProperty("StoreDiscountId")
    private String storeDiscountId;

    @JsonProperty("InnerDiscountCode")
    private String innerDiscountCode;

    @JsonProperty("BillDate")
    private String billDate;

    @JsonProperty("CreateTime")
    private String createTime;

    @JsonIgnore
    private Date serviceCreateTime;

    /**
     * 买单时间
     */
    @JsonProperty("SacnProductTime")
    private String productTime;

    @JsonProperty("StockStore")
    private boolean stockStore;

}