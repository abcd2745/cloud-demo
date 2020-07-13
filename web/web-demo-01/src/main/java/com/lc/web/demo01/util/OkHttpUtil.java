package com.lc.web.demo01.util;

import okhttp3.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;

/**
 * http/https
 * get/post
 * json/from/下载文件，上传文件
 * 同步/异步
 *
 * @author abcd2
 */
public class OkHttpUtil {

    private static final Logger logger = LoggerFactory.getLogger(OkHttpUtil.class);

    private static OkHttpUtil instance;

    /**
     * 失败的做法，只能用一次
     * 换了拦截器其实是不生效的
     */
    private static OkHttpUtil interceptorInstance;

    private static Object lock = new Object();

    private final OkHttpClient client;

    private OkHttpUtil() {
        OkHttpClient.Builder mBuilder = new OkHttpClient.Builder();
        mBuilder.sslSocketFactory(createSSLSocketFactory(), new TrustAllCerts())
                .hostnameVerifier(new TrustAllHostnameVerifier())
                .retryOnConnectionFailure(true)
                //连接超时
                .connectTimeout(60, TimeUnit.SECONDS)
                //读取超时
                .readTimeout(60, TimeUnit.SECONDS)
                //写超时
                .writeTimeout(60, TimeUnit.SECONDS);
        client = mBuilder.build();
    }

    private OkHttpUtil(Interceptor... interceptor) {
        OkHttpClient.Builder mBuilder = new OkHttpClient.Builder();
        for (Interceptor ir : interceptor) {
            mBuilder.addInterceptor(ir);
        }
        mBuilder.sslSocketFactory(createSSLSocketFactory(), new TrustAllCerts())
                .hostnameVerifier(new TrustAllHostnameVerifier())
                .retryOnConnectionFailure(true)
                //连接超时
                .connectTimeout(60, TimeUnit.SECONDS)
                //读取超时
                .readTimeout(60, TimeUnit.SECONDS)
                //写超时
                .writeTimeout(60, TimeUnit.SECONDS);
        client = mBuilder.build();
    }

    public static OkHttpUtil getInstance() {
        if (instance != null) {
            return instance;
        }
        synchronized (lock) {
            if (instance == null) {
                instance = new OkHttpUtil();
            }
        }
        return instance;
    }

    public static OkHttpUtil getInterceptorInstance(Interceptor... interceptor) {
        if (interceptorInstance != null) {
            return interceptorInstance;
        }
        synchronized (lock) {
            if (interceptorInstance == null) {
                interceptorInstance = new OkHttpUtil(interceptor);
            }
        }
        return interceptorInstance;
    }

    public String get(String url) {
        Request request = new Request.Builder().url(url).build();
        return getRsp(request);
    }

    public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    public String post(String url, String json) {
        logger.info("start http post request。request url:{},request body：{}", url, json);
        RequestBody body = RequestBody.create(JSON, json);
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .build();
        return getRsp(request);
    }

    public void download(String url, String json, String targetFilePath) {
        try (InputStream is = download(url, json)) {
            Path target = Paths.get(targetFilePath);
            Files.copy(is, target, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public InputStream download(String url, String json) {
        logger.info("start http post request。request url:{},request body：{}", url, json);
        RequestBody body = RequestBody.create(JSON, json);
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .build();

        try {
            Response response = client.newCall(request).execute();
            if (response.isSuccessful()) {
                return response.body().byteStream();
            }
            throw new RuntimeException("响应异常,响应码：" + response.code() + "\t,响应结果：" + response.body().string());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private String getRsp(Request request) {
        try {
            Response response = client.newCall(request).execute();
            if (response.isSuccessful()) {
                String rsp = response.body().string();
                logger.info("响应结果：{}", rsp);
                return rsp;
            }
            throw new RuntimeException("响应异常,响应码：" + response.code() + "\t,响应结果：" + response.body().string());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    private SSLSocketFactory createSSLSocketFactory() {
        SSLSocketFactory ssfFactory = null;
        try {
            SSLContext sc = SSLContext.getInstance("TLS");
            sc.init(null, new TrustManager[]{new TrustAllCerts()}, new SecureRandom());
            ssfFactory = sc.getSocketFactory();
        } catch (Exception e) {

        }
        return ssfFactory;
    }
}
