package com.sw.elec.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecUserDao;
import com.sw.elec.domain.ElecUser;

@Repository(IElecUserDao.SERVICE_NAME)
public class ElecUserDaoImpl extends CommonDaoImpl<ElecUser> implements
		IElecUserDao {

	@Override
	public List<ElecUser> findByLogonName(String logonName) {
		List<ElecUser> userList = (List<ElecUser>) this.getHibernateTemplate()
				.execute(new HibernateCallback<List<ElecUser>>() {

					@Override
					public List<ElecUser> doInHibernate(Session session)
							throws HibernateException {
						return session.createQuery(
								"from ElecUser o where o.logonName = " + "'"
										+ logonName + "'").list();
					}
				});
		return userList;
	}

}
