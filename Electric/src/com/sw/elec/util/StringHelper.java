package com.sw.elec.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringHelper {

	/**
	 * 将字符串形式的类型转换成日期类型
	 * 
	 * @param textDate
	 * @return
	 */
	public static Date stringConvertDate(String textDate) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = format.parse(textDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
}
