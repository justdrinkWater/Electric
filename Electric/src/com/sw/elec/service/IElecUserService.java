package com.sw.elec.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sw.elec.domain.ElecUser;
import com.sw.elec.web.form.ElecUserForm;


public interface IElecUserService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecUserServiceImpl";

	List<ElecUserForm> findUsers(ElecUserForm elecUserForm);

	void saveUser(ElecUserForm elecUserForm);

	ElecUserForm findUser(String userID);

	void delete(ElecUserForm elecUserForm);

	String checkLogonName(String logonName);

	ElecUser findUserByName(String logonName);

	String getPopedomByLogonName(String logonName);

	HashMap<String, String> findUserRoles(String logonName);

	List<ElecUserForm> findUsersWithPage(ElecUserForm elecUserForm,
			HttpServletRequest request);

	void saveUserByFile(ElecUserForm elecUserForm);

	List<String> getFiledNamesWhenExportExcel(ElecUserForm elecUserForm);

	ArrayList<ArrayList<String>> getFiledDateWhenExportExcel(ElecUserForm elecUserForm);

}
