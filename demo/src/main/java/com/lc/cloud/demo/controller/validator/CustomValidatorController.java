package com.lc.cloud.demo.controller.validator;

import com.lc.cloud.demo.service.validator.CustomValidator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Validated
public class CustomValidatorController {

    /**
     * 对请求url路径验证
     *
     * @param data
     * @return
     */
    @GetMapping("customValid/{data}.json")
    public String customValidPathVariable(@CustomValidator(max = 8, check = "lican") @PathVariable String data) {
        return data;
    }
}
