package com.lc.cloud.demo.mock;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.InOrder;

import java.util.LinkedList;
import java.util.List;

import static org.hamcrest.CoreMatchers.is;
import static org.mockito.Mockito.*;

/**
 * 参考：https://blog.csdn.net/bboyfeiyu/article/details/52127551#0
 */
@RunWith(JUnit4.class)
public class MockDemoTest {

    @Test
    public void test() {
        // mock creation 创建mock对象
        List mockedList = mock(List.class);

        //using mock object 使用mock对象
        mockedList.add("one");
        mockedList.clear();

        //verification 验证
        verify(mockedList).add("one");
        verify(mockedList).clear();
    }

    /**
     * expected 定义要抛出的异常
     */
    @Test(expected = RuntimeException.class)
    public void test2() {
        //You can mock concrete classes, not only interfaces
        // 你可以mock具体的类型,不仅只是接口
        LinkedList mockedList = mock(LinkedList.class);

        //stubbing
        // 测试桩
        when(mockedList.get(0)).thenReturn("first");
        when(mockedList.get(1)).thenThrow(new RuntimeException());

        //following prints "first"
        // 输出“first”
        System.out.println(mockedList.get(0));

        //following throws runtime exception
        // 抛出异常
        System.out.println(mockedList.get(1));

        //following prints "null" because get(999) was not stubbed
        // 因为get(999) 没有打桩，因此输出null
        Assert.assertThat(isNull(), is(mockedList.get(999)));

        //Although it is possible to verify a stubbed invocation, usually it's just redundant
        //If your code cares what get(0) returns then something else breaks (often before even verify() gets executed).
        //If your code doesn't care what get(0) returns then it should not be stubbed. Not convinced? See here.
        //验证是否被调用一次，等效于下面的times(1)
        verify(mockedList).get(0);
        verify(mockedList, times(1)).get(0);
    }

    /**
     * 验证顺序
     */
    @Test
    public void verification_in_order() {
        List list = mock(List.class);
        List list2 = mock(List.class);
        list.add(1);
        list2.add("hello");
        list.add(2);
        list2.add("world");
        //将需要排序的mock对象放入InOrder
        InOrder inOrder = inOrder(list, list2);
        //下面的代码不能颠倒顺序，验证执行顺序
        inOrder.verify(list).add(1);
        inOrder.verify(list2).add("hello");
        inOrder.verify(list).add(2);
        inOrder.verify(list2).add("world");
    }

}
