package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecCommonMsgDao;
import com.sw.elec.domain.ElecCommonMsg;
import com.sw.elec.service.IElecCommonMsgService;
import com.sw.elec.web.form.ElecCommonMsgForm;

@Transactional
@Service(IElecCommonMsgService.SERVICE_NAME)
public class ElecCommonMsgServiceImpl implements IElecCommonMsgService {

	@Resource(name = IElecCommonMsgDao.SERVICE_NAME)
	private IElecCommonMsgDao elecCommonMsgDao;

	@Override
	public List<ElecCommonMsgForm> findElecCommonMsgList() {
		String hqlWhere = "";
		Object[] params = null;
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.createDate", "desc");
		List<ElecCommonMsg> list = elecCommonMsgDao
				.findCollectionByConditionNoPage(hqlWhere, params, orderBy);
		List<ElecCommonMsgForm> formList = this.convertPoListToVoList(list);
		return formList;
	}

	@Override
	public void saveElecCommonMsg(ElecCommonMsgForm elecCommonMsgForm) {
		ElecCommonMsg commonMsg = convertVoToPo(elecCommonMsgForm);
		elecCommonMsgDao.save(commonMsg);
	}

	private ElecCommonMsg convertVoToPo(ElecCommonMsgForm elecCommonMsgForm) {
		ElecCommonMsg commonMsg = new ElecCommonMsg();
		commonMsg.setStationRun(elecCommonMsgForm.getStationRun());
		commonMsg.setDevRun(elecCommonMsgForm.getDevRun());
		commonMsg.setCreateDate(new Date());
		return commonMsg;
	}

	// 将PO对象转换成VO对象
	private List<ElecCommonMsgForm> convertPoListToVoList(
			List<ElecCommonMsg> list) {
		List<ElecCommonMsgForm> formList = new ArrayList<ElecCommonMsgForm>();
		ElecCommonMsgForm elecCommonMsgForm = null;
		ElecCommonMsg elecCommonMsg = null;
		for (int i = 0; i < list.size(); i++) {
			elecCommonMsgForm = new ElecCommonMsgForm();
			elecCommonMsg = list.get(i);
			elecCommonMsgForm.setDevRun(elecCommonMsg.getDevRun());
			elecCommonMsgForm.setStationRun(elecCommonMsg.getStationRun());
			elecCommonMsgForm
					.setCreateDate(elecCommonMsg.getCreateDate() != null ? String
							.valueOf(elecCommonMsg.getCreateDate()) : "");
			formList.add(elecCommonMsgForm);
		}
		return formList;
	}

	// 找到当前时间的commonMsg
	@Override
	public List<ElecCommonMsgForm> findElecCommonMsgCurrentDate() {
		List<Object[]> commlist = elecCommonMsgDao
				.findElecCommonMsgCurrentDate();
		List<ElecCommonMsgForm> list = this.convertPoObjectToList(commlist);
		return list;
	}

	private List<ElecCommonMsgForm> convertPoObjectToList(
			List<Object[]> commlist) {
		List<ElecCommonMsgForm> list = new ArrayList<ElecCommonMsgForm>();
		ElecCommonMsgForm elecCommonMsgForm = null;
		for (Object[] objects : commlist) {
			elecCommonMsgForm = new ElecCommonMsgForm();
			elecCommonMsgForm.setStationRun(objects[0].toString());
			elecCommonMsgForm.setDevRun(objects[1].toString());
			list.add(elecCommonMsgForm);
		}
		return list;
	}

}
