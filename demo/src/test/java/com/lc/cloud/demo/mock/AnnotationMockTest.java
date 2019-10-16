package com.lc.cloud.demo.mock;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.List;

import static org.mockito.Mockito.verify;

@RunWith(JUnit4.class)
public class AnnotationMockTest {

    @Mock
    private List<String> mockList;

    public AnnotationMockTest() {
        //必须在基类中添加初始化mock的代码 或者 @RunWith(MockitoJUnitRunner.class)
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void test() {
        mockList.add("1");
        verify(mockList).add("1");
    }
}
