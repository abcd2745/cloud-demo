package com.lc.cloud.okhttp;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lc.cloud.demo.DemoApplication;
import com.lc.cloud.demo.repository.entity.user.User;
import okhttp3.*;
import org.jetbrains.annotations.NotNull;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import static org.hamcrest.Matchers.is;

/**
 * 通过okHttp 拦截器的方式，往请求中新增头部信息
 */
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT, classes = DemoApplication.class)
public class InterceptorAddHeaderTest {

    @LocalServerPort
    private int port;

    @Test
    public void testPost() throws IOException {
        User user = new User();
        user.setUserName("lc");
        user.setLoginDate(new Date());
        ObjectMapper objectMapper = new ObjectMapper();
        ResponseBody body = postResponseBody("http://localhost:" + port + "/head/1.json", objectMapper.writeValueAsString(user));
        Assert.assertThat("11002054", is(body.string()));
        //关闭流
        body.close();
    }

    public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    /**
     * post请求
     *
     * @param url
     * @param json
     * @return
     * @throws IOException
     */
    private ResponseBody postResponseBody(String url, String json) throws IOException {
        OkHttpClient.Builder mBuilder = new OkHttpClient.Builder();
        OkHttpClient client = mBuilder
                .retryOnConnectionFailure(true)
                //连接超时
                .connectTimeout(60, TimeUnit.SECONDS)
                //读取超时
                .readTimeout(60, TimeUnit.SECONDS)
                //写超时
                .writeTimeout(60, TimeUnit.SECONDS)
//                .addInterceptor(new LogInterceptor())
//                .addNetworkInterceptor(new LogInterceptor())
                .build();

        Request request = new Request.Builder()
                .url(url)
                .post(RequestBody.create(json, JSON))
                 .addHeader("storeid", "11002054") //正常这里就可以新增header信息
                .build();
        Response response = client.newCall(request).execute();
        Assert.assertThat(200, is(response.code()));
        return response.body();
    }

    /**
     * 参考：https://square.github.io/okhttp/interceptors/
     * 对chain.proceed(请求)的调用是每个拦截器实现的关键部分。
     * 这个看起来很简单的方法是所有HTTP工作发生的地方，它产生一个响应来满足请求。
     * 如果chain.proceed(请求)被多次调用，则必须关闭以前的响应体。
     */
    private class LogInterceptor implements Interceptor {

        @NotNull
        @Override
        public Response intercept(@NotNull Chain chain) throws IOException {
            Request request = chain.request();
            //这里要替换原来的request，将新的放进去
            request = request.newBuilder().addHeader("storeId", "11002054").build();

            //打印请求头
            long t1 = System.nanoTime();
            System.out.println(String.format("Sending request %s on %s%n%s",
                    request.url(), chain.connection(), request.headers()));

            Response response = chain.proceed(request);

            //打印响应头
            long t2 = System.nanoTime();
            System.out.println(String.format("Received response for %s in %.1fms%n%s",
                    response.request().url(), (t2 - t1) / 1e6d, response.headers()));

            System.out.println("\n\n\n\n\n------------------------------------------\n");

            return response;
        }
    }
}
