package com.sw.elec.container;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ServiceProviderCord {
	protected static ApplicationContext ac;

	// 加载beans.xml
	public static void load(String filename) {
		ac = new ClassPathXmlApplicationContext(filename);
	}

}
