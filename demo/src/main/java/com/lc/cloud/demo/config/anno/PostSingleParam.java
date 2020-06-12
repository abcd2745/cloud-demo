package com.lc.cloud.demo.config.anno;

import java.lang.annotation.*;

/**
 * post方法接收单个入参,只支持简单类型
 * 不想每次新建对象，更不想用map
 * 参考:https://www.cnblogs.com/swugogo/p/9885509.html
 *
 * @author Thinkpad
 */
@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface PostSingleParam {

	/**
	 * key 值
	 *
	 * @return
	 */
	String value();

	/**
	 * 是否必输
	 *
	 * @return
	 */
	boolean required() default true;

	/**
	 * 正则匹配，非空白符
	 * 验证防这里是简单一点，用Validator 会更优雅，但是要引入jar包
	 *
	 * @return
	 */
	String checkRule() default "\\S";

	/**
	 * 必输时，校验失败的提示信息
	 *
	 * @return
	 */
	String checkMsg() default "";
}
