package com.hotwind.pos.mapper.order;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component("posSalPosMstMapper")
public interface PosSalPosMstMapper {


    /**
     * 通过门店编号与门店POS机器号查询当前最大的订单号
     *
     * @param storeId
     * @param posId
     * @return
     */
    String selectMaxBillNo(@Param(value = "storeId") String storeId, @Param(value = "posId") String posId);

    /**
     * 验证订单是否已存在
     *
     * @param billNo
     * @return
     */
    String loadBillNo(@Param("billNo") String billNo);
}
