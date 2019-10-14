package com.lc.cloud.demo.service.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * 这是自定义的验证处理类
 */
public class CustomValidatorClass implements ConstraintValidator<CustomValidator, String> {

    private CustomValidator custom;
    private int max;
    private String check;

    @Override
    public void initialize(CustomValidator constraintAnnotation) {
        this.custom = constraintAnnotation;
        max = custom.max();
        check = custom.check();
    }

    /**
     * 这是真实做验证的方法
     *
     * @param string
     * @param constraintValidatorContext
     * @return
     */
    @Override
    public boolean isValid(String string, ConstraintValidatorContext constraintValidatorContext) {
        return string.contains(check) && string.length() < max;
//        //禁用默认的message的值
//        constraintValidatorContext.disableDefaultConstraintViolation();
//        //重新添加错误提示语句
//        constraintValidatorContext.buildConstraintViolationWithTemplate("字符串不能为空").addConstraintViolation();
    }
}
