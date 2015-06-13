package com.sw.elec.service;

import java.util.List;

import com.sw.elec.domain.ElecText;
import com.sw.elec.web.form.ElecTextForm;

public interface IElecTextService {
	public final static String SERVICE_NAME="com.sw.elec.service.impl.ElecTextServiceImpl";
	
	public void saveText(ElecText elecText);

	public List<ElecText> findCollectionByConditionNoPage(
			ElecTextForm elecTextForm);
}	
