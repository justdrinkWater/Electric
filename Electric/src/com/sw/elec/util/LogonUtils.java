package com.sw.elec.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogonUtils {

	public static boolean checkNum(HttpServletRequest request) {
		// 由于在jsp中已经将验证码放到session中了，这里从session中得到验证码
		String CcheckNum = (String) request.getSession().getAttribute(
				"CHECK_NUMBER_KEY");
		// 从request中得到用户输入的验证码
		String checkNum = request.getParameter("checkNum");
		// 两者互相进行比较，不相同，则输出错误信息
		if (checkNum != null && CcheckNum != null
				&& !CcheckNum.equals(checkNum)) {
			return false;
		}
		return true;

	}

	public static void remeberUser(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String logonName = request.getParameter("name");
		String logonPwd = request.getParameter("password");

		//由于会有中文问题，需要设置编码格式
		Cookie cookieName = new Cookie("logonName", URLEncoder.encode(logonName, "UTF-8"));
		Cookie cookiePwd = new Cookie("logonPwd", logonPwd);

		String path = request.getContextPath();

		// 设置路径
		cookieName.setPath(path + "/");
		cookiePwd.setPath(path + "/");
		
		

		//设置过期时间
		if ("yes".equals(request.getParameter("remeber"))) {
			cookieName.setMaxAge(7 * 24 * 60 * 60);
			cookiePwd.setMaxAge(7 * 24 * 60 * 60);
		}else{
			cookieName.setMaxAge(0);
			cookiePwd.setMaxAge(0);
		}

		response.addCookie(cookieName);
		response.addCookie(cookiePwd);

	}

}
