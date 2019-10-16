package com.lc.cloud.db.sql;

import com.lc.cloud.demo.repository.dao.master.MasterMapper;
import com.lc.cloud.demo.repository.entity.master.MasterSku;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlConfig;
import org.springframework.test.context.jdbc.SqlGroup;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.springframework.test.context.jdbc.Sql.ExecutionPhase.AFTER_TEST_METHOD;
import static org.springframework.test.context.jdbc.SqlConfig.TransactionMode.ISOLATED;

/**
 *
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class DbTest {

    @Autowired
    private MasterMapper masterMapper;

    @Test
    //会在当前datasource下执行脚本，事务回滚后数据删除
    //‘/’开头表示从classpath根目录开始搜索，没有以此开头默认在测试类所在包下。也可使用classpath:、file:、http: 开头
//    @Sql("/config/sql/sku.sql")
    @Sql("classpath:config/sql/sku.sql")
    //加上事务处理，默认回滚
    @Transactional
    public void test() {
        MasterSku sku = masterMapper.loadSku("1104110");
        Assert.assertThat("11", equalTo(sku.getStyleId()));
    }

    /**
     * 手工清理插入的资源
     */
    @Test
    @SqlGroup({
            @Sql("/config/sql/sku.sql"),
            @Sql(scripts = "/config/sql/clean-up.sql",
                    executionPhase = AFTER_TEST_METHOD,
                    config = @SqlConfig(transactionMode = ISOLATED))
    })
    public void test2() {
        MasterSku sku = masterMapper.loadSku("1104110");
        Assert.assertThat("11", equalTo(sku.getStyleId()));
    }
}
