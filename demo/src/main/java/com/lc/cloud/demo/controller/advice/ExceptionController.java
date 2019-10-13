package com.lc.cloud.demo.controller.advice;

import com.lc.cloud.demo.exception.CustomException;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

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

}
