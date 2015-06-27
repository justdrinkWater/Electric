package com.sw.elec.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sw.elec.web.form.ElecAdjustForm;

public interface IElecAdjustService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecAdjustServiceImpl";

	List<ElecAdjustForm> findAllDeviceAdjustWithPage(
			ElecAdjustForm elecAdjustForm, HttpServletRequest request);

}
