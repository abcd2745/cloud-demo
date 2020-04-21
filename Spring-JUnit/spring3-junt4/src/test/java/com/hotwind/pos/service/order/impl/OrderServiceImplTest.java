package com.hotwind.pos.service.order.impl;

import com.hotwind.pos.MockitoBeansTestExecutionListener;
import com.hotwind.pos.mapper.order.PosSalPosMstMapper;
import com.hotwind.pos.service.order.IOrderService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
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
public class OrderServiceImplTest {

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Autowired
    private IOrderService orderService;

    @Spy
    private PosSalPosMstMapper posSalPosMstMapper;

    @Test
    public void test() {
        given(posSalPosMstMapper.selectMaxBillNo("11002054", "110020541")).willReturn("11002054199010100001");
        String maxBillNo = orderService.selectMaxBillNo("110002054", "110020542");
        Assert.assertThat("11002054199010100002", is(maxBillNo));
    }
}