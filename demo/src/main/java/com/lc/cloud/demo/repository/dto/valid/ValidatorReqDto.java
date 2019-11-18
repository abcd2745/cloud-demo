package com.lc.cloud.demo.repository.dto.valid;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.*;
import java.util.Date;
import java.util.List;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ValidatorReqDto {

    /**
     * 字符串，集合，map限制大小
     */
    @NotEmpty(message = "名字不能为空")
    @NotBlank(message = "名字不能为空 blank")
    @Size(min = 2, max = 6, message = "名字size在2-6位")
    @Length(min = 2, max = 6, message = "名字length在2-6位")
    private String name;

    @NotEmpty(message = "pass不能为空")
    @NotBlank(message = "pass不能为空 blank")
    @Length(min = 3, max = 3, message = "pass 长度不为3")
    private String pass;

    /**
     * 被注释的元素必须是一个数字，其值必须大于等于指定的最小值
     */
    @DecimalMin(value = "10", inclusive = true, message = "salary 低于10")
    private Integer salary;

    @Range(min = 5, max = 10, message = "range 不在范围内")
    private Integer range;

    @NotNull(message = "年龄不能为空")
    @Min(value = 18, message = "年龄不能小于18")
    @Max(value = 70, message = "年龄不能大于70")
    private Integer age;

    @Email
    private String email;

    @AssertTrue
    private Boolean flag;

    /**
     * 必须是已过的时间
     */
    @Past
    private Date birthday;

    /**
     * 未来时间
     */
    @Future
    private Date expire;

    @URL(message = "url 格式不对")
    private String url;

    @Pattern(regexp = "((2(5[0-5]|[0-4]\\d))|[0-1]?\\d{1,2})(\\.((2(5[0-5]|[0-4]\\d))|[0-1]?\\d{1,2})){3}", flags = Pattern.Flag.CASE_INSENSITIVE)
    public String pattern;

    /**
     * 字符串，集合，map限制大小
     */
    @Size(min = 2, max = 6, message = "长度在2-6位")
    private List<Integer> list;

}
