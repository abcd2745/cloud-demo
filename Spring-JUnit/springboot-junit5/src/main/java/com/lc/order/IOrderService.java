package com.lc.order;

import com.lc.repository.dto.PosSalPosPayLog;

/**
 * @author jit
 */
public interface IOrderService {

    /**
     * 支付日志
     *
     * @param posPayLog
     * @return
     */
    int addPayLog(PosSalPosPayLog posPayLog);

    /**
     * 通过门店编号与门店POS机器号查询当前最大的订单号，+1
     *
     * @param storeId
     * @param posId
     * @return
     */
    String selectMaxBillNo(String storeId, String posId);
}
