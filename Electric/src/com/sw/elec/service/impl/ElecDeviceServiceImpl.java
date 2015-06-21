package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecDeviceDao;
import com.sw.elec.domain.ElecDevice;
import com.sw.elec.service.IElecDeviceService;
import com.sw.elec.util.PageInfo;
import com.sw.elec.web.form.ElecDeviceForm;

@Transactional
@Service(IElecDeviceService.SERVICE_NAME)
public class ElecDeviceServiceImpl implements IElecDeviceService {

	@Resource(name = IElecDeviceDao.SERVICE_NAME)
	private IElecDeviceDao elecDeviceDao;

	@Override
	public List<ElecDeviceForm> findDevicesWithPage(
			ElecDeviceForm elecDeviceForm, HttpServletRequest request) {
		PageInfo pageInfo = new PageInfo(request);
		List<ElecDeviceForm> listDeviceForm = new ArrayList<ElecDeviceForm>();
		String hqlWhere = "";
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.devID", "desc");
		List<ElecDevice> listDevice = null;
		List<String> paramsList = new ArrayList<String>();
		// 拼凑查询语句
		StringBuffer stringBuffer = new StringBuffer();
		if (elecDeviceForm != null) {
			if (elecDeviceForm.getJctID() != null && !"".equals(elecDeviceForm.getJctID())) {
				stringBuffer.append(" and o.jctID = ? ");
				paramsList.add(elecDeviceForm.getJctID());
			}
			if (elecDeviceForm.getDevType() != null && !"".equals(elecDeviceForm.getDevType())) {
				stringBuffer.append(" and o.devType = ? ");
				paramsList.add(elecDeviceForm.getDevType());
			}
			if (elecDeviceForm.getDevState() != null && !"".equals(elecDeviceForm.getDevState())) {
				stringBuffer.append("and o.devState = ? ");
				paramsList.add(elecDeviceForm.getDevState());
			}
			hqlWhere = stringBuffer.toString();
			Object[] params = null;
			if (paramsList.size() != 0) {
				params = new Object[paramsList.size()];
				for (int i = 0; i < paramsList.size(); i++) {
					params[i] = paramsList.get(i);
				}
			}
			if (hqlWhere != null) {
				listDevice = elecDeviceDao.findCollectionByConditionWithPage(
						hqlWhere, params, orderBy, pageInfo);
			} else {
				listDevice = elecDeviceDao.findCollectionByConditionWithPage(
						hqlWhere, null, orderBy, pageInfo);
			}
		}
		listDeviceForm = this.convertPoToVoList(listDevice);
		request.setAttribute("page", pageInfo.getPageBean());
		return listDeviceForm;
	}

	// 将PO对象序列转化为VO对象序列
	private List<ElecDeviceForm> convertPoToVoList(List<ElecDevice> listDevice) {
		ElecDeviceForm elecDeviceForm = null;
		List<ElecDeviceForm> listDeviceForm = new ArrayList<ElecDeviceForm>();
		for (ElecDevice elecDevice : listDevice) {
			elecDeviceForm = new ElecDeviceForm();
			elecDeviceForm.setDevID(elecDevice.getDevID());
			elecDeviceForm.setDevPlanID(elecDevice.getDevPlanID());
			elecDeviceForm.setJctID(elecDevice.getJctID());
			elecDeviceForm.setDevName(elecDevice.getDevName());
			elecDeviceForm.setDevType(elecDevice.getDevType());
			elecDeviceForm.setTrademark(elecDevice.getTrademark());
			elecDeviceForm.setSpecType(elecDevice.getSpecType());
			elecDeviceForm.setProduceHome(elecDevice.getProduceHome());
			elecDeviceForm.setProduceArea(elecDevice.getProduceArea());
			elecDeviceForm.setUseness(elecDevice.getUseness());
			elecDeviceForm.setQuality(elecDevice.getQuality());
			elecDeviceForm.setUseUnit(elecDevice.getUseUnit());
			elecDeviceForm.setDevExpense(elecDevice.getDevExpense()==null?"":elecDevice.getDevExpense().toString());
			elecDeviceForm.setAdjustPeriod(elecDevice.getAdjustPeriod());
			elecDeviceForm.setOverhaulPeriod(elecDevice.getOverhaulPeriod());
			elecDeviceForm.setConfigure(elecDevice.getConfigure());
			elecDeviceForm.setDevState(elecDevice.getDevState());
			elecDeviceForm.setRunDescribe(elecDevice.getRunDescribe());
			elecDeviceForm.setComment(elecDevice.getComment());
			elecDeviceForm.setUseDate(String.valueOf(elecDevice.getUseDate()==null?"":elecDevice.getUseDate()));
			elecDeviceForm.setIsDelete(elecDevice.getIsDelete());
			elecDeviceForm.setCreateEmpID(elecDevice.getCreateEmpID());
			elecDeviceForm.setCreateDate(String.valueOf(elecDevice
					.getCreateDate()));
			elecDeviceForm.setLastEmpID(elecDevice.getLastEmpID());
			elecDeviceForm
					.setLastDate(String.valueOf(elecDevice.getLastDate()));
			elecDeviceForm.setQunit(elecDevice.getQunit());
			elecDeviceForm.setApUnit(elecDevice.getApUnit());
			elecDeviceForm.setOpUnit(elecDevice.getOpUnit());
			elecDeviceForm.setApState(elecDevice.getApState());
			elecDeviceForm.setOpState(elecDevice.getOpState());
			listDeviceForm.add(elecDeviceForm);
		}
		return listDeviceForm;
	}

}
