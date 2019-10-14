package com.lc.cloud.demo.controller.validator;

import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorReqDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorRspDto;
import com.lc.cloud.demo.service.validator.ValidatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Size;
import java.util.List;

@RestController
//必须放到这里，否则不抛出ConstraintViolationException
@Validated
public class ValidatorController {

    @Autowired
    private ValidatorService validatorService;

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
     * 这里验证不通过会抛出异常信息，不执行方法体
     *
     * @param dto
     * @return
     */
    @PostMapping("validBean.json")
    public BaseRspDto<ValidatorRspDto> validBeanNoExecuteMethod(@RequestBody @Validated ValidatorReqDto dto) {
        BaseRspDto<ValidatorRspDto> rsp = BaseRspDto.success();
        ValidatorRspDto rspDto = new ValidatorRspDto();

        rspDto.setName(dto.getPattern());
        rspDto.setValid(2);
        rsp.setData(rspDto);
        return rsp;
    }

    /**
     * 注解Validated验证结果放入到BindingResult 对象中
     * 加入BindingResult之后，验证失败不会抛出异常，会正常执行方法体
     *
     * @param dto
     * @param result
     * @return
     */
    @PostMapping("validBeanBindingResult.json")
    public BaseRspDto<ValidatorRspDto> validBeanWithBindingResultExecuteMethod(@RequestBody @Validated ValidatorReqDto dto, BindingResult result) {
        BaseRspDto<ValidatorRspDto> rsp = BaseRspDto.success();
        ValidatorRspDto rspDto = new ValidatorRspDto();
        validatorService.doValidate(dto);
        List<FieldError> fieldErrorList = result.getFieldErrors();
        // 这里判断BindingResult是否含有验证失败的属性，然后自定义处理规范

        StringBuilder builder = new StringBuilder();
        for (FieldError fieldError : fieldErrorList) {
            builder.append("[field:(")
                    .append(fieldError.getField())
                    .append(")value:(")
                    .append(fieldError.getRejectedValue())
                    .append(")验证失败:(")
                    .append(fieldError.getDefaultMessage());
        }
        rspDto.setName(builder.toString());
        rspDto.setValid(dto.getAge());
        rsp.setData(rspDto);
        return rsp;
    }

}
