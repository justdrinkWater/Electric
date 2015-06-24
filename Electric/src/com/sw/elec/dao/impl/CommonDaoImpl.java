package com.sw.elec.dao.impl;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.ICommonDao;
import com.sw.elec.util.GenericSuperClass;
import com.sw.elec.util.PageInfo;
import com.sw.elec.web.form.ElecDeviceForm;

public class CommonDaoImpl<T> extends HibernateDaoSupport implements
		ICommonDao<T> {

	private Class entity = (Class) GenericSuperClass.getClass(this.getClass());

	@Transactional(readOnly = false)
	@Override
	public void save(T entity) {
		this.getHibernateTemplate().save(entity);
	}

	@Resource(name = "sessionFactory")
	public final void setSessionFactoryDi(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Transactional(readOnly = false)
	@Override
	public void update(T entity) {
		this.getHibernateTemplate().update(entity);
	}

	@Transactional(readOnly = false)
	@Override
	public T findObjectByID(Serializable id) {
		return (T) this.getHibernateTemplate().get(entity, id);
	}

	@Transactional(readOnly = false)
	@Override
	public void deleteObjectByIDs(Serializable... ids) {
		for (int i = 0; ids != null && i < ids.length; i++) {
			Serializable id = ids[i];
			Object object = (Object) this.getHibernateTemplate()
					.get(entity, id);
			this.getHibernateTemplate().delete(object);
		}
	}

	@Transactional(readOnly = false)
	@Override
	public void deleteObjectByCollection(List<T> entities) {
		this.getHibernateTemplate().deleteAll(entities);
	}

	@Transactional(readOnly = false)
	@Override
	public List<T> findCollectionByConditionNoPage(String hqlWhere,
			Object[] params, LinkedHashMap<String, String> orderBy) {
		String hql = "from " + entity.getSimpleName() + " o where 1=1";

		String hqlOrderBy = this.orderByCondition(orderBy);
		hql = hql + hqlWhere + hqlOrderBy;
		final String finalHql = hql;
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<T> list = (List<T>) this.getHibernateTemplate().execute(
				new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException {
						Query query = session.createQuery(finalHql);
						setParameters(params, query);
						return query.list();
					}

				});
		return list;
	}

	private void setParameters(Object[] params, Query query) {
		for (int i = 0; params != null && i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
	}

	private String orderByCondition(LinkedHashMap<String, String> orderBy) {
		StringBuffer buffer = new StringBuffer("");
		if (orderBy != null) {
			buffer.append(" order by ");
			for (Map.Entry<String, String> map : orderBy.entrySet()) {
				buffer.append(" " + map.getKey() + " " + map.getValue() + ",");
			}
			buffer.deleteCharAt(buffer.length() - 1);
		}
		return buffer.toString();
	}

	@Transactional(readOnly = false)
	@Override
	public void saveObjectsByCollection(List<T> entities) {
		for (T t : entities) {
			this.getHibernateTemplate().save(t);
		}
	}

	//含分页的查找
	@Override
	public List<T> findCollectionByConditionWithPage(String hqlWhere,
			Object[] params, LinkedHashMap<String, String> orderBy,
			PageInfo pageInfo) {
		String hql = "from " + entity.getSimpleName() + " o where 1=1";
		String hqlOrderBy = this.orderByCondition(orderBy);
		hql = hql + hqlWhere + hqlOrderBy;
		final String finalHql = hql;
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<T> list = (List<T>) this.getHibernateTemplate().execute(
				new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException {
						Query query = session.createQuery(finalHql);
						setParameters(params, query);
						pageInfo.setTotalResult(query.list().size());
						query.setFirstResult(pageInfo.getBeginResult());
						query.setMaxResults(pageInfo.getPageSize());
						return query.list();
					}

				});
		return list;
	}

}
