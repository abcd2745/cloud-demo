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
	public String ALI_PAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA01yJdXmbe86rXX0I6nI0Fg7bJbhPRc75lQuw+jgOURSCvu0dpwEUspZMbgfTMcv5YFlC1IKheXzUHz4N8lCB2UtZ9t45Tj+TX97HvtiGH59jC5mGiTmQfZMoXlAhBtS9Z99Wi9NW3eZ0ij+uFDOadGo5jgeL7WZ47XggW+2lJecWlYbhD7EYMNyjPC5mbFr6hi262MYtkED5SwgSWcFKKFHPXLZCk3zsneEkafIjvpNIilSwO5bg01N4ZT31R1HybsHFSqZkfYwIce2/U8siFN3eNx9TkgDWbhyLR57uCw6FoAcmar6NGzZT92waOltLls+EbaHSGEpkleD8yuiwywIDAQAB";
	//公钥
	public String PRIVATE_KEY = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDTXIl1eZt7zqtdfQjqcjQWDtsluE9FzvmVC7D6OA5RFIK+7R2nARSylkxuB9Mxy/lgWULUgqF5fNQfPg3yUIHZS1n23jlOP5Nf3se+2IYfn2MLmYaJOZB9kyheUCEG1L1n31aL01bd5nSKP64UM5p0ajmOB4vtZnjteCBb7aUl5xaVhuEPsRgw3KM8LmZsWvqGLbrYxi2QQPlLCBJZwUooUc9ctkKTfOyd4SRp8iO+k0iKVLA7luDTU3hlPfVHUfJuwcVKpmR9jAhx7b9TyyIU3d43H1OSANZuHItHnu4LDoWgByZqvo0bNlP3bBo6W0uWz4RtodIYSmSV4PzK6LDLAgMBAAECggEBAKxhSlKfLaoZ8jU7JqxfHA/pad4npa+fkHp4oIxSb4q9Ga0xof90qDbG0erjQuHYI7jq09CSAbQdlLsuVx2Lf3uDMwpeT4p722xTO8FwwmLEEXmCavE8G5XvEPtqiqURmLBAvEspwC0WKXIfYZBkTdIoWGx3xy2FZ5b1ZB7VgN2ZT+zcvjEuiP6z+E0YKndzpvpYJSzQwNYl0mOuhm7/0EhdnSvzuqe+g+6yt2c6SusJXPO3x+k9KSQ24PpUWl559F1Y51taYjRqIjXGliP33RODZ/mZRjKtexd1Iy4jy/I6tF8PLtVZhCeMXsNkU8t+Q7NiPDlifC2d+07RJI3rOZECgYEA//ouFVtLPgNBEbhvXVj2R9QQQXfrDflbY33JvKMqCv8uveFNzt7AQDKbx9OYKMfdQUFCF9UduX86rypbD7xv1nuK/2Ek8toLnt7ghB1CYg6vG0s1xzVKG6vj+2ZgaEvu6OEpj56LeHpH5hemlKTnIFesFqPVaGox9qBc1RTK/l0CgYEA02FXsGeeSojQkvS6lVMLqKNFlXqJp8BSso92vsm/akP6XAwkoSHiduKwlso0TiRL3599xHf1nzaX4AgtlMSdVlGK1d6dkfHp/82TajvhF7a2bByFHOt2VxzqDJLiCU4Y4oolB7QMkMv1OpRXR8zA2mHLsj3w5sgrOByFG0DoaUcCgYBFESjsBEUKB3DAKkaKJl3VRafZMlUO4TBCaQdMya2nZ/EhtK/82GeBKuaThUkx/7N4TvZZXdx2V5jq+H+3gD2g3pbDj1+b0y99f1+O5iIqORIQSDvLc1p6mueZxqbOnWZqGY7QPJQfPsc1kz4UL2ZZeK5rMWt8j+LJS72glMqs1QKBgALrQDO+apAq7X5qBL2VJP8SKh7TT11SqZGvq3sc/BiykZ19yW+0MRVlMf0TE7/Ufnu7DxiMc4bcUSKV2lNIl8eeXqVvaoueZJXUt+lqpEQYkNJTXn80vTCcxJqh2J86Rduy/qnpkZbaSiuh6saiDDO30AFJG6+EKhyfQDNNJSh3AoGBAPl3MAR1xx73v2aOnA2F3IwsM8eXFQM8Z/Yh/6lGpAy29uIY5rUPERa3LRpMGAfQThZ6OZhyjUmS6rNJuYKS5fS4qYjyJkNqpP1zR6RPn0rBu9ricgo43JGs2vFTRH0WjJD6KMVEgQ8gXMzwgthl5vIKRn21KGk0dHJXdX1Nj1ml";

	public AlipayClient getClient() {
		if (null == alipayClient) {
			alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", appid,
					PRIVATE_KEY, "json", "GBK", ALI_PAY_PUBLIC_KEY, "RSA2");
		}
		return alipayClient;
	}
}
