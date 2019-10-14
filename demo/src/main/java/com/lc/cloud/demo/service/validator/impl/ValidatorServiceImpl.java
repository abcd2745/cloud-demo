package com.lc.cloud.demo.service.validator.impl;

import com.lc.cloud.demo.repository.dto.valid.ValidatorReqDto;
import com.lc.cloud.demo.service.validator.ValidatorService;
import org.springframework.stereotype.Component;

@Component
public class ValidatorServiceImpl implements ValidatorService {

    @Override
    public boolean doValidate(ValidatorReqDto dto) {
        //do something
        int age = dto.getAge();
        System.out.println(age);
        return dto.getFlag();
    }
}
