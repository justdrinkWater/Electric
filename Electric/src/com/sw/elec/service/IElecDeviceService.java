package com.sw.elec.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sw.elec.web.form.ElecDeviceForm;


public interface IElecDeviceService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecDeviceServiceImpl";

	List<ElecDeviceForm> findDevicesWithPage(ElecDeviceForm elecDeviceForm,
			HttpServletRequest request);

	void saveDevice(ElecDeviceForm elecDeviceForm,HttpServletRequest request);

	ElecDeviceForm findDevice(String devID);

}
