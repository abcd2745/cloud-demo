package com.hotwind.pos.repository.dao;

import java.sql.*;

import javafx.geometry.Pos;
import org.dbunit.ext.h2.H2Connection;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import static org.junit.Assert.*;

public class PosSalPayLogDaoTest {

    /**
     * jdbc.driver=org.h2.Driver
     * jdbc.url=jdbc:h2:file:~/.h2/quickstart;AUTO_SERVER=TRUE;DB_CLOSE_DELAY=-1
     * jdbc.username=sa
     * jdbc.password=sa
     */

    private static PosSalPayLogDao posSalPayLogDao = new PosSalPayLogDao();

    private static Connection connection;

    private static H2Connection dbUnitConnection;

    /**
     * h2 数据库不需要指定密码
     * https://www.jianshu.com/p/4a613dcf182c
     *
     * @throws Exception
     */
    @BeforeClass
    public static void setUp() throws Exception {
        Class.forName("org.h2.Driver");
        connection = DriverManager.getConnection("jdbc:h2:mem:databaseName;MODE=MYSQL;DB_CLOSE_DELAY=-1");
    }

    @Test
    public void test() throws SQLException {
        System.out.println(connection.getSchema());
        Statement stmt = connection.createStatement();
        stmt.execute("show databases");
        ResultSet rs = stmt.getResultSet();

    }

}