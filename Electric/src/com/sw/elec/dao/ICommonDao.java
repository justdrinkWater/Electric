package com.sw.elec.dao;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

import com.sw.elec.util.PageInfo;

public interface ICommonDao<T> {
	public void save(T entity);

	public void update(T entity);

	public T findObjectByID(Serializable id);

	public void deleteObjectByIDs(Serializable... ids);
	
	public void deleteObjectByCollection(List<T> entities);

	public List<T> findCollectionByConditionNoPage(String hqlWhere,
			Object[] params, LinkedHashMap<String, String> orderBy);

	public void saveObjectsByCollection(List<T> entities);

	List<T> findCollectionByConditionWithPage(String hqlWhere,
			Object[] params, LinkedHashMap<String, String> orderBy,
			PageInfo pageInfo);
	
	public List<T> findObjectByIDs(Serializable... ids);

}
