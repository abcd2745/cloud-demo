package com.lc.cloud.demo.repository.dao.master;

import com.lc.cloud.demo.repository.entity.master.MasterSku;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MasterMapperTest {

    @Autowired
    private MasterMapper masterMapper;

    @Test
    public void loadSku() {
        MasterSku masterSku = masterMapper.loadSku("01L240809L");
        Assert.assertEquals("01L2408", masterSku.getStyleId());
    }
}
