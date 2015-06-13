package com.sw.elec.dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecCommonMsgDao;
import com.sw.elec.domain.ElecCommonMsg;

@Repository(IElecCommonMsgDao.SERVICE_NAME)
public class ElecCommonMsgDaoImpl extends CommonDaoImpl<ElecCommonMsg>
		implements IElecCommonMsgDao {

	@Transactional(readOnly = false)
	@Override
	public List<Object[]> findElecCommonMsgCurrentDate() {
		Date date = new Date(new java.util.Date().getTime());
		List<Object[]> list = (List<Object[]>) this.getHibernateTemplate()
				.execute(new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException {
						List<Object> list = session.createSQLQuery(
								"select stationRun ,devRun from elec_commonmsg where createDate = '"
										+ date + "'").list();
						return list;
					}
				});
		return list;
	}

}
