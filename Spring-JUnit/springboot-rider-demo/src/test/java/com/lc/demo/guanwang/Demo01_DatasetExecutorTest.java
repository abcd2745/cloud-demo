package com.lc.demo.guanwang;

import com.github.database.rider.core.configuration.DataSetConfig;
import com.github.database.rider.core.connection.ConnectionHolderImpl;
import com.github.database.rider.core.dataset.DataSetExecutorImpl;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;

import java.sql.*;
import static org.assertj.core.api.Assertions.assertThat;

/**
 * 编码方式，自定义DatasetExecutor
 */
public class Demo01_DatasetExecutorTest {

    private static DataSetExecutorImpl executor;

    private static Connection connection;

    /**
     * 1.先建立Connection对象
     */
    @BeforeAll
    public static void setup() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        connection = DriverManager.getConnection(
                "jdbc:mysql://10.0.17.21:3306/hotwind?characterEncoding=utf8&autoReConnect=true&useSSL=false&allowPublicKeyRetrieval=true",
                "pos",
                "hotwind"
        );

        executor = DataSetExecutorImpl.instance(new ConnectionHolderImpl(connection));
    }

    @AfterAll
    public static void tearDown() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }

    @Test
    public void test() throws SQLException {
        //加载dataset文件
        DataSetConfig dataSetConfig = new DataSetConfig("datasets/sku.yml");


        executor.createDataSet(dataSetConfig);

        Statement statement = connection.createStatement();

        ResultSet rs = statement.executeQuery("select * from hw_master_sku ");

        assertThat(rs).isNotNull();
        assertThat(rs.getString(1)).isEqualTo("01L240809L");

    }
}
