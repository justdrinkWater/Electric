package com.sw.elec.dao.impl;

import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecRolePopedomDao;
import com.sw.elec.domain.ElecRolePopedom;

@Repository(IElecRolePopedomDao.SERVICE_NAME)
public class ElecRolePopedomDaoImpl extends CommonDaoImpl<ElecRolePopedom> implements
		IElecRolePopedomDao {

}
