package com.lc.cloud.demo.controller.ant;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ant路径表达式 匹配url
 * ?	匹配任何单字符
 * *	匹配0或者任意数量的字符
 * **	匹配0或者更多的目录
 * 最长匹配原则(has more characters)
 */
//URL请求/app/dir/file.jsp，现在存在两个路径匹配模式/**/*.jsp和/app/dir/*.jsp，那么会根据模式/app/dir/*.jsp来匹配
@RestController
@RequestMapping("ant")
public class AntPathController {

    @GetMapping("/*/path.json")
    public String path() {
        return "path";
    }

    @GetMapping("/**/path.json")
    public String path2() {
        return "path2";
    }

}
