package com.lc.cloud.demo.service.validator.group;

import javax.validation.groups.Default;

/**
 * Default 是默认的分组
 * 当验证的注解（@Size，@Null 。。。）不设置分组时，使用的就是Default
 * 参考：https://www.cnblogs.com/shianliang/p/10321047.html
 */
public interface MyGroup extends Default {
}
