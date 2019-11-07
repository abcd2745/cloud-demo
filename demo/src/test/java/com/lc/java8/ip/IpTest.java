package com.lc.java8.ip;

import com.lc.cloud.demo.util.OkHttpUtil;
import org.junit.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IpTest {

    /**
     * 获取外网ip的取巧方法
     */
    @Test
    public void getV4IP() {
        String ip = "";
        String chinaz = "http://ip.chinaz.com";
        String rsp = OkHttpUtil.get(chinaz);
        System.out.println(rsp);
        Pattern p = Pattern.compile("\\<dd class\\=\"fz24\">(.*?)\\<\\/dd>");
        Matcher m = p.matcher(rsp);
        if (m.find()) {
            String ipstr = m.group(1);
            ip = ipstr;
        }
        System.out.println(ip);
        Pattern p2 = Pattern.compile("\\<dd>(.*)<a href.* class=\"col-blue02 pl5\">.*</dd>");
        Matcher m2 = p2.matcher(rsp);
        if (m2.find()) {
            String isp = m2.group(1);
            System.out.println(isp);
        }
    }
}
