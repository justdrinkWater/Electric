package com.sw.elec.dao;

import java.util.List;

import com.sw.elec.domain.ElecCommonMsg;

public interface IElecCommonMsgDao extends ICommonDao<ElecCommonMsg> {
	public final static String SERVICE_NAME = "com.sw.elec.dao.impl.ElecCommonMsgDaoImpl";

	public List<Object[]> findElecCommonMsgCurrentDate();


}
