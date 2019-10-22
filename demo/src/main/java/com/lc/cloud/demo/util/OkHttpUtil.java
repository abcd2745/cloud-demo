package com.lc.cloud.demo.util;

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
import java.util.Map;
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

    private static final OkHttpClient client;

    /**
     * connectTimeout 最终设置给了socket (确切的说应该是rawSocket)
     * readTimeout 最终设置给了rawSocket 以及 在socket基础上创建的BufferedSource
     * writeTimeout 最终设置给了在socket基础上创建的BufferedSink
     */
    static {
        OkHttpClient.Builder mBuilder = new OkHttpClient.Builder();
        mBuilder.sslSocketFactory(createSSLSocketFactory(), new TrustAllCerts());
        mBuilder.hostnameVerifier(new TrustAllHostnameVerifier());
        client = mBuilder
                .retryOnConnectionFailure(true)
                //连接超时
                .connectTimeout(60, TimeUnit.SECONDS)
                //读取超时
                .readTimeout(60, TimeUnit.SECONDS)
                //写超时
                .writeTimeout(60, TimeUnit.SECONDS)
                .build();
    }

    public static String get(String url) {
        Request request = new Request.Builder().url(url).build();
        return getRsp(request);
    }

    public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    public static String post(String url, String json) {
        logger.info("start http post request。request url:{},request body：{}", url, json);
        RequestBody body = RequestBody.create(json, JSON);
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .build();
        return getRsp(request);
    }

    public static void download(String url, String json, String targetFilePath) {
        try (InputStream is = download(url, json)) {
            Path target = Paths.get(targetFilePath);
            Files.copy(is, target, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static InputStream download(String url, String json) {
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

    private static String getRsp(Request request) {
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

    public static String form(String url, Map<String, String> formMap) {
        return form(url, formMap, true);
    }

    public static String form(String url, Map<String, String> formMap, boolean encoded) {

        FormBody.Builder formBuilder = new FormBody.Builder();

        for (Map.Entry<String, String> entry : formMap.entrySet()) {
            if (encoded) {
                formBuilder.addEncoded(entry.getKey(), entry.getValue());
            } else {
                formBuilder.add(entry.getKey(), entry.getValue());
            }
        }

        final Request request = new Request.Builder()
                .url(url)
                .post(formBuilder.build())
                .build();

        return getRsp(request);
    }

    private static SSLSocketFactory createSSLSocketFactory() {
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
