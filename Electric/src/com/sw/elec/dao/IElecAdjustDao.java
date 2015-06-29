package com.sw.elec.dao;

import java.util.List;

import com.sw.elec.domain.ElecAdjust;

public interface IElecAdjustDao extends ICommonDao<ElecAdjust> {
	public final static String SERVICE_NAME = "com.sw.elec.dao.impl.ElecAdjustDaoImpl";

	List<Object[]> findAdjustsByDevIDOrderByAdjustDate(String devID);

	List<Object[]> findAllAdjustWithDevice();


}
