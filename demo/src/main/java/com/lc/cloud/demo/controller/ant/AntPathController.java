package com.lc.cloud.demo.controller.ant;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * ant路径表达式 匹配url
 * ?	匹配任何单字符
 * *	匹配0或者任意数量的字符（但必须是在一个路径分段中）
 * **	匹配0或者更多的目录
 * 最长匹配原则(has more characters)
 * 参考：https://blog.csdn.net/qq_35835624/article/details/79254132
 */
//URL请求/app/dir/file.jsp，现在存在两个路径匹配模式/**/*.jsp和/app/dir/*.jsp，那么会根据模式/app/dir/*.jsp来匹配
@RestController
@RequestMapping("ant")
public class AntPathController {

    @GetMapping("/?/path.json")
    public String patternChar() {
        return "?";
    }

    /**
     * 必须通过命名式正则获取路径参数
     *
     * @param cha
     * @return
     */
    @GetMapping("/{cha:\\w}/pathChar.json")
    public String patternCharPath(@PathVariable String cha) {
        return "?" + cha;
    }

    @GetMapping("/*/path.json")
    public String path() {
        return "path";
    }

    @GetMapping("/*")
    public String path2() {
        return "*通配符表示匹配零个或者多个字符，但必须是在一个路径分段中！";
    }

    @GetMapping("/{word:\\w+}/pathWord.json")
    public String pathWord(@PathVariable String word) {
        return "path" + word;
    }

    @GetMapping("/**/path.json")
    public String path3(HttpServletRequest request) {
        String url = request.getRequestURI();
        System.out.println("请求url：" + url);
        return "path3";
    }

}
