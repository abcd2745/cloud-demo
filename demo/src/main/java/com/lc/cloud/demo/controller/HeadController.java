package com.lc.cloud.demo.controller;

import com.lc.cloud.demo.repository.entity.user.User;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@RestController
public class HeadController {

    @PostMapping("head/{id}.json")
    public String head(@RequestHeader Map<String, String> head, @PathVariable int id, @RequestBody User user, HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("storeId", "11002054");
        if (head.containsKey("storeId")) {
            return head.get("storeId");
        }
        return user.getUserName();
    }
}
