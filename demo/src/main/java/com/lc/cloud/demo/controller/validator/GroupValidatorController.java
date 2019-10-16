package com.lc.cloud.demo.controller.validator;

import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.repository.dto.valid.GroupNoExtendsDefaultValidatorReqDto;
import com.lc.cloud.demo.repository.dto.valid.GroupValidatorReqDto;
import com.lc.cloud.demo.service.validator.group.MyGroup;
import com.lc.cloud.demo.service.validator.group.MyGroupNoExtendsDefault;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class GroupValidatorController {

    /**
     * 这是指定要生效的验证分组
     *
     * @param dto
     * @return
     */
    @PostMapping("groupValidator.json")
    public BaseRspDto<Map<String, Integer>> groupValidator(@RequestBody @Validated({MyGroup.class})
                                                                   GroupValidatorReqDto dto,
                                                           BindingResult bindingResult) {
        BaseRspDto<Map<String, Integer>> rsp = BaseRspDto.success();

        Map<String, Integer> map = new HashMap<>();
        List<FieldError> fieldErrorList = bindingResult.getFieldErrors();
        //有验证失败的数据，才会放到BindingResult对象
        if (!CollectionUtils.isEmpty(fieldErrorList)) {
            for (FieldError fieldError : fieldErrorList) {
                map.put(fieldError.getField(), map.get(fieldError.getField()) == null ? 1 : map.get(fieldError.getField()) + 1);
            }
        }
        rsp.setData(map);
        return rsp;
    }

    /**
     * 这是指定要生效的验证分组
     *
     * @param dto
     * @return 验证失败的属性和原因
     */
    @PostMapping("groupNoExtendsDefaultValidator.json")
    public BaseRspDto<Map<String, Integer>> groupNoExtendsDefaultValidator(@RequestBody @Validated({MyGroupNoExtendsDefault.class})
                                                                                   GroupNoExtendsDefaultValidatorReqDto dto,
                                                                           BindingResult bindingResult) {
        BaseRspDto<Map<String, Integer>> rsp = BaseRspDto.success();

        List<FieldError> fieldErrorList = bindingResult.getFieldErrors();
        Map<String, Integer> map = new HashMap<>();
        for (FieldError fieldError : fieldErrorList) {
            map.put(fieldError.getField(), map.get(fieldError.getField()) == null ? 1 : map.get(fieldError.getField()) + 1);
        }
        rsp.setData(map);
        return rsp;
    }
}
