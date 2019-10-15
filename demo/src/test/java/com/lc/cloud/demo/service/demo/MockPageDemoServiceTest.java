package com.lc.cloud.demo.service.demo;

import com.github.pagehelper.PageInfo;
import com.lc.cloud.demo.repository.dao.demo.PageMapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.CoreMatchers.is;
import static org.mockito.Mockito.when;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MockPageDemoServiceTest {

    //可以是interface、class,只是只运行是不进入具体的类中
    @Mock
    private PageMapper pageMapper;

    @InjectMocks // 只能只对类，运行时能进入类中，对指定的方法放回Mockito的值 可以使用@MockBean注解代替
    private PageDemoService pageDemoService;

    @Test
    public void test() {
        List<String> skuList = new ArrayList<>();
        skuList.add("F001");
        // 设置模拟对象的返回预期值
        when(pageMapper.findSku("F")).thenReturn(skuList);

        PageInfo<String> pageInfo = pageDemoService.findDemoList(1, 1, "F");

        Assert.assertThat("F001", is(pageInfo.getList().get(0)));
    }
}