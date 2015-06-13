package com.sw.elec.util;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class GenericSuperClass {

	public static Class getClass(Class tClass) {
		ParameterizedType pt = (ParameterizedType) tClass
				.getGenericSuperclass();
		Type[] arr =pt.getActualTypeArguments();
		Class entity = (Class) pt.getActualTypeArguments()[0];
		return entity;
	}

}
