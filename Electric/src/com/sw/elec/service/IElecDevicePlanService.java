package com.sw.elec.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sw.elec.web.form.ElecDevicePlanForm;

public interface IElecDevicePlanService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecDevicePlanServiceImpl";

	void save(ElecDevicePlanForm elecDevicePlanForm, HttpServletRequest request);

	List<ElecDevicePlanForm> findAllDevicePlanWithPage(
			ElecDevicePlanForm elecDevicePlanForm, HttpServletRequest request);

	void delete(ElecDevicePlanForm elecDevicePlanForm);

	void purchase(ElecDevicePlanForm elecDevicePlanForm);

	ElecDevicePlanForm findDevicePlanByID(String devPlanID);

	void saveDevicePlanByFile(ElecDevicePlanForm elecDevicePlanForm);
}
