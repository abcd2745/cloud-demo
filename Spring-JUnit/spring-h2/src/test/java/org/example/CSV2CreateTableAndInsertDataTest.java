package org.example;

import java.sql.ResultSet;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 * h2 通过csv文件导入数据
 */
public class CSV2CreateTableAndInsertDataTest {

    private static Connection conn;

    /**
     * 内存模式:在内存中运行，关闭连接后数据库将被清空  jdbc:h2:mem:DBName;DB_CLOSE_DELAY=-1
     * 嵌入式:数据库持久化存储为单个文件  jdbc:h2:file:~/.h2/DBName;AUTO_SERVER=TRU
     *
     * @throws Exception
     */
    @BeforeClass
    public static void setUp() throws Exception {
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection("jdbc:h2:mem:lc;MODE=MYSQL;DB_CLOSE_DELAY=-1");
    }

    @AfterClass
    public static void tearDown() throws Exception {
        if (conn != null) {
            conn.close();
        }
    }

    @Test
    public void test() throws Exception {
        Statement stmt = conn.createStatement();
        String path = this.getClass().getResource("").getPath();
        stmt.execute("CREATE TABLE a_new AS SELECT * FROM CSVREAD('" + path + "/a_new.csv');");
        ResultSet rs = stmt.executeQuery("select * from a_new where city_id = '10022002'");
        while (rs.next()) {
            System.out.println(rs.getString("city_id"));
        }
        stmt.close();
    }

}