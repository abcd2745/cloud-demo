package com.lc.controller;

import com.lc.order.IOrderService;
import com.lc.repository.dto.OrderBalanceReqDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class OrderController {

    @Autowired
    private IOrderService orderService;

    /**
     * 返回订单号：最大billNo+1
     *
     * @param balanceReqDto
     * @return
     */
    @PostMapping(value = "/selectMaxBillNo")
    public Object selectMaxBillNo(@RequestBody OrderBalanceReqDto balanceReqDto) {
        String nextBillNo = orderService.selectMaxBillNo(balanceReqDto.getStoreId(), balanceReqDto.getPosId());
        return nextBillNo;
    }
}
