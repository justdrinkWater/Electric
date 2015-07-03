package com.sw.elec.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sw.elec.web.form.ElecStationForm;

public interface IElecStationService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecStationServiceImpl";

	List<ElecStationForm> findAllStationWithPage(
			ElecStationForm elecStationForm, HttpServletRequest request);

	void saveStation(ElecStationForm elecStationForm, HttpServletRequest request);

	ElecStationForm findStationByID(String stationID);

	void deleteStation(ElecStationForm elecStationForm);

	Map<String, String> getAllFieldNameWhenExportExcel(
			ElecStationForm elecStationForm);

	ArrayList<ArrayList<String>> getFiledDataWhenExportExcel(
			ElecStationForm elecStationForm, ArrayList<String> fields);
}
