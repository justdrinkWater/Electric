package com.sw.elec.dao.impl;

import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecLogDao;
import com.sw.elec.domain.ElecLog;

@Repository(IElecLogDao.SERVICE_NAME)
public class ElecLogDaoImpl extends CommonDaoImpl<ElecLog> implements
		IElecLogDao {

}
