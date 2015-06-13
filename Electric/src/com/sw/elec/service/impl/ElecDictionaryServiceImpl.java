package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.domain.ElecDictionary;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.web.form.ElecDictionaryForm;

@Transactional
@Service(IElecDictionaryService.SERVICE_NAME)
public class ElecDictionaryServiceImpl implements IElecDictionaryService {

	@Resource(name = IElecDictionaryDao.SERVICE_NAME)
	private IElecDictionaryDao elecDictionaryDao;

	@Override
	public List<ElecDictionaryForm> findDictionaryKeyword() {

		List<Object> objectList = elecDictionaryDao.findDictionaryKeyword();
		List<ElecDictionaryForm> list = this
				.convertKeywordObjectToVO(objectList);
		return list;
	}

	// 将从dao中得到的Object对象数组链表转换成list对象
	private List<ElecDictionaryForm> convertKeywordObjectToVO(
			List<Object> objectList) {
		List<ElecDictionaryForm> list = new ArrayList<ElecDictionaryForm>();
		ElecDictionaryForm eForm = null;
		for (int i = 0; i < objectList.size(); i++) {
			String keyword = (String) objectList.get(i);
			eForm = new ElecDictionaryForm();
			eForm.setKeyword(keyword);
			list.add(eForm);
		}
		return list;
	}

	@Override
	public List<ElecDictionaryForm> findDDlNameByKeyword(String keyword) {
		List<ElecDictionary> objectList = this.findDDlName(keyword);
		List<ElecDictionaryForm> formList = this
				.convertddlNameObjectToVO(objectList);
		return formList;
	}

	// 将从数据库中得到的PO对象转成VO对象
	private List<ElecDictionaryForm> convertddlNameObjectToVO(
			List<ElecDictionary> objectList) {
		List<ElecDictionaryForm> formList = new ArrayList<ElecDictionaryForm>();
		ElecDictionaryForm dictionaryForm = null;
		for (ElecDictionary elecDictionary : objectList) {
			dictionaryForm = new ElecDictionaryForm();
			dictionaryForm.setDdlCode(String.valueOf(elecDictionary
					.getDdlCode()));
			dictionaryForm.setDdlName(elecDictionary.getDdlName());
			dictionaryForm.setKeyword(elecDictionary.getKeyword());
			formList.add(dictionaryForm);
		}
		return formList;
	}

	// 组织sql语句找到DDLName
	// SELECT * FROM elec_dictionary o
	// WHERE o.Keyword = '性别'
	private List<ElecDictionary> findDDlName(String keyword) {
		String hqlWhere = " and o.keyword=? ";
		Object[] params = { keyword };
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.ddlCode ", "asc");
		List<ElecDictionary> list = elecDictionaryDao
				.findCollectionByConditionNoPage(hqlWhere, params, orderBy);
		return list;
	}

	@Override
	public void saveDictionary(ElecDictionaryForm elecDictionaryForm) {
		String keywordName = elecDictionaryForm.getKeywordname();
		String typeFlag = elecDictionaryForm.getTypeflag();
		String[] itemNames = elecDictionaryForm.getItemname();
		if ("new".equals(typeFlag)) {
			this.saveElecDictionarysByKeyword(keywordName, itemNames);
		} else {
			List<ElecDictionary> list = findDDlName(keywordName);
			elecDictionaryDao.deleteObjectByCollection(list);
			this.saveElecDictionarysByKeyword(keywordName, itemNames);
		}
	}

	// 通过keywordName存储itemNames
	private void saveElecDictionarysByKeyword(String keywordName, String[] itemNames) {
		ElecDictionary elecDictionary = null;
		List<ElecDictionary> listDic = new ArrayList<ElecDictionary>();
		int i = 1;
		for (String itemName : itemNames) {
			elecDictionary = new ElecDictionary();
			elecDictionary.setDdlCode(i);
			elecDictionary.setKeyword(keywordName);
			elecDictionary.setDdlName(itemName);
			listDic.add(elecDictionary);
			i++;
		}
		elecDictionaryDao.saveObjectsByCollection(listDic);
	}

}
