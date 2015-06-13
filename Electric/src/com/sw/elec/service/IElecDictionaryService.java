package com.sw.elec.service;

import java.util.List;

import com.sw.elec.web.form.ElecDictionaryForm;

public interface IElecDictionaryService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecDictionaryServiceImpl";

	List<ElecDictionaryForm> findDictionaryKeyword();

	List<ElecDictionaryForm> findDDlNameByKeyword(String keyword);

	void saveDictionary(ElecDictionaryForm elecDictionaryForm);
}
