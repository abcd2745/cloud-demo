package com.lc.cloud.demo.config;

import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Component;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.config.annotation.*;

import java.util.List;

import static com.lc.cloud.demo.constant.Constant.TIME_FORMAT;

/**
 *
 */
@Component
public class CustomWebMvcConfigurer implements WebMvcConfigurer {

    /**
     * 添加静态资源文件，外部可以直接访问地址
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //需要配置1：----------- 需要告知系统，这是要被当成静态文件的！
        //第一个方法设置访问路径前缀，第二个方法设置资源路径
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
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
