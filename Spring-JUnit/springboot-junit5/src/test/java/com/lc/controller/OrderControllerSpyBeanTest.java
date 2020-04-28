package com.lc.controller;

import com.lc.mapper.order.PosSalPosMstMapper;
import com.lc.order.IOrderService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.BDDMockito.given;

@SpringBootTest
public class OrderControllerSpyBeanTest {

    @SpyBean
    private PosSalPosMstMapper posSalPosMstMapper;

    @Autowired
    private IOrderService orderService;

    @Test
    void contextLoads() {
        given(posSalPosMstMapper.selectMaxBillNo("11002054", "110020541")).willReturn("11002054120042000001");
        String maxBillNo = orderService.selectMaxBillNo("11002054", "110020541");
        System.out.println(maxBillNo);
        assertEquals(maxBillNo, "11002054120042000002");
    }

    @Test
    void contextLoads2() {
        String storeId = "11002054";
        String posId = "110020541";
        given(posSalPosMstMapper.selectMaxBillNo(storeId, posId)).willReturn(null);
        String maxBillNo = orderService.selectMaxBillNo(storeId, posId);
        System.out.println(maxBillNo);
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyMMdd");
        String format = LocalDate.now().format(dateTimeFormatter);
        assertEquals(maxBillNo, posId+format+"00001");
    }

    @Test
    void contextLoads3() {
        String storeId = "11002054";
        String posId = "110020541";
        //默认查出来任何数据都是null
        given(posSalPosMstMapper.loadBillNo(anyString())).willReturn(null);
        String maxBillNo = orderService.selectMaxBillNo(storeId, posId);
        System.out.println(maxBillNo);
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyMMdd");
        String format = LocalDate.now().format(dateTimeFormatter);
        assertEquals(maxBillNo, posId+format+"00001");
    }
}
