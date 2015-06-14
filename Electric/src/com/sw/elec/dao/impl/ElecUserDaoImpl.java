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

	// 通过登录名查找此用户的权限
	@Override
	public List<Object> getPopedomByLogonName(String logonName) {
		String sql = "select a.popedomcode from elec_role_popedom as a "
				+ " left join elec_user_role as b on a.roleID = b.RoleID "
				+ " left join elec_user as c on b.userID = c.userID "
				+ " where c.logonName = '" + logonName + "'";
		List<Object> list = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Object>>() {

					@Override
					public List<Object> doInHibernate(Session session)
							throws HibernateException {
						return session.createSQLQuery(sql).list();
					}
				});
		return list;
	}

	// 通过登录名查找此用户拥有哪些角色
	@Override
	public List<Object[]> findUserRoles(String logonName) {
		/**
		 * #通过用户查询此用户有哪些角色 
			#查询角色和角色ID
			SELECT * FROM elec_dictionary AS a
			LEFT JOIN elec_user_role AS b ON a.`DdlCode` = b.`RoleID`
			LEFT JOIN elec_user AS c ON c.`UserID` = b.`UserID`
			WHERE c.`LogonName` = 'zhugeliang' 
			AND a.`Keyword`= '角色类型'
		 */
		String sql = "SELECT a.ddlCode , a.ddlName FROM elec_dictionary AS a "+
			" LEFT JOIN elec_user_role AS b ON a.ddlCode = b.roleID " +
			" LEFT JOIN elec_user AS c ON c.userID = b.userID " +
			" WHERE c.logonName = '" + logonName + "' " +
			" AND a.keyword = '角色类型'";
		List<Object[]> list = (List<Object[]>) this.getHibernateTemplate()
				.execute(new HibernateCallback<List<Object[]>>() {

					@Override
					public List<Object[]> doInHibernate(Session session)
							throws HibernateException {
						return session.createSQLQuery(sql).list();
					}
				});
		return list;
	}

}
