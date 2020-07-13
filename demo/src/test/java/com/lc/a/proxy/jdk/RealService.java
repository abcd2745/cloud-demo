package com.lc.a.proxy.jdk;

public class RealService implements IProxyService {

	@Override
	public String sayHello() {
		System.out.println("I'm real object ,I'm running");
		return "hello,I'm real object";
	}
}
