package com.lc.web.demo01;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayUserUserinfoShareRequest;
import com.alipay.api.response.AlipayUserUserinfoShareResponse;
import org.junit.jupiter.api.Test;

public class AliUserTocken {

	@Test
	public void test() throws AlipayApiException {

		String APP_ID = "2016102600767485";
		String APP_PRIVATE_KEY = "";

		AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipaydev.com/gateway.do", APP_ID, "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCMf+JHOi5UaDhiSO2EB9oV6rphhPKuLwPzHPemaHBZWzLgluSinHRhGArD9bmG1wvxiurTgvQo32sCFQAyWPBTeiqDTmHMQXlNd8toAUTbeKnl7rnPttEF087v/fb4svCqlXTwFvph0kDyh7n10lTohr8EuM8PTPhzZZtGRd9bvLJDHbMYXA3Gbq5J5nqhf/5DQwA15sZnbIJX+Fzj/Rtbbw7hk3cGT/BVQOB1kZAKE/v6pi/dUAu7+wtvC9Qi926EUCx662gE31ebRunWkEkFStpi/Gq9KLjOwARkphugbonPZzyKrD1RtN5xCJaq/oumkztnU/X/FJWechPl80IZAgMBAAECggEAOJTz8s1qhRGny2UlSivDV1o9jzJ0bVN/2rOKxJiAzmuc9LewAhDSCZweEcbu3W/TXoYchevSGnfHZ4I/nwcUWfn0DwdM+W5QxLL+1rbUHTLd8TyP1igAy8D+MMZtZMDjjT89ZcdLNIPxJfslF+uJyE8jtGoc8UOFNyvvOYDAL/gXzxgXDVHGaU95x4UdC4oaxKChwvAnupKjPZNzJYNgDC+niNuE0uE6aoftfYQmryXbXUy6BRCCctgV1b9/MZWVcOPRf7tfhHmGBwhMvNGO9S8N7gLcF9YTBoB/9Pt842+jpYYNhiHOPX2Sm4CJNa9BJAmr83C6O/v/zZqjpd6ghQKBgQDPeee2cako52BviT7o4wts/k+9TGM2u6rX//zQPV2xNO5pMRjp/h6vVA5yGelq3p7EKDsidvXz1JYOFbjnCbMxk2LBmNghNTXUJDt9wvxOzxUDoDlBZQSplE33zuiBM/BM7ggy5mrVcPMc16OcvqnN4iNwgroe+pPSzwAI0r3diwKBgQCtW+1Ye4IoDKx2ks5Nxd/BDUfbZKQE5HxOSIPNM6EsrdBjzhw8U/R7wdOZNNBKJrWlqvCuCTO8hWUUfl96WjKLvFCIifnBM5OlWY4J1p+NFbAIWpncHpeDtFqcUVhIdqI7ZQ4dKj3kE+UIU9jq7PAF3vKF6KOZznvk1Jnx2e4bawKBgBp+lcFtmE155o23uAnjXIUpoKMqywylQHbe4Ljy7TEA8mUKeQUAh4iaMlINzwnvrdSc0phfGp9tiU/5JCiUy4ZMLPNOAmOTOPGDQvmXWcLynNterZEVRlglcSNxD63YJRqd1vwxAnmJN/J58xHEI0kAVMg8WWo1U4U7G+UEjGxrAoGAQgIwu3I7uvgoavW3LBHeAuoFpFoLwfkmA8DEvsub4SFFqdr/EVF+U+kXosxjSvi2TaBrCDlkw7GfLVB5FmNlv6Mynuq6eIAlBd61oLViBxxs7KFi2FelpXZ00fR/Qwg4+Zie6Sf+bOvOV39lpv4U3odnnOlZ8eSXdCgnfdlXOoUCgYAga5iFJa7YGK2ravfqB/O5F0m0RGpZetZPbRLYEKqnKox6prwLGllvxI1pwG/XtXG6TfFkUQLFqb5pJABNlKzDDdSBCG3H2vZpQp71Q212L2tw8ZOJ6NI8pxp+K0kg8U2U/bDUlYbSlJ3gBhie8ug3HGB+P4GSipkrBbzQhkI5gA==", "json", "utf8", "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjH/iRzouVGg4YkjthAfaFeq6YYTyri8D8xz3pmhwWVsy4Jbkopx0YRgKw/W5htcL8Yrq04L0KN9rAhUAMljwU3oqg05hzEF5TXfLaAFE23ip5e65z7bRBdPO7/32+LLwqpV08Bb6YdJA8oe59dJU6Ia/BLjPD0z4c2WbRkXfW7yyQx2zGFwNxm6uSeZ6oX/+Q0MANebGZ2yCV/hc4/0bW28O4ZN3Bk/wVUDgdZGQChP7+qYv3VALu/sLbwvUIvduhFAseutoBN9Xm0bp1pBJBUraYvxqvSi4zsAEZKYboG6Jz2c8iqw9UbTecQiWqv6LppM7Z1P1/xSVnnIT5fNCGQIDAQAB", "RSA2");
//实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.user.userinfo.share
		AlipayUserUserinfoShareRequest request = new AlipayUserUserinfoShareRequest();
//授权类接口执行API调用时需要带上accessToken
		AlipayUserUserinfoShareResponse response= alipayClient.execute(request,"accessToken");

		response.getAddress();
	}
}
