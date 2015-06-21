package com.sw.elec.dao;

import com.sw.elec.domain.ElecDevice;

public interface IElecDeviceDao extends ICommonDao<ElecDevice> {
	public final static String SERVICE_NAME = "com.sw.elec.dao.impl.ElecDeviceDaoImpl";

}
