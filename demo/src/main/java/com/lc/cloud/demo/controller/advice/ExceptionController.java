package com.lc.cloud.demo.controller.advice;

import com.lc.cloud.demo.exception.CustomException;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolationException;

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
     * 单项验证
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
        baseRspDto.setErrMsg(ex.getMessage());
        return baseRspDto;
    }

}
