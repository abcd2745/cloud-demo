package com.hotwind.pos;

import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.Spy;
import org.springframework.test.context.TestContext;
import org.springframework.test.context.support.AbstractTestExecutionListener;
import org.springframework.util.Assert;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class MockitoBeansTestExecutionListener extends AbstractTestExecutionListener {

    private static final Map<Class<?>, MockBeanWrapper> mockBeans = new ConcurrentHashMap<>(30);
    private static final Map<Class<?>, List<Field>> injectMockBeans = new ConcurrentHashMap<>(30);
    private static boolean hasInitialized = false;

    public static Map<Class<?>, MockBeanWrapper> resolvedAllMockBeans() {
        Assert.isTrue(hasInitialized);
        return Collections.unmodifiableMap(mockBeans);
    }

    /**
     * @param testContext
     * @throws Exception
     */
    @Override
    public void beforeTestClass(TestContext testContext) throws Exception {
        Field[] declaredFields = testContext.getTestClass().getDeclaredFields();
        //将需要mock的对象创建出来
        for (Field field : declaredFields) {
            Annotation[] annotations = field.getAnnotations();

            for (Annotation annotation : annotations) {
                if (annotation instanceof Mock || annotation instanceof Spy) {
                    MockBeanWrapper wrapper = new MockBeanWrapper();
                    Class<?> type = field.getType();
                    if (annotation instanceof Mock) {
                        wrapper.setMockObject(Mockito.mock(type));
                    } else {
                        wrapper.setMockObject(Mockito.spy(type));
                    }
                    wrapper.setBeanType(type);
                    wrapper.setBeanName(field.getName());
                    if (!mockBeans.containsKey(wrapper.getBeanType())) {
                        mockBeans.put(wrapper.getBeanType(), wrapper);
                    }
                    List<Field> fields;
                    if (injectMockBeans.containsKey(testContext.getTestClass())) {
                        fields = injectMockBeans.get(testContext.getTestClass());
                    } else {
                        fields = new ArrayList<>();
                    }
                    fields.add(field);
                    injectMockBeans.put(testContext.getTestClass(), fields);
                }
            }
        }
        hasInitialized = true;
        super.beforeTestClass(testContext);
    }

    @Override
    public void beforeTestMethod(TestContext testContext) throws Exception {
        Object testInstance = testContext.getTestInstance();
        List<Field> fields = injectMockBeans.get(testContext.getTestClass());
        if (fields != null) {
            for (Field field : fields) {
                field.setAccessible(true);
                field.set(testInstance, mockBeans.get(field.getType()).getMockObject());
            }
        }
    }
}
