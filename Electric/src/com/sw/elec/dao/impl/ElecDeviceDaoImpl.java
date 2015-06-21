package com.sw.elec.dao.impl;

import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecDeviceDao;
import com.sw.elec.domain.ElecDevice;

@Repository(IElecDeviceDao.SERVICE_NAME)
public class ElecDeviceDaoImpl extends CommonDaoImpl<ElecDevice>
		implements IElecDeviceDao {

}
