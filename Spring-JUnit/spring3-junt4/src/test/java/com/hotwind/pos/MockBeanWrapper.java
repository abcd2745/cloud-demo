package com.hotwind.pos;

import lombok.Data;

@Data
public class MockBeanWrapper {
    private String beanName;
    private Class<?> beanType;
    private Object mockObject;
}
