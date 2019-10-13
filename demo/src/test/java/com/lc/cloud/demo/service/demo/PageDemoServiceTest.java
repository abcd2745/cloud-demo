package com.lc.cloud.demo.service.demo;

import com.github.pagehelper.PageInfo;
import com.lc.cloud.demo.repository.dao.master.MasterMapper;
import com.lc.cloud.demo.repository.entity.master.MasterDto;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.hamcrest.CoreMatchers.is;

@RunWith(SpringRunner.class)
@SpringBootTest("spring.config.location=classpath:config/prop/application.yml")
public class PageDemoServiceTest {

    @Autowired
    private PageDemoService pageDemoService;

    @Autowired
    private MasterMapper masterMapper;

    @Test
    public void findDemoList() {
        PageInfo<String> pageInfo = pageDemoService.findDemoList(1, 15, "F");
        Assert.assertThat("F01B710004110", is(pageInfo.getList().get(0)));
    }

    @Test
    public void loadSkuDtoTest() {
        MasterDto masterDto = masterMapper.loadSkuDto("F01B710004110");
        Assert.assertThat("2", is(masterDto.getBigTypeCode()));
    }
}
