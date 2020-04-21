package com.hotwind.pos.controller;

import com.hotwind.pos.repository.dto.OrderBalanceReqDto;
import com.hotwind.pos.service.order.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {

    @Autowired
    private IOrderService orderService;

    /**
     * 返回订单号：最大billNo+1
     *
     * @param balanceReqDto
     * @return
     */
    @RequestMapping(value = "/selectMaxBillNo", method = RequestMethod.POST)
    @ResponseBody
    public Object selectMaxBillNo(@RequestBody OrderBalanceReqDto balanceReqDto) {
        String nextBillNo = orderService.selectMaxBillNo(balanceReqDto.getStoreId(), balanceReqDto.getPosId());
        return nextBillNo;
    }
}
