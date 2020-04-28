package org.example;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * 转换navicat导出的mysql的建表语句为h2的语法
 * 主要的要注意的点是:
 * 1.设置H2为mysql模式, 可以通过 SET MODE MYSQL;语句来实现 (jdbc连接时设置)
 * 2.'`'全部要去掉,CHARACTER 也不能要
 * 3.字段的字符集设置'COLLATE utf8_bin','SET utf8 COLLATE utf8_general_ci' 不支持, 需要删除, 如这样的'`operator` varchar(10) COLLATE utf8_bin NOT NULL'
 * 4.注释按道理也没问题的, 但是没有用, 所以删除了. USING BTREE 这种也不支持
 * 5.建表只有简单的，不支持后面的innerDb， 字符编码等
 * 6.bit 类型要改成 BOOLEAN ,
 * 7.'DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'不支持, 修改为H2类似的'AS CURRENT_TIMESTAMP'
 * 8.H2的索引名必须要全局唯一, 所以需要替换所有的索引名为全局唯一
 * 9.SET NAMES utf8mb4; SET FOREIGN_KEY_CHECKS = 0 ;SET FOREIGN_KEY_CHECKS = 1; 都不能使用
 *
 * @author tudesheng
 * @since 2016年6月20日 下午8:37:52
 */
public class TransformMysqlToH2 {

    public static String transform(String ddlName) throws Exception {

        Path path = Paths.get(TransformMysqlToH2.class.getResource("/" + ddlName).toURI());

        String content = new String(Files.readAllBytes(path), Charset.forName("utf-8"));
//        content = "SET MODE MYSQL;\n\n" + content;
        content = content.replaceAll("`", "");
        //这个是特有的，建表是有个bug，多了个''
        content = content.replaceAll("'\\\\'", "'");
        content = content.replaceAll("\\\\''", "'");
        //只有char ，varchar ，text 有
        content = content.replaceAll("\\).*(NOT)? NULL", ") NULL");
        content = content.replaceAll("SET utf8 COLLATE utf8_general_ci", " NULL");
        content = content.replaceAll("\\btext.*(NOT)? NULL", " NULL");
        content = content.replaceAll("\\bTEXT.*(NOT)? NULL", " NULL");
        content = content.replaceAll("USING BTREE", "");
        content = content.replaceAll("--.*", "");
        content = content.replaceAll("CHARACTER", "");
        content = content.replaceAll("bit\\(1\\)", "BOOLEAN");
        content = content.replaceAll("b'1'", "true");
        content = content.replaceAll("b'0'", "false");
        content = content.replaceAll("COLLATE.*(?=D)", "");
        content = content.replaceAll("COMMENT.*'(?=,)", "");
        content = content.replaceAll("\\).*;", ");");
        content = content.replaceAll("DEFAULT CURRENT_TIMESTAMP(\\(.*\\)) ON UPDATE CURRENT_TIMESTAMP(\\(.*\\))", " AS CURRENT_TIMESTAMP");
        content = content.replaceAll("SET NAMES utf8mb4\\s*;", "");
        content = content.replaceAll("SET FOREIGN_KEY_CHECKS\\s*=\\s*0\\s*;", "");
        content = content.replaceAll("SET FOREIGN_KEY_CHECKS\\s*=\\s*1\\s*;", "");
        //视图使用了  date_format   ，需要改成PARSEDATETIME
//        content = content.replaceAll('DATE_FORMAT')

        content = uniqueKey(content);
        content = uniqueIndex(content);

        System.out.println(content);

        return content;
    }

    private final static Pattern pattern = Pattern.compile("(?<=KEY )(.*?)(?= \\()");

    /**
     * h2的索引名必须全局唯一
     *
     * @param content sql建表脚本
     * @return 替换索引名为全局唯一
     */
    private static String uniqueKey(String content) {
        int inc = 0;
        Matcher matcher = pattern.matcher(content);
        StringBuffer sb = new StringBuffer();
        while (matcher.find()) {
            matcher.appendReplacement(sb, matcher.group() + inc++);
        }
        matcher.appendTail(sb);
        content = sb.toString();
        return content;
    }

    private final static Pattern pattern2 = Pattern.compile("INDEX\\s+(.*?)(?=\\()");

    private static String uniqueIndex(String content) {
        int inc = 0;
        Matcher matcher = pattern2.matcher(content);
        StringBuffer sb = new StringBuffer();
        while (matcher.find()) {
            matcher.appendReplacement(sb, "INDEX "+matcher.group(1) + inc++);
        }
        matcher.appendTail(sb);
        content = sb.toString();
        return content;
    }

}