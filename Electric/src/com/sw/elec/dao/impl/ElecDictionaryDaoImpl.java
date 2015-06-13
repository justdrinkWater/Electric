package com.sw.elec.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.domain.ElecDictionary;

@Repository(IElecDictionaryDao.SERVICE_NAME)
public class ElecDictionaryDaoImpl extends CommonDaoImpl<ElecDictionary>
		implements IElecDictionaryDao {

	@Override
	public List<Object> findDictionaryKeyword() {
		List<Object> list = (List<Object>) this.getHibernateTemplate().execute(
				new HibernateCallback<List<Object>>() {

					@Override
					public List<Object> doInHibernate(Session session)
							throws HibernateException {
						return session
								.createSQLQuery(
										"SELECT DISTINCT o.keyword  FROM Elec_Dictionary o")
								.list();
					}
				});
		return list;
	}

	// 通过关键字和ddlcode找到ddlName
	@Override
	public List<Object> findDictionaryName(String keyword, String ddlcode) {
		/**
		 * SELECT ddlName FROM elec_dictionary o WHERE o.`Keyword` = "性别" AND
		 * o.`DdlCode` = "1"
		 */
		String hqlWhere = "SELECT o.ddlName FROM elec_dictionary o WHERE o.keyword = '"
				+ keyword + (ddlcode != null? "' AND o.ddlCode = '" + ddlcode + "'":"");
		List<Object> list = (List<Object>) this.getHibernateTemplate().execute(
				new HibernateCallback<List<Object>>() {

					@Override
					public List<Object> doInHibernate(Session session)
							throws HibernateException {
						return session.createSQLQuery(hqlWhere).list();
					}
				});
		return list;
	}

}
