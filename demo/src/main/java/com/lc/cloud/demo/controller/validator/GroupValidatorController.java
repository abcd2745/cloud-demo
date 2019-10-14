package com.lc.cloud.demo.controller.validator;

import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.repository.dto.valid.GroupValidatorReqDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorRspDto;
import com.lc.cloud.demo.service.validator.group.MyGroup;
import com.lc.cloud.demo.service.validator.group.MyGroupNoExtendsDefault;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class GroupValidatorController {

    /**
     * 这是指定要生效的验证分组
     *
     * @param dto
     * @return
     */
    @PostMapping("groupValidator.json")
    public BaseRspDto<List<FieldError>> groupValidator(@RequestBody @Validated({MyGroup.class}) GroupValidatorReqDto dto,
                                                       BindingResult bindingResult) {
        BaseRspDto<List<FieldError>> rsp = BaseRspDto.success();
        rsp.setData(bindingResult.getFieldErrors());
        return rsp;
    }

    /**
     * 这是指定要生效的验证分组
     *
     * @param dto
     * @return
     */
    @PostMapping("groupNoExtendsDefaultValidator.json")
    public BaseRspDto<List<FieldError>> groupNoExtendsDefaultValidator(@RequestBody @Validated({MyGroupNoExtendsDefault.class}) GroupValidatorReqDto dto,
                                                                       BindingResult bindingResult) {
        BaseRspDto<List<FieldError>> rsp = BaseRspDto.success();
        rsp.setData(bindingResult.getFieldErrors());
        return rsp;
    }
}
