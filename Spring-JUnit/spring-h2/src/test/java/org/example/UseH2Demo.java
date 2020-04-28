package org.example;
import	java.io.IOException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.UUID;

/**
 * 使用demo
 * h2 数据库可以不需要指定密码
 * https://www.jianshu.com/p/4a613dcf182c
 */
public class UseH2Demo {

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
        /**
         * 连接参数：
         * DB_CLOSE_DELAY：要求最后一个正在连接的连接断开后，不要关闭数据库
         * MODE=MySQL：兼容模式，H2兼容多种数据库，该值可以为：DB2、Derby、HSQLDB、MSSQLServer、MySQL、Oracle、PostgreSQL
         * AUTO_RECONNECT=TRUE：连接丢失后自动重新连接
         * AUTO_SERVER=TRUE：启动自动混合模式，允许开启多个连接，该参数不支持在内存中运行模式
         * TRACE_LEVEL_SYSTEM_OUT、TRACE_LEVEL_FILE：输出跟踪日志到控制台或文件， 取值0为OFF，1为ERROR（默认值），2为INFO，3为DEBUG
         * SET TRACE_MAX_FILE_SIZE mb：设置跟踪日志文件的大小，默认为16M
         */
        conn = DriverManager.getConnection("jdbc:h2:mem:lc;MODE=MYSQL;DB_CLOSE_DELAY=-1");
    }

    @AfterClass
    public static void tearDown() throws Exception {
        if(conn != null){
            conn.close();
        }
    }

    @Test
    public void test()  throws Exception{
        Statement stmt = conn.createStatement();
        //如果存在USER_INFO表就先删除USER_INFO表
        stmt.execute("DROP TABLE IF EXISTS USER_INFO");
        //创建USER_INFO表
        stmt.execute("CREATE TABLE USER_INFO(id VARCHAR(36) PRIMARY KEY,name VARCHAR(100),sex VARCHAR(4))");
        //新增
        stmt.executeUpdate("INSERT INTO USER_INFO VALUES('" + UUID.randomUUID()+ "','大日如来','男')");
        stmt.executeUpdate("INSERT INTO USER_INFO VALUES('" + UUID.randomUUID()+ "','青龙','男')");
        stmt.executeUpdate("INSERT INTO USER_INFO VALUES('" + UUID.randomUUID()+ "','白虎','男')");
        stmt.executeUpdate("INSERT INTO USER_INFO VALUES('" + UUID.randomUUID()+ "','朱雀','女')");
        stmt.executeUpdate("INSERT INTO USER_INFO VALUES('" + UUID.randomUUID()+ "','玄武','男')");
        stmt.executeUpdate("INSERT INTO USER_INFO VALUES('" + UUID.randomUUID()+ "','苍狼','男')");
        //删除
        stmt.executeUpdate("DELETE FROM USER_INFO WHERE name='大日如来'");
        //修改
        stmt.executeUpdate("UPDATE USER_INFO SET name='孤傲苍狼' WHERE name='苍狼'");
        //查询
        ResultSet rs = stmt.executeQuery("SELECT * FROM USER_INFO LIMIT 2");
        //遍历结果集
        while (rs.next()) {
            System.out.println(rs.getString("id") + "," + rs.getString("name")+ "," + rs.getString("sex"));
        }
        //释放资源
        stmt.close();
    }
}
