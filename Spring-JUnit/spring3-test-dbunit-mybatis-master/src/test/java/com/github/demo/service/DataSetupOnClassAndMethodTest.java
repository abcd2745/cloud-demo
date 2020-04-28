package com.github.demo.service;

import com.github.demo.base.TransactionBaseTest;
import com.github.demo.model.UserModel;
import com.github.springtestdbunit.annotation.DatabaseOperation;
import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.DatabaseTearDown;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.hamcrest.CoreMatchers.is;

/**
 * Created by zhuoshangyi on 2016/10/21.
 */
//@DbUnitConfiguration(databaseConnection ={"dbUnitDatabaseConnection"} )
public class DataSetupOnClassAndMethodTest extends TransactionBaseTest {

    @Autowired
    private UserService userService;

    /**
     * 预设数据，不会改变真实数据库
     * DatabaseOperation.CLEAN_INSERT  每次都先执行delete_all ,再执行insert
     *
     * @throws Exception
     */
    @Test
    @DatabaseTearDown
    @DatabaseSetup(value = {"/dataset/t_user_s1.xml"},
            type = DatabaseOperation.CLEAN_INSERT)
    public void testCleanInsert() throws Exception {
        List<UserModel> allUserModels = userService.getAllUsers();
        Assert.assertNotNull(allUserModels);
        Assert.assertEquals(2, allUserModels.size());

        Assert.assertThat("测试2",is(allUserModels.get(0).getUserName()));
    }

}
