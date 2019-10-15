package com.lc.cloud.demo.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.lc.cloud.demo.exception.CustomException;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.repository.entity.user.User;
import com.lc.cloud.demo.service.demo.PageDemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@RestController
public class DemoController {

    @Autowired
    private PageDemoService pageDemoService;

    @GetMapping("demo.json")
    public String demo() {
        return "demo";
    }

    @GetMapping("customException.json")
    public String customException() {
        throw new CustomException("-1", "error CustomException demo");
    }

    @GetMapping("error.json")
    public String error() {
        throw new RuntimeException("error request ");
    }

    @GetMapping("success.json")
    public BaseRspDto success() {
        return BaseRspDto.success();
    }

    @GetMapping("pageInfo/{styleId}.json")
    public BaseRspDto<PageInfo<String>> pageInfo(@PathVariable("styleId") String styleId,
                                                 @RequestParam("page") int page,
                                                 @RequestParam("size") int size) {
        BaseRspDto<PageInfo<String>> success = BaseRspDto.success();
        success.setData(pageDemoService.findDemoList(page, size, styleId));
        return success;
    }

    @GetMapping("page/{styleId}.json")
    public BaseRspDto<Page<String>> page(@PathVariable("styleId") String styleId,
                                         @RequestParam("page") int page,
                                         @RequestParam("size") int size) {
        BaseRspDto<Page<String>> success = BaseRspDto.success();
        success.setData(pageDemoService.findPageSku(page, size, styleId));
        return success;
    }

    /**
     * 用对象接收参数
     * 请求是把对象的属性放到param中
     * eg:xx?userName=aa&loginDate=bb
     *
     * @param user
     * @return
     */
    @GetMapping("user.json")
    public User login(User user) {
        return user;
    }

    /**
     * 验证 addFormatters 不会对响应结果格式化
     *
     * @return
     */
    @GetMapping("getDate.json")
    public Date getDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String datetimeText = "1999-12-31 23:59:59";
        LocalDateTime datetime = LocalDateTime.parse(datetimeText, formatter);

        ZoneId zone = ZoneId.systemDefault();
        Instant instant = datetime.atZone(zone).toInstant();
        return Date.from(instant);
    }
}
