package com.lc.web.demo01.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lc.web.demo01.util.OkHttpUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WxController {

	@Value("${appID}")
	private String appid;

	@Value("${appsecret}")
	private String appsecret;

	@GetMapping("/token")
	public String token() {
		//获取微信token  sh.api.weixin.qq.com
		String tokenJson = OkHttpUtil.getInstance().get("https://sh.api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appid + "&secret=" + appsecret);
//		String tokenJson = OkHttpUtil.getInstance().get("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appid + "&secret=" + appsecret);
		return tokenJson;
	}


	@GetMapping("/wx/{posId}/{amount}")
	public String wx(@PathVariable String posId,
					 @PathVariable Double amount,
					 @RequestParam("code") String code, @RequestParam("state") String state) {
		System.out.println(amount + "\t" + posId + "\t" + code + "\t" + state);
		String accessTokenJson = OkHttpUtil.getInstance().get("https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appid + "&secret=" + appsecret + "&code=" + code + "&grant_type=authorization_code");

		return accessTokenJson;
	}

}
