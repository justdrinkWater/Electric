package com.sw.elec.dao;

import java.util.List;

import com.sw.elec.domain.ElecUserRole;

public interface IElecUserRoleDao extends ICommonDao<ElecUserRole> {
	public final static String SERVICE_NAME = "com.sw.elec.dao.impl.ElecUserRoleDaoImpl";

	List<Object[]> findElecUserListByRoleID(String roleid);

}
