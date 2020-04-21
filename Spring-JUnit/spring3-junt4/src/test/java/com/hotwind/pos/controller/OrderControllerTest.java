package com.hotwind.pos.controller;

import com.hotwind.pos.MockitoBeansTestExecutionListener;
import com.hotwind.pos.repository.dto.OrderBalanceReqDto;
import com.hotwind.pos.service.order.IOrderService;
import com.hotwind.pos.service.order.impl.OrderServiceImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.test.context.web.ServletTestExecutionListener;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/config/spring/*.*"})
@TransactionConfiguration(transactionManager = "txManager", defaultRollback = true)
@TestExecutionListeners({
        ServletTestExecutionListener.class,
        DependencyInjectionTestExecutionListener.class,
        DirtiesContextTestExecutionListener.class,
        TransactionalTestExecutionListener.class,
        MockitoBeansTestExecutionListener.class
})
public class OrderControllerTest {

    @Autowired
    private OrderController orderControl;

    @Mock
    private OrderServiceImpl orderService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void selectMaxBillNo() {
        OrderBalanceReqDto req = new OrderBalanceReqDto();
        req.setStoreId("11002054");
        req.setPosId("110020541");
//        orderControl.selectMaxBillNo(req);

        given(orderService.selectMaxBillNo("11002054", "110020541")).willReturn("11002054199010100001");
        Assert.assertThat("11002054199010100001", is(orderControl.selectMaxBillNo(req)));
    }
}