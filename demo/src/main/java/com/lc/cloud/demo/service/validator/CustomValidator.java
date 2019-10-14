package com.lc.cloud.demo.service.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

/**
 * Constraint 注解声明用什么类来实现验证，必须实现ConstraintValidator接口
 */
@Constraint(validatedBy = {CustomValidatorClass.class})
@Documented
@Target({ElementType.ANNOTATION_TYPE, ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface CustomValidator {

    String message() default "这个是自定义异常，必须包含字符串{check},并且长度不能大于{max}";

    int max() default 5;

    String check() default "lc";

    /**
     * 这个是规范，必须有group的概念
     *
     * @return
     */
    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
