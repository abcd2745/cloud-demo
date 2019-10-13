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

    @Mock
    private PageMapper pageMapper;

    @InjectMocks
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