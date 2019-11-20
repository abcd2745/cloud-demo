package com.lc.cloud.demo.controller.advice;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.RequestBodyAdvice;

import java.io.IOException;
import java.lang.reflect.Type;

/**
 * 执行顺序 （拦截器声明顺序 preHandle -> requestBodyAdvice -> ResponseBodyAdvice -> 拦截器 postHandle （声明倒序) -》afterCompletion 倒序
 * com.lc.cloud.demo.controller.advice.ControllerInterceptor - -------------HandlerInterceptor preHandle
 * com.lc.cloud.demo.config.web.LoginRequiredInterceptor - /groupNoExtendsDefaultValidator.json
 * com.lc.cloud.demo.controller.advice.RequestAdvice - -------------RequestBodyAdvice supports
 * com.lc.cloud.demo.controller.advice.RequestAdvice - -------------RequestBodyAdvice supports
 * com.lc.cloud.demo.controller.advice.ResponseAdvice - -------------ResponseBodyAdvice supports
 * com.lc.cloud.demo.controller.advice.ResponseAdvice - -------------ResponseBodyAdvice beforeBodyWrite
 * com.lc.cloud.demo.controller.advice.ControllerInterceptor - -------------HandlerInterceptor postHandle
 * com.lc.cloud.demo.config.web.LoginRequiredInterceptor - /groupNoExtendsDefaultValidator.json
 * com.lc.cloud.demo.controller.advice.ControllerInterceptor - -------------HandlerInterceptor afterCompletion
 */
@Slf4j
@ControllerAdvice
public class RequestAdvice implements RequestBodyAdvice {
    @Override
    public boolean supports(MethodParameter methodParameter, Type type, Class<? extends HttpMessageConverter<?>> aClass) {
        log.info("-------------RequestBodyAdvice supports");
        return false;
    }

    @Override
    public HttpInputMessage beforeBodyRead(HttpInputMessage httpInputMessage, MethodParameter methodParameter, Type type, Class<? extends HttpMessageConverter<?>> aClass) throws IOException {
        log.info("-------------RequestBodyAdvice beforeBodyRead");
        return null;
    }

    @Override
    public Object afterBodyRead(Object o, HttpInputMessage httpInputMessage, MethodParameter methodParameter, Type type, Class<? extends HttpMessageConverter<?>> aClass) {
        log.info("-------------RequestBodyAdvice afterBodyRead");
        return null;
    }

    @Override
    public Object handleEmptyBody(Object o, HttpInputMessage httpInputMessage, MethodParameter methodParameter, Type type, Class<? extends HttpMessageConverter<?>> aClass) {
        log.info("-------------RequestBodyAdvice handleEmptyBody");
        return null;
    }
}
