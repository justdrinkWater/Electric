package com.sw.elec.service;

import java.util.List;

import com.sw.elec.util.XMLObject;
import com.sw.elec.web.form.ElecUserForm;
import com.sw.elec.web.form.ElecUserRoleForm;

public interface IElecUserRoleService {
	public final static String SERVICE_NAME = "com.sw.elec.service.impl.ElecUserRoleServiceImpl";

	List<XMLObject> readXML();

	List<ElecUserForm> findElecUserListByRoleID(String roleid);

	List<XMLObject> readFlagXML(String roleid);

	void save(ElecUserRoleForm elecUserRoleForm);

}
