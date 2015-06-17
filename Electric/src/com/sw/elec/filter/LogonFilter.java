package com.sw.elec.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sw.elec.domain.ElecUser;

public class LogonFilter implements Filter {

	// 这里面的uri是不需要拦截的
	List<String> noFilterPathUri = null;

	@Override
	public void init(FilterConfig config) throws ServletException {
		noFilterPathUri = new ArrayList<String>();
		noFilterPathUri.add("/index.jsp");
		noFilterPathUri.add("/image.jsp");
		noFilterPathUri.add("/system/elecMenuAction_home.do");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 获得需要使用的request，response，session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();

		// 获得用户请求的路径
		String path = servletRequest.getServletPath();

		// 当需要访问的路径为不需要过滤的路径则放行
		if (noFilterPathUri != null && noFilterPathUri.contains(path)) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}

		// 判断session中的用户是否存在，如果不存在，则需要重新登录
		// 如果存在则放行
		ElecUser user = (ElecUser) session.getAttribute("globle_user");
		if (user != null) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		} else {
			servletResponse.sendRedirect("/Electric");
		}
	}

	@Override
	public void destroy() {

	}

}
