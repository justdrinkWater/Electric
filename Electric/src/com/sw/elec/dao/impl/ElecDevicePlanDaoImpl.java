package com.sw.elec.dao.impl;

import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecDevicePlanDao;
import com.sw.elec.domain.ElecDevicePlan;

@Repository(IElecDevicePlanDao.SERVICE_NAME)
public class ElecDevicePlanDaoImpl extends CommonDaoImpl<ElecDevicePlan> implements
		IElecDevicePlanDao {
}
