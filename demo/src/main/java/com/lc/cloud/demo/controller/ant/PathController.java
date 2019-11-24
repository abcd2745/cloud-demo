package com.lc.cloud.demo.controller.ant;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/path")
public class PathController {

    /**
     * 特殊匹配
     * region: 匹配的是 用 “,” 逗号分隔的字符 ,不能匹配路径分隔符 “/”
     * eg:/path/testString,test/shenyang/path
     * error:/path/testString/test/shenyang/path
     *
     * @param region
     * @param district
     * @return
     */
    @GetMapping("{region:.+}/shenyang/{district:\\w+}")
    public String getAddress(@PathVariable final List<String> region,
                             @PathVariable final String district) {
        return region.size() + "-" + district;
    }
}
