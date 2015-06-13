package com.sw.elec.dao.impl;

import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecTextDao;
import com.sw.elec.domain.ElecText;

@Repository(IElecTextDao.SERVICE_NAME)
public class ElecTextDaoImpl extends CommonDaoImpl<ElecText> implements
		IElecTextDao {

}
