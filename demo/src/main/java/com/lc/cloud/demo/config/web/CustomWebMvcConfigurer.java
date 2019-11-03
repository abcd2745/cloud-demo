package com.lc.cloud.demo.config.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.http.CacheControl;
import org.springframework.stereotype.Component;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.config.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static com.lc.cloud.demo.constant.Constant.TIME_FORMAT;

/**
 * 不用开启 @EnableWebMvc
 */
@Component
public class CustomWebMvcConfigurer implements WebMvcConfigurer {

    @Autowired
    private Environment environment;

    /**
     * 添加静态资源文件，外部可以直接访问地址
     * https://blog.csdn.net/andy_zhang2007/article/details/89133798
     * https://www.cnblogs.com/hujunzheng/p/9682960.html
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //需要配置1：----------- 需要告知系统，这是要被当成静态文件的！
        //设置访问路径前缀
        registry.addResourceHandler("/static/**")
                //设置资源路径
                .addResourceLocations("classpath:/static/")
                //设置资源缓存时间
                .setCacheControl(CacheControl.maxAge(1, TimeUnit.HOURS).cachePublic());

        //添加对上传文件的直接访问
//        String uploadFilePath = environment.getProperty("upload-file-path");
//        registry.addResourceHandler("/upload/**").addResourceLocations("file:" + uploadFilePath);
    }

    /**
     * 格式化
     * 只会对<B>请求</B>参数格式化
     *
     * @param registry
     */
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DateFormatter(TIME_FORMAT));
    }

    /**
     * 拦截器
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        //编码拦截器
//        registry.addInterceptor(encodingInterceptor()).addPathPatterns("/**").excludePathPatterns("/upload/**", "/static/**");
//        //安全验证拦截器
//        registry.addInterceptor(permissionInterceptorAdapter()).addPathPatterns("/**").excludePathPatterns("/upload/**", "/static/**");
//        //web拦截器
//        registry.addInterceptor(webInterceptor()).addPathPatterns("/**").excludePathPatterns("/upload/**", "/static/**");

        registry.addInterceptor(new LoginRequiredInterceptor()).excludePathPatterns(Arrays.asList("/static/**", "/templates/**"));
    }

    /**
     * 跨域访问
     * 参考：https://segmentfault.com/a/1190000019550329?utm_source=tag-newest
     * 方式一：全局配置 （就是这里）
     * 方式二：过滤器
     * 方式三：在controller上使用@CrossOrigin注解
     *
     * @param registry
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")   // 允许任何域名使用 （可以指定 具体域 http://xxx
                .allowedMethods("GET", "HEAD", "POST", "PUT", "DELETE", "OPTIONS") // 允许的请求方法
                .allowCredentials(true)
                .maxAge(3600)
                .allowedHeaders("*");//允许任何头
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {

    }

    @Override
    public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> handlers) {

    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //registry.addViewController("/error/404").setViewName("/admin/page_error/error_404.html");
    }
}
