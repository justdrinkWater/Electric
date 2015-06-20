package com.sw.elec.test;

import java.io.UnsupportedEncodingException;

public class TestCoding {
	public static void main(String[] args) {
		String str = "å¼ ";
		try {
			String result = new String(str.getBytes("ISO-8859-1"), "utf-8");
			System.out.println(result);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
}
