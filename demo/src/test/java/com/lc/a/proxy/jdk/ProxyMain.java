package com.lc.a.proxy.jdk;

import javax.security.auth.Subject;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;

public class ProxyMain {

	public static void main(String[] args) {
		IProxyService realService = new RealService();
		/**
		 * InvocationHandlerImpl 实现了 InvocationHandler 接口，并能实现方法调用从代理类到委托类的分派转发
		 * 其内部通常包含指向委托类实例的引用，用于真正执行分派转发过来的方法调用.
		 * 即：要代理哪个真实对象，就将该对象传进去，最后是通过该真实对象来调用其方法
		 */
		InvocationHandler handler = new JdkDynamicProxy(realService);

		ClassLoader loader = realService.getClass().getClassLoader();
		Class[] interfaces = realService.getClass().getInterfaces();
		/**
		 * 该方法用于为指定类装载器、一组接口及调用处理器生成动态代理类实例
		 */
		IProxyService subject = (IProxyService) Proxy.newProxyInstance(loader, interfaces, handler);

		subject.sayHello();

	}
}
