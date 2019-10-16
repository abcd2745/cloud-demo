package com.lc.cloud.db.dbrider;

import com.github.database.rider.spring.api.DBRider;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;


@RunWith(SpringRunner.class)
@SpringBootTest(properties = "spring.config.location=classpath:config/datasets/application-test.yml")
@DBRider
public class DbRiderSuperTest {

    @Autowired
    private DataSource dataSource;

    @Test
    public void testConnection() throws Exception {
        Assert.assertNotNull(dataSource);
    }
}
