package com.sw.elec.dao;

import java.util.List;

import com.sw.elec.domain.ElecDictionary;

public interface IElecDictionaryDao extends ICommonDao<ElecDictionary> {
	public final static String SERVICE_NAME = "com.sw.elec.dao.impl.ElecDictionaryDaoImpl";

	List<Object> findDictionaryKeyword();

	List<Object> findDictionaryName(String string, String isDuty);

	List<Object> findDictionaryDDLCode(String string, String content);

}
