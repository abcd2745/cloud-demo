package com.lc.java8.base;

public class ClassGetNameTest {


	public static void main(String[] args) throws ClassNotFoundException {
//		WeiYi.class.getName();

		//会加载类对象
		Class.forName(WeiYi.class.getName());

	}
}