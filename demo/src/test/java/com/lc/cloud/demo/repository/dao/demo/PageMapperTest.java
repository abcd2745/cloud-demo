package com.lc.cloud.demo.repository.dao.demo;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PageMapperTest {

    @Autowired
    private PageMapper pageMapper;

    /**
     * 加载h2 数据库（测试下application.yml，则成立）
     * 加载154 ，则多个，不成立
     */
    @Test
    public void findSku() {
        List<String> styleIdList = pageMapper.findSku("F");
        Assert.assertEquals("F01B710004110", styleIdList.get(0));
    }
}
