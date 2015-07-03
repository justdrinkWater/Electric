package com.sw.elec.dao.impl;

import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecStationDao;
import com.sw.elec.domain.ElecStation;

@Repository(IElecStationDao.SERVICE_NAME)
public class ElecStationDaoImpl extends CommonDaoImpl<ElecStation> implements
		IElecStationDao {

}
