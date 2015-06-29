package com.sw.elec.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecAdjustDao;
import com.sw.elec.domain.ElecAdjust;

@Repository(IElecAdjustDao.SERVICE_NAME)
public class ElecAdjustDaoImpl extends CommonDaoImpl<ElecAdjust> implements
		IElecAdjustDao {

	//通过设备的外键ID从adjust表中取得所有的adjust数据，并且数据按照时间的降序排列
	@Override
	public List<Object[]> findAdjustsByDevIDOrderByAdjustDate(String devID) {
		//SELECT * FROM  elec_Adjust o 
		//WHERE o.devID = '4028b8814e20c04b014e20c1c8b20000' 
		//AND o.isDelete = '0' ORDER BY o.adjustDate
		String sqlWhere = "select * from  elec_Adjust o where o.devID = '" + devID +"' and o.isDelete = '0' order by o.adjustDate";
		List<Object[]> adjustList = this.getHibernateTemplate().execute(new HibernateCallback<List<Object[]>>() {

			@Override
			public List<Object[]> doInHibernate(Session session)
					throws HibernateException {
				return session.createSQLQuery(sqlWhere).list();
			}
		});
		return adjustList;
	}

	//通过adjust表左链接查询device表，找到关联的所有记录
	@Override
	public List<Object[]> findAllAdjustWithDevice() {
		String sqlWhere = "SELECT "
							+"a.record, "
							+"d.devName, "
							+"d.devType, "
							+"d.adjustPeriod, "
							+"d.useDate, "
							+"d.jctID, "
							+"a.adjustDate, "
							+"a.comment "
							+" FROM elec_adjust as a LEFT JOIN elec_device as d on a.devID = d.devID ";
		List<Object[]> list = this.getHibernateTemplate().execute(new HibernateCallback<List<Object[]>>() {

			@Override
			public List<Object[]> doInHibernate(Session session)
					throws HibernateException {
				return session.createSQLQuery(sqlWhere).list();
			}
		});
		return list;
	}

}
