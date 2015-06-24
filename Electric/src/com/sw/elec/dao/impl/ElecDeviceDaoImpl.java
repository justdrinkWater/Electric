package com.sw.elec.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecDeviceDao;
import com.sw.elec.domain.ElecDevice;

@Repository(IElecDeviceDao.SERVICE_NAME)
public class ElecDeviceDaoImpl extends CommonDaoImpl<ElecDevice>
		implements IElecDeviceDao {

}
