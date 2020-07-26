package com.lc.web.demo01.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipaySystemOauthTokenRequest;
import com.alipay.api.response.AlipaySystemOauthTokenResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class AlipayController {

	@Value("${ali_appid}")
	private String appid;

	@GetMapping("/ali")
	public String ali(HttpServletRequest request) {
//		String s = OkHttpUtil.getInstance().get("https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&code="+code+"&grant_type=authorization_code");
		System.out.println("1231");
		return "123";
	}


	@ResponseBody
	@RequestMapping(value = "getAliUserId")
	public String getAliUserId(HttpServletRequest request, String param) throws Exception {
		String authCode = request.getParameter("auth_code");
		AlipaySystemOauthTokenRequest oauthTokenRequest = new AlipaySystemOauthTokenRequest();
		oauthTokenRequest.setCode(authCode);
		oauthTokenRequest.setGrantType("authorization_code");

		AlipayClient alipayClient = getClient();
		AlipaySystemOauthTokenResponse oauthTokenResponse = alipayClient.execute(oauthTokenRequest);
		String userId = oauthTokenResponse.getUserId();
		System.out.println("userId:" + userId);
		System.out.println("自定义传回的参数:" + param);
		return userId;
	}

	private AlipayClient alipayClient;

	//私钥
	public String ALI_PAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgnT4yk/92W8sI1ZsNtM1godxW9uRclFz2znVscE9p9BBkjyt/eeskBcy8DsNBWS1TR+HYghcbhf+yujjVPwm0TExmt3UWfpgxekc2lbtqghjiBLo4emPO+PCDhlKL5LHg/oZ1ajMS+v/YzBHVut+40v6VdhXTBiYJ58UZcP3GN7E2c7MpkexZGxMsLSPhat2JV3dq68csxRn/kTJXLKNPDdo9upnfUyezOotEyhl3K4732mmQzxlhy5+HZKbrCMfKEp/NyaX/HU0gZwAy1fTUg+114bq5ia+e8WOtxWFrBQyXC36fhiIA8QQ2AepY8FvlNEUSkBfx7LeJk6dwfZwvQIDAQAB";
	//公钥
	public String PRIVATE_KEY = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCCdPjKT/3ZbywjVmw20zWCh3Fb25FyUXPbOdWxwT2n0EGSPK3956yQFzLwOw0FZLVNH4diCFxuF/7K6ONU/CbRMTGa3dRZ+mDF6RzaVu2qCGOIEujh6Y8748IOGUovkseD+hnVqMxL6/9jMEdW637jS/pV2FdMGJgnnxRlw/cY3sTZzsymR7FkbEywtI+Fq3YlXd2rrxyzFGf+RMlcso08N2j26md9TJ7M6i0TKGXcrjvfaaZDPGWHLn4dkpusIx8oSn83Jpf8dTSBnADLV9NSD7XXhurmJr57xY63FYWsFDJcLfp+GIgDxBDYB6ljwW+U0RRKQF/Hst4mTp3B9nC9AgMBAAECggEAbLAZqyyT2LintFVHWTIEjdhcGGTJO84i0U3Q/QR7Yrm+N6D4cOa4vV+mn8EC6zBpYHTZLVK79zlknRcEd4SQro7mvhj8124jfB/oWvw7jALrMa5XeghFvmbWATsOtK38LbeMGJdGhiZ7ot7RQNh44dQmH6lbqdl/wtrlepeW4Y9cWnC6z3MR45W16W5kjjNQxEQMoyiXD0Svxqae2x5KxWJyOVziytFiZAUWlerFGINYXIFX/CNL0LXMSJCv89HfDzLRe5V2dbpOfOz9KmSGv9m1ADKjxtgu202VH6owOPFUJhh0ylXbyUXjlz/DlgcsI3NTsxqEALFl9/Z7Y4monQKBgQDRscJ6sdanfKal+799sDPltmpVN+VyLlewtcNTFhoQHJ8YOdwuNG/w6K76kCg6lr0rOJksjzRnZv3wDD8fQJJD5TEAMkPLzsmQ2gbJMlFtMhLmHJtvSQfq0kIlcF4Ha7nMxlZRAZJW1VWvDxsUDvdBYw5+I90vNPdAzosnfjAGrwKBgQCfQ9Y6IHLtNVPQutEK947j0kZLwNQ/RLTrLeal6t0CBHdJTHRhzfXDF18t3YaTbZ+hS1skVOr05z+6Jwn58wOy2K3j+wpLNZX6JLRHSKyF9WAzQTATnCBq6ayX8esEKlZ2crVOCXzDSlH76BGO3d2YUSXXtULKkpXsxR8+WVGaUwKBgFqYK+eKUazGo9DuNMr+h01lRAdRQOXVs7j6rkqFL/lqBCoZRVEJApvYS1ChW2AEo/G6YCLqM7/AtVEyWUsNQKPorwTgsn2o91iHeYsPHDLLAXM9RMINkUgYUs+N/nHCTuFzhvM0dJ7jSEN7iT1fQd+UBjzlDbhJb9El6uTDFcitAoGAP74w4bbXCKWNVD9RJ2iJohko1WzqBiCDoJUQeVuU9RfAfm/BLNv3/ws9pufA0wTPHQlCAzqRh09+rAyv64Ad/NjIUDTLm+poimNiXB10H3Fj/V+b1F1qhB/eWjoS6+neDS4/7mnRq3/1bDMnw9x8slfYI4uCnf0pUEhdBuFMzc0CgYBUtNziINMHKbKsaRJK0cIz5/JGIt62r9mljqF8yF8o6DvMghmO3a+m9lHjLRCACTMX2T1xNychkJK4eRAIGqFoQ5FTOicOqugG68/6pAdTFSpLq/gngsfSthMGhjHWArxNR5ZbmjhkkoTxTsD6Gkni9HiiS4tLWnmfCSrqv+xEaw==";

	public AlipayClient getClient() {
		if (null == alipayClient) {
			alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", appid,
					PRIVATE_KEY, "json", "GBK", ALI_PAY_PUBLIC_KEY, "RSA2","ivL38tX+iHRsLxHSyNdiEA==","RSA2");
		}
		return alipayClient;
	}
}
