package com.lc.controller;

import com.lc.mapper.order.PosSalPosMstMapper;
import com.lc.order.IOrderService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.given;

@SpringBootTest
class OrderControllerTest {

    @MockBean
    private PosSalPosMstMapper posSalPosMstMapper;

    @Autowired
    private IOrderService orderService;

    @Test
    void selectMaxBillNo() {
        given(posSalPosMstMapper.selectMaxBillNo("11002054", "110020541")).willReturn("11002054120042000001");
        String maxBillNo = orderService.selectMaxBillNo("11002054", "110020541");
        System.out.println(maxBillNo);
        assertEquals(maxBillNo, "11002054120042000002");
    }
}