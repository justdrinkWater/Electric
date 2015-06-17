package com.sw.elec.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sw.elec.web.form.ElecLogForm;


public interface IElecLogService {
	public final static String SERVICE_NAME="com.sw.elec.service.impl.ElecLogServiceImpl";

	void addLog(HttpServletRequest request, String string);

	List<ElecLogForm> findElecLog(ElecLogForm elecLogForm);

	void deleteLogByFind(ElecLogForm elecLogForm);
}	
