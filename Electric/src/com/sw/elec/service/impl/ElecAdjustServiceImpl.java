package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecAdjustDao;
import com.sw.elec.dao.IElecDeviceDao;
import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.domain.ElecDevice;
import com.sw.elec.service.IElecAdjustService;
import com.sw.elec.util.PageInfo;
import com.sw.elec.web.form.ElecAdjustForm;

@Transactional
@Service(IElecAdjustService.SERVICE_NAME)
public class ElecAdjustServiceImpl implements IElecAdjustService {

	@Resource(name = IElecAdjustDao.SERVICE_NAME)
	private IElecAdjustDao elecAdjustDao;

	@Resource(name = IElecDeviceDao.SERVICE_NAME)
	private IElecDeviceDao elecDeviceDao;

	@Resource(name = IElecDictionaryDao.SERVICE_NAME)
	private IElecDictionaryDao elecDictionaryDao;

	// 需要找到所有的或者有要求的deviceAdjust
	@Override
	public List<ElecAdjustForm> findAllDeviceAdjustWithPage(
			ElecAdjustForm elecAdjustForm, HttpServletRequest request) {
		PageInfo pageInfo = new PageInfo(request);
		List<ElecDevice> deviceList = null;
		ArrayList<Object> hqlWhereAndParams = this
				.gethqlWhereAndParams(elecAdjustForm);
		String hqlWhere = (String) hqlWhereAndParams.get(0);
		Object[] params = (Object[]) hqlWhereAndParams.get(1);
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.createDate", "desc");
		if (hqlWhere != null && !"".equals(hqlWhere) && params != null) {
			hqlWhere += " and o.isDelete = '0' ";
			deviceList = elecDeviceDao.findCollectionByConditionWithPage(
					hqlWhere, params, orderBy, pageInfo);
		} else {
			hqlWhere += " and o.isDelete = '0' ";
			deviceList = elecDeviceDao.findCollectionByConditionWithPage(
					hqlWhere, null, orderBy, pageInfo);
		}
		List<ElecAdjustForm> adjustList = this.convertdeviceLIstToadjustList(
				deviceList, pageInfo);
		request.setAttribute("page", pageInfo.getPageBean());
		return adjustList;
	}

	// 将deviceList取得其他的device，然后将其他需要的值放入adjustFrom中，再组成链表
	private List<ElecAdjustForm> convertdeviceLIstToadjustList(
			List<ElecDevice> deviceList, PageInfo pageInfo) {
		List<ElecAdjustForm> adjustFromList = new ArrayList<ElecAdjustForm>();
		ElecAdjustForm adjustForm = null;
		int currentFirst = 0;
		if (pageInfo != null) {
			if (pageInfo.getPageSize() < 10) {
				currentFirst = pageInfo.getTotalResult()
						- pageInfo.getPageSize() + 1;
			} else {
				currentFirst = pageInfo.getBeginResult() + 1;
			}
		}
		for (ElecDevice elecDevice : deviceList) {
			adjustForm = new ElecAdjustForm();
			adjustForm = this.convertDeviceToAdjustForm(elecDevice);
			adjustForm.setNum(String.valueOf(currentFirst++));
			adjustFromList.add(adjustForm);
		}
		return adjustFromList;
	}

	// 在elecDevice中找到adjustFrom需要的属性，再进行设置
	private ElecAdjustForm convertDeviceToAdjustForm(ElecDevice elecDevice) {
		ElecAdjustForm adjustForm = new ElecAdjustForm();
		Object[] lastAdjust = null;
		// 通过设备的ID从adjust表中取得所有外键为devID的数据,并且按照校准时间的降序排列
		String devID = elecDevice.getDevID();
		List<Object[]> adjustList = elecAdjustDao
				.findAdjustsByDevIDOrderByAdjustDate(devID);
		if (adjustList != null && adjustList.size() > 0) {
			lastAdjust = adjustList.get(0);// 按照校准时间取得最迟的数据
		}
		adjustForm.setDevName(elecDevice.getDevName() != null ? elecDevice
				.getDevName() : "");
		adjustForm
				.setAdjustPeriod(elecDevice.getAdjustPeriod() != null ? elecDevice
						.getAdjustPeriod() : "");
		adjustForm
				.setUseDate(String.valueOf(elecDevice.getUseDate() != null ? elecDevice
						.getUseDate() : ""));
		adjustForm
				.setIsAdjust(lastAdjust != null && lastAdjust.length != 0 ? elecDictionaryDao
						.findDictionaryName("校准状态", lastAdjust[2].toString())
						.get(0).toString()
						: "");
		adjustForm.setAdjustDate(String
				.valueOf(lastAdjust != null ? lastAdjust[3].toString() : ""));
		adjustForm.setJctID(elecDevice.getJctID() != null
				&& !"".equals(elecDevice.getJctID()) ? elecDictionaryDao
				.findDictionaryName("所属单位", elecDevice.getJctID()).get(0)
				.toString() : "");
		return adjustForm;
	}

	// 组织得到查询条件和参数Object数组
	private ArrayList<Object> gethqlWhereAndParams(ElecAdjustForm elecAdjustForm) {
		List<Object> paramList = new ArrayList<Object>();
		StringBuffer stringBuffer = new StringBuffer();
		if (elecAdjustForm != null) {
			if (elecAdjustForm.getJctID() != null
					&& !"".equals(elecAdjustForm.getJctID())) {
				stringBuffer.append(" and o.jctID = ? ");
				paramList.add(elecAdjustForm.getJctID());
			}
			if (elecAdjustForm.getDevName() != null
					&& !"".equals(elecAdjustForm.getDevName())) {
				stringBuffer.append(" and o.devName like ?");
				paramList.add("%"+elecAdjustForm.getDevName()+"%");
			}
			if (elecAdjustForm.getIsAdjust() != null
					&& !"".equals(elecAdjustForm.getIsAdjust())) {
				stringBuffer.append(" and o.isAdjust = ? ");
				paramList.add(elecAdjustForm.getIsAdjust());
				//校准时间段
/*				if (elecAdjustForm.getStartDatef() != null
						&& !"".equals(elecAdjustForm.getStartDatef())) {
					stringBuffer.append(" and o. > ?");
					paramList.add(elecAdjustForm.getStartDatef());
				}
				if (elecAdjustForm.getStartDatet() != null
						&& !"".equals(elecAdjustForm.getStartDatet())) {
					stringBuffer.append(" and o. < ?");
					paramList.add(elecAdjustForm.getStartDatet());
				}*/
			}
			if (elecAdjustForm.getDevType() != null
					&& !"".equals(elecAdjustForm.getDevType())) {
				stringBuffer.append(" and o.devType = ? ");
				paramList.add(elecAdjustForm.getDevType());
			}
		}
		String hqlWhere = stringBuffer.toString();
		Object[] params = null;
		if (paramList.size() != 0) {
			params = new Object[paramList.size()];
			for (int i = 0; i < paramList.size(); i++) {
				params[i] = paramList.get(i);
			}
		}
		ArrayList<Object> hqlWhereAndParams = new ArrayList<Object>();
		hqlWhereAndParams.add(hqlWhere);
		hqlWhereAndParams.add(params);
		return hqlWhereAndParams;
	}
}
