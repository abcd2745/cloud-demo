package com.lc.cloud.demo.repository.dto.valid;

import com.lc.cloud.demo.service.validator.group.MyGroupNoExtendsDefault;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
public class GroupNoExtendsDefaultValidatorReqDto {

    /**
     * 字符串，集合，map限制大小
     */
    @NotEmpty(message = "名字不能为空")
    @Size(groups = {MyGroupNoExtendsDefault.class}, min = 2, max = 6, message = "名字size在2-6位")
    @Length(min = 3, max = 9, message = "名字length在3-9位")
    private String name;

    @Length(groups = {MyGroupNoExtendsDefault.class}, min = 3, max = 3, message = "pass 长度不为3")
    private String pass;

}
