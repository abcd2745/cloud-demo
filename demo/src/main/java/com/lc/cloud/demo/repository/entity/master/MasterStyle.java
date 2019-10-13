package com.lc.cloud.demo.repository.entity.master;

import lombok.Data;

@Data
public class MasterStyle {

    private String styleId;
    private String styleName;
    private String pUnitId;
    private String remark;
    private String customerId;
    private String createBy;
    private String createDate;
    private String modifyBy;
    private String modifyDate;

    /**
     * 是否删除
     */
    private boolean delete;
    private String image;
    private String attDId;
    private String haveShoebox;
    private String bigTypeCode;
    private String middleTypeCode;
    private String smallTypeCode;
    private String brandCode;
    private String sexCode;
    private String yearCode;
    private String seasonCode;
}
