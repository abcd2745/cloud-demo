package com.lc.cloud.demo.config.web;

import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.DispatcherServlet;

@Configuration
public class ServletConfig {

    /**
     * 相当于 ServletMapper -- url-pattern 设置
     * 只接受.html 和 .json 的请求
     * 注意不拦截静态资源
     * https://www.cnblogs.com/canger/p/6084846.html
     *
     * @param dispatcherServlet
     * @return
     * @see CustomWebMvcConfigurer addResourceHandlers() 过滤静态资源
     */
    @Bean
    public ServletRegistrationBean dispatcherRegistration(DispatcherServlet dispatcherServlet) {
        ServletRegistrationBean reg = new ServletRegistrationBean(dispatcherServlet);
        reg.getUrlMappings().clear();
        reg.addUrlMappings("*.html");
        reg.addUrlMappings("*.json");
        //TODO  这是个什么问题？ 为什么不设置了这个转换静态请求也会被拦截 (根本就404）
        reg.addUrlMappings("/");
        return reg;
    }
}
