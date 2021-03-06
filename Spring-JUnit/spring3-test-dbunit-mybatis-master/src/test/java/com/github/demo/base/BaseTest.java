package com.github.demo.base;

import com.github.springtestdbunit.DbUnitTestExecutionListener;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;

/**
 * Created by zhuoshangyi on 2016/9/3.
 */
@Ignore
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/spring*.xml")
@Rollback
@TestExecutionListeners({DependencyInjectionTestExecutionListener.class,
        DirtiesContextTestExecutionListener.class,
        DbUnitTestExecutionListener.class})
public class BaseTest {
}
