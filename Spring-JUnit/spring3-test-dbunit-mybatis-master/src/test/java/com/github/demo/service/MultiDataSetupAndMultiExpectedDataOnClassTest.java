package com.github.demo.service;

import com.github.demo.base.ColumnFilter;
import com.github.demo.base.TransactionBaseTest;
import com.github.demo.model.AddressModel;
import com.github.demo.model.UserModel;
import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.DatabaseSetups;
import com.github.springtestdbunit.annotation.ExpectedDatabase;
import com.github.springtestdbunit.annotation.ExpectedDatabases;
import com.github.springtestdbunit.assertion.DatabaseAssertionMode;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *  比较多张表，需要使用ExpectedDatabases
 *  ExpectedDatabase 定义table
 *  由于默认情况是select * from tableName ，存在排序问题。所以也需要定义query，指定查actualTable的结果顺序
 */
@DatabaseSetups({
        @DatabaseSetup("/dataset/t_user_s1.xml"),
        @DatabaseSetup("/dataset/t_address_s1.xml")
})
@ExpectedDatabases({
        @ExpectedDatabase(value = "/dataset/t_user_e3.xml",
                query = "select * from t_user order by id asc",
                table = "t_user",
                assertionMode = DatabaseAssertionMode.NON_STRICT,
                columnFilters = {ColumnFilter.class}),
        @ExpectedDatabase(value = "/dataset/t_address_e1.xml",
                table = "t_address",
                assertionMode = DatabaseAssertionMode.NON_STRICT)
})
public class MultiDataSetupAndMultiExpectedDataOnClassTest extends TransactionBaseTest {

    @Autowired
    private UserService userService;

    /**
     * TODO  DbUnitAssert.assertEquals()，IDataSet expectedDataSet 只加载到了一张表，为什么？
     *
     * @throws Exception
     */
    @Test
    public void testDoNothing() throws Exception {
        UserModel user = userService.getUserById(2);
        user.setUserName("新测试2");
        userService.updateUserById(user);
        AddressModel userAddress = userService.getUserAddressByUserId(user.getId());
        userAddress.setPhone("222222222222");
        userService.updateUserAddressByUserId(userAddress);
    }
}