package com.lc.web.demo01.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class DemoController {

	@RequestMapping("/")
	public String sayHello() {
		return "hello";
	}
}
