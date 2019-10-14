package com.lc.cloud.demo.controller.advice;

import com.lc.cloud.demo.exception.CustomException;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolationException;
import java.util.List;

/**
 * 统一异常处理
 */
@RestControllerAdvice
public class ExceptionController {

    @ResponseBody
    @ExceptionHandler(value = CustomException.class)
    public BaseRspDto CustomExceptionHandler(CustomException ex) {
        BaseRspDto baseRspDto = new BaseRspDto();
        baseRspDto.setCode(ex.getCode());
        baseRspDto.setErrMsg(ex.getMessage());
        return baseRspDto;
    }

    /**
     * 单项验证，是Hibernate (或者 Spring Data JPA) 的验证注解抛出的异常信息
     *
     * @param ex
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = ConstraintViolationException.class)
    public BaseRspDto CustomExceptionHandler(ConstraintViolationException ex) {
        BaseRspDto baseRspDto = new BaseRspDto();
        baseRspDto.setCode("-1");
        baseRspDto.setErrMsg(ex.getMessage());
        return baseRspDto;
    }

    /**
     * 根据对象验证，抛出这个异常
     *
     * @param ex
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public BaseRspDto CustomExceptionHandler(MethodArgumentNotValidException ex) {
        BaseRspDto baseRspDto = new BaseRspDto();
        baseRspDto.setCode("-1");

        BindingResult br = ex.getBindingResult();
        List<FieldError> fieldErrorList = br.getFieldErrors();

        StringBuilder builder = new StringBuilder();
        for (FieldError fieldError : fieldErrorList) {
            builder.append("[field:(")
                    .append(fieldError.getField())
                    .append(")value:(")
                    .append(fieldError.getRejectedValue())
                    .append(")验证失败:(")
                    .append(fieldError.getDefaultMessage())
                    .append(")]");
        }
        baseRspDto.setErrMsg(builder.toString());
        return baseRspDto;
    }

}
