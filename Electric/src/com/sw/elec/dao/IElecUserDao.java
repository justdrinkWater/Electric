package com.sw.elec.dao;

import java.util.List;

import com.sw.elec.domain.ElecUser;

public interface IElecUserDao extends ICommonDao<ElecUser> {
	public final static String SERVICE_NAME = "com.sw.elec.dao.impl.ElecUserDaoImpl";

	List<ElecUser> findByLogonName(String logonName);

	List<Object> getPopedomByLogonName(String logonName);

	List<Object[]> findUserRoles(String logonName);

}
