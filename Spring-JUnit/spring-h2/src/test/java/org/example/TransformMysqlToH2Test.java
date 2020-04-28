package org.example;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.Assert.*;

public class TransformMysqlToH2Test {

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
        String sql = TransformMysqlToH2.transform("hotwind.sql");
//        Path path = Paths.get(TransformMysqlToH2.class.getResource("/b_old.sql").toURI());
//        String sql = new String(Files.readAllBytes(path), Charset.forName("utf-8"));
        Statement stmt = conn.createStatement();
        //如果存在USER_INFO表就先删除USER_INFO表
        stmt.execute(sql);

//        ResultSet rs = stmt.executeQuery("select * from django_content_type where id = 7");
//        while (rs.next()) {
//            System.out.println(rs.getString("app_label"));
//        }
        stmt.close();
    }

    @Test
    public void LianHeSuoYintest() throws Exception {
        String sql = TransformMysqlToH2.transform("联合索引.sql");
//        Path path = Paths.get(TransformMysqlToH2.class.getResource("/b_old.sql").toURI());
//        String sql = new String(Files.readAllBytes(path), Charset.forName("utf-8"));
        Statement stmt = conn.createStatement();
        //如果存在USER_INFO表就先删除USER_INFO表
        stmt.execute(sql);
        stmt.execute("INSERT INTO  django_content_type(id, app_label, model) VALUES (7, '1', '1');");
        ResultSet rs = stmt.executeQuery("select * from django_content_type where id = 7");
        while (rs.next()) {
            System.out.println(rs.getString("app_label"));
        }
        stmt.close();
    }

    @Test
    public void ziZengZhangZhuJiantest() throws Exception {
        String sql = TransformMysqlToH2.transform("自增长主键.sql");
//        Path path = Paths.get(TransformMysqlToH2.class.getResource("/b_old.sql").toURI());
//        String sql = new String(Files.readAllBytes(path), Charset.forName("utf-8"));
        Statement stmt = conn.createStatement();
        //如果存在USER_INFO表就先删除USER_INFO表
        stmt.execute(sql);
        stmt.execute("INSERT INTO hw_store_weather(Weather, Wind, Temperture, CreateDate, ModifyDate, ModifyBy) VALUES ('yu1', '北风微风', '25 ~ 20℃', '2016-05-26', NULL, NULL);");
        stmt.execute("INSERT INTO hw_store_weather(Weather, Wind, Temperture, CreateDate, ModifyDate, ModifyBy) VALUES ('yu2', '北风微风', '25 ~ 20℃', '2016-05-26', NULL, NULL);");
        ResultSet rs = stmt.executeQuery("select * from hw_store_weather ");

        ResultSetMetaData rsmd = rs.getMetaData();
        //获取总列数
        int columnCount = rsmd.getColumnCount();
        while (rs.next()) {
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rs.getObject(i) + "\t");
            }
            System.out.println();
        }
        stmt.close();
    }

    @Test
    public void datetimeDaiShuZitest() throws Exception {
        String sql = TransformMysqlToH2.transform("datetime带数字.sql");
//        Path path = Paths.get(TransformMysqlToH2.class.getResource("/b_old.sql").toURI());
//        String sql = new String(Files.readAllBytes(path), Charset.forName("utf-8"));
        Statement stmt = conn.createStatement();
        //如果存在USER_INFO表就先删除USER_INFO表
        stmt.execute(sql);
        stmt.execute("INSERT INTO check_unit_result(schema_name, table_name, unitid, checkdate) VALUES ('hotwind_pos', 'hw_pos_store_discount', '11002054', '2020-05-30 10:09:19');");
        ResultSet rs = stmt.executeQuery("select * from check_unit_result ");

        ResultSetMetaData rsmd = rs.getMetaData();
        //获取总列数
        int columnCount = rsmd.getColumnCount();
        while (rs.next()) {
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rs.getObject(i) + "\t");
            }
            System.out.println();
        }
        stmt.close();
    }

    @Test
    public void currentTimestampDaiShuZitest() throws Exception {
        String sql = TransformMysqlToH2.transform("CURRENT_TIMESTAMP带数字.sql");
//        Path path = Paths.get(TransformMysqlToH2.class.getResource("/b_old.sql").toURI());
//        String sql = new String(Files.readAllBytes(path), Charset.forName("utf-8"));
        Statement stmt = conn.createStatement();
        //如果存在USER_INFO表就先删除USER_INFO表
        stmt.execute(sql);
        stmt.execute("INSERT INTO check_unit_table(schema_name, table_name, lastupdatetime) VALUES ('swmsunit', 'allocationnotice', '2019-10-23 11:43:21');");
        ResultSet rs = stmt.executeQuery("select * from check_unit_table ");

        ResultSetMetaData rsmd = rs.getMetaData();
        //获取总列数
        int columnCount = rsmd.getColumnCount();
        while (rs.next()) {
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rs.getObject(i) + "\t");
            }
            System.out.println();
        }
        stmt.close();
    }

    @Test
    public void viewTest() throws Exception {
        String sql = TransformMysqlToH2.transform("视图.sql");
        Statement stmt = conn.createStatement();
        stmt.execute(sql);

        stmt.execute("INSERT INTO `hw_pos_salposdtl`(`AutoIncID`, `BillNo`, `BarCode`, `StyleID`, `StyleName`, `PUnit`, `ColorID`, `SizeID`, `Qry`, `PlaceID`, `Price`, `RefPrice`, `Discount`, `Amount`, `Cost`, `SalMan`, `StorRate`, `PromMode`, `TradeMode`, `IsSpecial`, `IsDiscount`, `VipID`, `OriginBill`, `PosDateTime`, `Remark`, `Add1`, `Add2`, `Add3`, `Add4`, `ModifyUserID`, `ModifyDate`, `RecordState`) VALUES (1224, '11002054320021700005', 'F20M940607L', 'F20M9406', 'D1口袋带帽卫衣', NULL, '07', 'L', 5.0000, NULL, 127.8000, 269.0000, 0.4800, 639.0000, 1345.0000, '33861', NULL, NULL, '0', NULL, NULL, 'HW0006033007', NULL, '2020-02-11 10:12:42', NULL, NULL, NULL, '0', 269.0000, '33861', '2020-02-17 10:12:41.259244', 'Y');");
        stmt.execute("INSERT INTO `hw_pos_salposmst`(`BillNo`, `BillDate`, `StoreID`, `PosID`, `OrigBillNo`, `EmployID`, `BillType`, `DisRate`, `Qry`, `Amount`, `PayMoney`, `BackMoney`, `LeaveMoney`, `VipID`, `IsBalance`, `MonthFlag`, `IsShare`, `Sharedate`, `ShareMan`, `IsAudit`, `AuditDate`, `AuditMan`, `IsDebt`, `DebtDate`, `DebtMan`, `CreateMan`, `CreateDate`, `IsUp`, `IsDown`, `Remark`, `GiftMoney`, `GiftID`, `Add1`, `Add2`, `Add3`, `Add4`, `Add5`, `InChanl`, `ModifyUserID`, `ModifyDate`, `RecordState`, `IsWms`, `ToDrpFlag`, `mqDate`) VALUES ('11002054320021700005', '2020-02-10 10:12:42', '11002054', '110020543', NULL, '33861', '0', 0.0000, 34.00, 5113.8000, 5113.8000, 0.0000, 0.0500, 'HW0006033007', '1', '1', '0', '2015-12-31 00:00:00', NULL, '0', '2015-12-31 00:00:00', NULL, '0', '2015-12-31 00:00:00', NULL, '33861', PARSEDATETIME('2020-02-17 10:12:43','yyyy-MM-dd HH:mm:ss'), '0', '0', NULL, 0.0000, NULL, '00:06:29.5792826', '9', '200217_11002054318', 0.0000, 0.0000, 'Self', '33861', '2020-01-16 13:38:21.585959', 'Y', 1, '0', '2020-02-17 10:12:43.936800');");

        ResultSet rs = stmt.executeQuery("select * from pos_sal_dtl_activity_view ");
        stmt.close();
    }
}