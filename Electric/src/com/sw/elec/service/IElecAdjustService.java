package com.sw.elec.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sw.elec.web.form.ElecAdjustForm;

public interface IElecAdjustService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecAdjustServiceImpl";

	List<ElecAdjustForm> findAllDeviceAdjustWithPage(
			ElecAdjustForm elecAdjustForm, HttpServletRequest request);

	ElecAdjustForm findAdjustFormByDevID(ElecAdjustForm elecAdjustForm);

	void save(ElecAdjustForm elecAdjustForm,HttpServletRequest request);

	List<ElecAdjustForm> findAllDeviceAdjustWithdevID(
			ElecAdjustForm elecAdjustForm);

	Map<String, String> getAllFieldNameWhenExportExcel(
			ElecAdjustForm elecAdjustForm);

	ArrayList<ArrayList<String>> getFiledDataWhenExportExcel(
			ElecAdjustForm elecAdjustForm, ArrayList<String> fields);

}
