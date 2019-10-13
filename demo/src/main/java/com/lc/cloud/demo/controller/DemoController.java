package com.lc.cloud.demo.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.lc.cloud.demo.exception.CustomException;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.service.demo.PageDemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
}
