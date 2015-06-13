package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecTextDao;
import com.sw.elec.domain.ElecText;
import com.sw.elec.service.IElecTextService;
import com.sw.elec.web.form.ElecTextForm;

@Transactional
@Service(IElecTextService.SERVICE_NAME)
public class ElecTextServiceImpl implements IElecTextService {

	@Resource(name = IElecTextDao.SERVICE_NAME)
	private IElecTextDao elecTextDao;

	@Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void saveText(ElecText elecText) {
		elecTextDao.save(elecText);
	}

	@Override
	public List<ElecText> findCollectionByConditionNoPage(
			ElecTextForm elecTextForm) {
		String hqlWhere = "";
		List<String> paramsList = new ArrayList<String>();
		if (elecTextForm != null
				&& StringUtils.isNoneBlank(elecTextForm.getTextName())) {
			hqlWhere += " and o.textName like ?";
			paramsList.add("%" + elecTextForm.getTextName() + "%");
		}
		if (elecTextForm != null
				&& StringUtils.isNoneBlank(elecTextForm.getTextRemark())) {
			hqlWhere += " and o.textRemark like ?";
			paramsList.add("%" + elecTextForm.getTextRemark() + "%");
		}
		Object[] params = paramsList.toArray();
		/**
		 * 组织排序
		 */
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put("o.textDate", "desc");
		orderBy.put("o.textName", "asc");
		List<ElecText> list = elecTextDao.findCollectionByConditionNoPage(hqlWhere,params,orderBy);
		return list;
	}

}
