package com.sw.elec.service;

import java.util.List;

import com.sw.elec.web.form.ElecCommonMsgForm;

public interface IElecCommonMsgService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecCommonMsgServiceImpl";

	public List<ElecCommonMsgForm> findElecCommonMsgList();

	public void saveElecCommonMsg(ElecCommonMsgForm elecCommonMsgForm);

	public List<ElecCommonMsgForm> findElecCommonMsgCurrentDate();
}
