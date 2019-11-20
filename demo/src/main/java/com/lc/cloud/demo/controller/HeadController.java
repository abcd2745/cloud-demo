package com.lc.cloud.demo.controller;

import com.lc.cloud.demo.repository.entity.user.User;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@RestController
public class HeadController {

    /**
     * http2.0  head规定都是小写字母，必须指定head中field为小写
     *
     * @param head
     * @param id
     * @param user
     * @param request
     * @param response
     * @return
     */
    @PostMapping("head/{id}.json")
    public String head(@RequestHeader Map<String, String> head, @PathVariable int id, @RequestBody User user, HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("storeid", "11002054");
        if (head.containsKey("storeid")) {
            return head.get("storeid");
        }
        return user.getUserName();
    }
}
