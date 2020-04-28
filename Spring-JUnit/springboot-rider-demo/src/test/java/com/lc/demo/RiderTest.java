package com.lc.demo;

import com.github.database.rider.core.api.dataset.DataSet;
import com.github.database.rider.core.api.dataset.ExpectedDataSet;
import com.github.database.rider.junit5.api.DBRider;
import com.lc.demo.mapper.SkuMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

@DBRider
@SpringBootTest
public class RiderTest {

    @Autowired
    private SkuMapper skuMapper;

    @Test
    @DataSet("sku.yml")
    @ExpectedDataSet("expectedSku.yml")
    public void demoTest() {
        assertThat(skuMapper).isNotNull();
        Map<String, Object> map = skuMapper.loadSkuInfo("01L240809L");
    }

}
