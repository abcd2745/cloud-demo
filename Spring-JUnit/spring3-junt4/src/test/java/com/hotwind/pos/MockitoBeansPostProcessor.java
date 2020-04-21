package com.hotwind.pos;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class MockitoBeansPostProcessor implements BeanFactoryPostProcessor {

    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        Map<Class<?>, MockBeanWrapper> allMockBeans = MockitoBeansTestExecutionListener.resolvedAllMockBeans();
        for (Map.Entry<Class<?>, MockBeanWrapper> mockBeanWrapperEntry : allMockBeans.entrySet()) {
            beanFactory.registerResolvableDependency(mockBeanWrapperEntry.getKey(), mockBeanWrapperEntry.getValue().getMockObject());
        }
    }
}
