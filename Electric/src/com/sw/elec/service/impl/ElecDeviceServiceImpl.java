package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecDeviceDao;
import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.domain.ElecDevice;
import com.sw.elec.domain.ElecUser;
import com.sw.elec.service.IElecDeviceService;
import com.sw.elec.util.PageInfo;
import com.sw.elec.util.StringHelper;
import com.sw.elec.web.form.ElecDeviceForm;

@Transactional
@Service(IElecDeviceService.SERVICE_NAME)
public class ElecDeviceServiceImpl implements IElecDeviceService {

	@Resource(name = IElecDeviceDao.SERVICE_NAME)
	private IElecDeviceDao elecDeviceDao;

	@Resource(name = IElecDictionaryDao.SERVICE_NAME)
	private IElecDictionaryDao elecDictionaryDao;

	@Override
	public List<ElecDeviceForm> findDevicesWithPage(
			ElecDeviceForm elecDeviceForm, HttpServletRequest request) {
		PageInfo pageInfo = new PageInfo(request);
		List<ElecDeviceForm> listDeviceForm = new ArrayList<ElecDeviceForm>();
		String hqlWhere = "";
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.createDate", "desc");
		List<ElecDevice> listDevice = null;
		List<String> paramsList = new ArrayList<String>();
		// 拼凑查询语句
		StringBuffer stringBuffer = new StringBuffer();
		if (elecDeviceForm != null) {
			if (elecDeviceForm.getJctID() != null
					&& !"".equals(elecDeviceForm.getJctID())) {
				stringBuffer.append(" and o.jctID = ? ");
				paramsList.add(elecDeviceForm.getJctID());
			}
			if (elecDeviceForm.getDevType() != null
					&& !"".equals(elecDeviceForm.getDevType())) {
				stringBuffer.append(" and o.devType = ? ");
				paramsList.add(elecDeviceForm.getDevType());
			}
			if (elecDeviceForm.getDevState() != null
					&& !"".equals(elecDeviceForm.getDevState())) {
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
			elecDeviceForm = convertPoToVo(elecDevice);
			listDeviceForm.add(elecDeviceForm);
		}
		return listDeviceForm;
	}

	// PO对象转成VO对象
	private ElecDeviceForm convertPoToVo(ElecDevice elecDevice) {
		ElecDeviceForm elecDeviceForm = new ElecDeviceForm();
		elecDeviceForm.setDevID(elecDevice.getDevID());
		elecDeviceForm.setDevPlanID(elecDevice.getDevPlanID());
		// 需要从数据字典中查找
		elecDeviceForm
				.setJctID(elecDevice.getJctID() != null ? elecDictionaryDao
						.findDictionaryName("所属单位", elecDevice.getJctID())
						.get(0).toString() : "");
		elecDeviceForm.setDevName(elecDevice.getDevName());
		elecDeviceForm.setDevType(elecDevice.getDevType());
		elecDeviceForm.setTrademark(elecDevice.getTrademark());
		elecDeviceForm.setSpecType(elecDevice.getSpecType());
		elecDeviceForm.setProduceHome(elecDevice.getProduceHome());
		elecDeviceForm.setProduceArea(elecDevice.getProduceArea());
		elecDeviceForm.setUseness(elecDevice.getUseness());
		elecDeviceForm.setQuality(elecDevice.getQuality());
		elecDeviceForm.setUseUnit(elecDevice.getUseUnit());
		elecDeviceForm.setDevExpense(elecDevice.getDevExpense() == null ? ""
				: elecDevice.getDevExpense().toString());
		elecDeviceForm.setAdjustPeriod(elecDevice.getAdjustPeriod());
		elecDeviceForm.setOverhaulPeriod(elecDevice.getOverhaulPeriod());
		elecDeviceForm.setConfigure(elecDevice.getConfigure());
		// 需要从数据字典中查找
		elecDeviceForm
				.setDevState(elecDevice.getDevState() != null ? elecDictionaryDao
						.findDictionaryName("设备状态", elecDevice.getDevState())
						.get(0).toString()
						: "");
		elecDeviceForm.setRunDescribe(elecDevice.getRunDescribe());
		elecDeviceForm.setComment(elecDevice.getComment());
		elecDeviceForm
				.setUseDate(String.valueOf(elecDevice.getUseDate() == null ? ""
						: elecDevice.getUseDate()));
		elecDeviceForm.setIsDelete(elecDevice.getIsDelete());
		elecDeviceForm.setCreateEmpID(elecDevice.getCreateEmpID());
		elecDeviceForm
				.setCreateDate(String.valueOf(elecDevice.getCreateDate()));
		elecDeviceForm.setLastEmpID(elecDevice.getLastEmpID());
		elecDeviceForm.setLastDate(String.valueOf(elecDevice.getLastDate()));
		elecDeviceForm.setQunit(elecDevice.getQunit());
		elecDeviceForm.setApUnit(elecDevice.getApUnit());
		elecDeviceForm.setOpUnit(elecDevice.getOpUnit());
		elecDeviceForm.setApState(elecDevice.getApState());
		elecDeviceForm.setOpState(elecDevice.getOpState());
		return elecDeviceForm;
	}

	@Override
	public void saveDevice(ElecDeviceForm elecDeviceForm,
			HttpServletRequest request) {
		String deviceID = elecDeviceForm.getDevID();
		ElecUser elecUser = (ElecUser) request.getSession().getAttribute(
				"globle_user");
		ElecDevice elecDevice = null;
		// 需要进行更新操作
		if (elecDeviceForm != null && deviceID != null && !"".equals(deviceID)) {
			// 先删除
			elecDeviceDao.deleteObjectByIDs(deviceID);
			// 在保存
			elecDevice = this.convertVoToPo(elecDeviceForm);
			elecDevice.setDevID(elecDeviceForm.getDevID());
			// 需要进行sava操作
		} else {
			elecDevice = this.convertVoToPo(elecDeviceForm);
			elecDevice.setCreateEmpID(elecUser.getUserID());
			elecDevice.setCreateDate(new Date());
			elecDevice.setApState("0");
			elecDevice.setOpState("0");
		}

		// 非表中的属性
		elecDevice.setIsDelete("0");
		elecDevice.setLastEmpID(elecUser.getUserID());
		elecDevice.setLastDate(new Date());
		elecDeviceDao.save(elecDevice);

	}

	// VO对象转PO对象
	private ElecDevice convertVoToPo(ElecDeviceForm elecDeviceForm) {
		ElecDevice elecDevice = new ElecDevice();
		// 表单中的属性
		elecDevice.setDevName(elecDeviceForm.getDevName());
		elecDevice.setJctID(elecDeviceForm.getJctID());
		elecDevice.setDevType(elecDeviceForm.getDevType());
		elecDevice.setQuality(elecDeviceForm.getQuality());
		elecDevice.setQunit(elecDeviceForm.getQunit());
		if (elecDeviceForm != null && elecDeviceForm.getDevExpense() != null
				&& !"".equals(elecDeviceForm.getDevExpense())) {
			elecDevice.setDevExpense(Double.valueOf(elecDeviceForm
					.getDevExpense()));
		}
		elecDevice.setConfigure(elecDeviceForm.getConfigure());
		elecDevice.setSpecType(elecDeviceForm.getSpecType());
		elecDevice.setTrademark(elecDeviceForm.getTrademark());
		elecDevice.setDevState(elecDeviceForm.getDevState());
		elecDevice.setProduceHome(elecDeviceForm.getProduceHome());
		elecDevice.setProduceArea(elecDeviceForm.getProduceArea());
		elecDevice.setUseness(elecDeviceForm.getUseness());
		elecDevice.setUseUnit(elecDeviceForm.getUseUnit());
		if (elecDeviceForm != null
				&& elecDeviceForm.getOverhaulPeriod() != null
				&& elecDeviceForm.getOpUnit() != null
				&& !"".equals(elecDeviceForm.getOverhaulPeriod())
				&& !"".equals(elecDeviceForm.getOpUnit())) {
			elecDevice.setOverhaulPeriod(elecDeviceForm.getOverhaulPeriod());
			elecDevice.setOpUnit(elecDeviceForm.getOpUnit());
		}
		if (elecDeviceForm != null && elecDeviceForm.getUseDate() != null
				&& !"".equals(elecDeviceForm.getUseDate())) {
			elecDevice.setUseDate(StringHelper.stringConvertDate(elecDeviceForm
					.getUseDate()));
		}
		if (elecDeviceForm != null && elecDeviceForm.getAdjustPeriod() != null
				& elecDeviceForm.getApUnit() != null
				&& !"".equals(elecDeviceForm.getAdjustPeriod())
				&& !"".equals(elecDeviceForm.getApUnit())) {
			elecDevice.setAdjustPeriod(elecDeviceForm.getAdjustPeriod());
			elecDevice.setApUnit(elecDeviceForm.getApUnit());
		}
		elecDevice.setRunDescribe(elecDeviceForm.getRunDescribe());
		elecDevice.setComment(elecDeviceForm.getComment());
		return elecDevice;
	}

	// 通过ID找到ElecDeviceForm
	@Override
	public ElecDeviceForm findDevice(String devID) {
		ElecDevice elecDevice = elecDeviceDao.findObjectByID(devID);
		ElecDeviceForm deviceForm = this.convertPoToVo(elecDevice);
		return deviceForm;
	}
}
