package com.sw.elec.container;

import org.apache.commons.lang3.StringUtils;

public class ServiceProvider {

	public static ServiceProviderCord spc;
	// 加载beans.xml文件
	static {
		spc = new ServiceProviderCord();
		spc.load("beans.xml");
	}

	public static Object getService(String serviceName) {
		if (StringUtils.isBlank(serviceName)) {
			throw new RuntimeException("当前服务名称不存在");
		}
		Object object = null;
		if (spc.ac.containsBean(serviceName)) {
			object = spc.ac.getBean(serviceName);
		}
		if (object == null) {
			throw new RuntimeException("当前服务名称【" + serviceName + "】下服务节点不存在");
		}
		return object;
	}
}
