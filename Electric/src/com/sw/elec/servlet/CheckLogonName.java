package com.sw.elec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecUserService;

@SuppressWarnings("serial")
public class CheckLogonName extends HttpServlet {

	IElecUserService elecuserService = (IElecUserService) ServiceProvider
			.getService(IElecUserService.SERVICE_NAME);

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String logonName = request.getParameter("logonName");
		String checkflag = elecuserService.checkLogonName(logonName);
		out.print(checkflag);
		out.flush();
		out.close();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String logonName = request.getParameter("logonName");
		String checkflag = elecuserService.checkLogonName(logonName);
		out.print(checkflag);
		out.flush();
		out.close();
	}

}
