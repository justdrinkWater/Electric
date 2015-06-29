package com.sw.elec.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sw.elec.web.form.ElecDeviceForm;


public interface IElecDeviceService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecDeviceServiceImpl";

	List<ElecDeviceForm> findDevicesWithPage(ElecDeviceForm elecDeviceForm,
			HttpServletRequest request);

	void saveDevice(ElecDeviceForm elecDeviceForm,HttpServletRequest request);

	ElecDeviceForm findDevice(String devID);

	Map<String,String> getAllFiledNamesWhenExportExcel(
			ElecDeviceForm elecDeviceForm);

	ArrayList<ArrayList<String>> getFiledDateWhenExportExcel(
			ElecDeviceForm elecDeviceForm,ArrayList<String> fields);

	void delete(ElecDeviceForm elecDeviceForm);

	List<ElecDeviceForm> findAllDevices();

	List<ElecDeviceForm> findDeviceByDevType(String devType);

}
