package com.lc.cloud.demo.controller;

import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorReqDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorRspDto;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Size;

@RestController
//必须放到这里，否则不抛出ConstraintViolationException
@Validated
public class ValidatorController {

    /**
     * 对请求url路径验证
     *
     * @param data
     * @return
     */
    @GetMapping("valid/{data}.json")
    public String validPathVariable(@Size(min = 3, max = 6, message = "长度必须3到6之间") @PathVariable String data) {
        return data;
    }

    /**
     * 对请求的param参数验证
     *
     * @param name
     * @return
     */
    @GetMapping("valid.json")
    public String validPathParam(@Size(min = 3, max = 6) @RequestParam(value = "name") String name) {
        return name;
    }

    /**
     * 这里对要验证的对象需要加上@Validated，否则验证不会生效
     *
     * @param dto
     * @return
     */
    @PostMapping("validBean.json")
    public BaseRspDto<ValidatorRspDto> validBean(@RequestBody @Validated ValidatorReqDto dto) {
        BaseRspDto<ValidatorRspDto> rsp = BaseRspDto.success();
        ValidatorRspDto rspDto = new ValidatorRspDto();

        rspDto.setName(dto.getPattern());
        rspDto.setValid(2);
        rsp.setData(rspDto);
        return rsp;
    }

}
