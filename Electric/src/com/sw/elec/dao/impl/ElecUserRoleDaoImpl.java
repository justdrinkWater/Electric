package com.sw.elec.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.sw.elec.dao.IElecUserRoleDao;
import com.sw.elec.domain.ElecUserRole;

@Repository(IElecUserRoleDao.SERVICE_NAME)
public class ElecUserRoleDaoImpl extends CommonDaoImpl<ElecUserRole> implements
		IElecUserRoleDao {

	// 通过roleid找到拥有此角色和不拥有此角色的用户
	@Override
	public List<Object[]> findElecUserListByRoleID(String roleid) {
		/*
		 * SELECT DISTINCT elec_user_role.RoleID AS flag, elec_user.UserID AS
		 * userid, elec_user.UserName AS userName, elec_user.LogonName AS
		 * logonName FROM elec_user LEFT OUTER JOIN elec_user_role ON
		 * elec_user.`UserID` = elec_user_role.`UserID` AND
		 * elec_user_role.`RoleID` = '1' WHERE elec_user.`IsDuty` = '1'
		 */
		String sql = "SELECT DISTINCT CASE elec_user_role.RoleID "
				+ " WHEN "+ roleid +" THEN '1' ELSE '0' END AS flag, " 
				+ " elec_user.UserID AS userid, "
				+ " elec_user.UserName AS userName, "
				+ " elec_user.LogonName AS logonName  "
				+ " FROM elec_user LEFT OUTER JOIN elec_user_role  "
				+ " ON elec_user.userID = elec_user_role.userID  "
				+ " AND elec_user_role.roleID =  " + roleid
				+ " WHERE elec_user.isDuty = '1' ";
		List<Object[]> list = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Object[]>>() {

					@Override
					public List<Object[]> doInHibernate(Session session)
							throws HibernateException {
						return session.createSQLQuery(sql).list();
					}
				});
		return list;
	}
}
