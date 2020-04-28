package com.github.demo.service;

import com.github.demo.base.ColumnFilter;
import com.github.demo.base.TransactionBaseTest;
import com.github.demo.model.UserModel;
import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.ExpectedDatabase;
import com.github.springtestdbunit.assertion.DatabaseAssertionMode;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by zhuoshangyi on 2016/10/22.
 */
public class ExpectedDataAndColumnFilterOnMethodTest extends TransactionBaseTest {

    @Autowired
    private UserService userService;

    /**
     * t_user id自增长，没执行一次，addUser(),得到的id不一样
     * assertionMode：测试结果和DataSet数据文件断言的类型。
     * DatabaseAssertionMode.DEFAULT作为一个标准的DbUnit测试运行，执行一个完整的期望数据集和实际数据集的比对。
     * DatabaseAssertionMode.NON_STRICT将忽略没有在期望数据集中出现，但是在实际数据集中出现的 表和列名。
     */
    @Test
    @DatabaseSetup("/dataset/t_user_s1.xml")
    @ExpectedDatabase(value = "/dataset/t_user_e2.xml",
            assertionMode = DatabaseAssertionMode.NON_STRICT,
            columnFilters = {ColumnFilter.class})
    public void testIColumnFilter() {
        UserModel userModel = new UserModel();
        userModel.setUserName("132");
        userModel.setAge(27);
        userModel.setPassword("test1");
        userService.addUser(userModel);
    }

}
