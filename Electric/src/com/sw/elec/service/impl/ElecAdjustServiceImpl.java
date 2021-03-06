package com.sw.elec.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecAdjustDao;
import com.sw.elec.dao.IElecDeviceDao;
import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.domain.ElecAdjust;
import com.sw.elec.domain.ElecDevice;
import com.sw.elec.domain.ElecUser;
import com.sw.elec.service.IElecAdjustService;
import com.sw.elec.util.PageInfo;
import com.sw.elec.util.StringHelper;
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
		List<ElecAdjustForm> adjustFormList = this
				.convertdeviceLIstToadjustList(deviceList, pageInfo);
		request.setAttribute("page", pageInfo.getPageBean());
		return adjustFormList;
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
		adjustForm.setDevID(elecDevice.getDevID());
		adjustForm.setDevName(elecDevice.getDevName() != null ? elecDevice
				.getDevName() : "");
		adjustForm.setAdjustPeriod(elecDevice.getAdjustPeriod() != null
				&& elecDevice.getApUnit() != null ? elecDevice
				.getAdjustPeriod()
				+ elecDictionaryDao
						.findDictionaryName("校准周期单位", elecDevice.getApUnit())
						.get(0).toString() : "");
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
		// 设置adjustForm的设备类型属性，在修改页面需要
		adjustForm.setDevType(elecDevice.getDevType() != null
				&& !"".equals(elecDevice.getDevType()) ? elecDictionaryDao
				.findDictionaryName("设备类型", elecDevice.getDevType()).get(0)
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
				paramList.add("%" + elecAdjustForm.getDevName() + "%");
			}
			if (elecAdjustForm.getIsAdjust() != null
					&& !"".equals(elecAdjustForm.getIsAdjust())) {
				stringBuffer.append(" and o.isAdjust = ? ");
				paramList.add(elecAdjustForm.getIsAdjust());
				// 校准时间段

				/*if (elecAdjustForm.getStartDatef() != null
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

	// 通过devID找到Dev返回需要的信息
	@Override
	public ElecAdjustForm findAdjustFormByDevID(ElecAdjustForm elecAdjustForm) {
		String devID = elecAdjustForm.getDevID();
		List<Object[]> adjustList = elecAdjustDao
				.findAdjustsByDevIDOrderByAdjustDate(devID);
		ElecDevice elecDevice = elecDeviceDao.findObjectByID(devID);
		ElecAdjustForm adjustForm = convertDeviceToAdjustForm(elecDevice);
		// 在接着设置adjustForm的其他属性
		if (adjustList != null && adjustList.size() != 0) {
			adjustForm = this.setOtherFieldsWithAdjust(adjustForm, adjustList);
		}
		return adjustForm;
	}

	// 通过得到的设备的adjustList设置域
	private ElecAdjustForm setOtherFieldsWithAdjust(ElecAdjustForm adjustForm,
			List<Object[]> adjustList) {
		Object[] adjust = adjustList.get(0);
		adjustForm.setSeqID(adjust[0].toString());
		adjustForm.setDevID(adjust[1].toString());
		adjustForm.setIsAdjust(adjust[2].toString());
		adjustForm.setAdjustDate(adjust[3].toString());
		adjustForm.setIsHaveRecord("2");
		adjustForm.setRecord(adjust[6].toString());
		adjustForm.setComment(adjust[7].toString());
		return adjustForm;
	}

	// 保存校准记录
	@Override
	public void save(ElecAdjustForm elecAdjustForm, HttpServletRequest request) {
		if (elecAdjustForm != null) {
			// 从session中得到当前的用户
			ElecUser elecUser = (ElecUser) request.getSession().getAttribute(
					"globle_user");
			String devIDs = elecAdjustForm.getDevID().trim();
			String[] ids = devIDs.split(",");
			ElecAdjust adjust = null;
			List<ElecAdjust> adjustList = new ArrayList<ElecAdjust>();
			// 如果seqID不为空，表示是更新，不是插入
			if (elecAdjustForm.getSeqID() != null
					&& !"".equals(elecAdjustForm.getSeqID())) {
				// 如果更新,取出数据，更新数据，在更新实体
				adjust = elecAdjustDao
						.findObjectByID(elecAdjustForm.getSeqID());
				adjust = this.updateFields(elecAdjustForm, elecUser, adjust);
				elecAdjustDao.update(adjust);
				return;
			}
			for (String string : ids) {
				adjust = convertAdjustFromToAdjust(elecAdjustForm, elecUser);
				adjust.setDevID(string);
				adjustList.add(adjust);
			}
			elecAdjustDao.saveObjectsByCollection(adjustList);
		}
	}

	private ElecAdjust updateFields(ElecAdjustForm elecAdjustForm,
			ElecUser elecUser, ElecAdjust adjust) {
		adjust.setComment(elecAdjustForm.getComment());
		adjust.setRecord(elecAdjustForm.getRecord());
		adjust.setLastDate(new Date());
		adjust.setLastEmpID(elecUser.getUserID());
		return adjust;
	}

	private ElecAdjust convertAdjustFromToAdjust(ElecAdjustForm elecAdjustForm,
			ElecUser elecUser) {
		ElecAdjust adjust = new ElecAdjust();
		adjust.setDevID(elecAdjustForm.getDevID());
		adjust.setIsAdjust("1");
		adjust.setAdjustDate(new Date());
		adjust.setRecord(elecAdjustForm.getRecord());
		adjust.setComment(elecAdjustForm.getComment());
		adjust.setIsDelete("0");
		adjust.setCreateEmpID(elecUser.getUserID());
		adjust.setCreateDate(new Date());
		adjust.setLastEmpID(elecUser.getUserID());
		if (elecAdjustForm.getLastDate() != null
				&& !"".equals(elecAdjustForm.getLastDate())) {
			adjust.setLastDate(StringHelper.stringConvertDate(elecAdjustForm
					.getLastDate()));
		}
		return adjust;
	}

	// 通过devID找到所有的校准记录
	@Override
	public List<ElecAdjustForm> findAllDeviceAdjustWithdevID(
			ElecAdjustForm elecAdjustForm) {
		String devID = elecAdjustForm.getDevID();
		List<Object[]> objectList = elecAdjustDao
				.findAdjustsByDevIDOrderByAdjustDate(devID);
		ElecDevice device = elecDeviceDao.findObjectByID(devID);
		List<ElecAdjustForm> adjustFormList = this
				.convertObjectListToAdjustFormListWithDevice(objectList, device);
		return adjustFormList;
	}

	// 将从数据库根据devID查到的Object数组转成AdjustForm
	private List<ElecAdjustForm> convertObjectListToAdjustFormListWithDevice(
			List<Object[]> objectList, ElecDevice device) {
		List<ElecAdjustForm> adjustFormList = new ArrayList<ElecAdjustForm>();
		ElecAdjustForm adjustForm = null;
		String jctID = device.getJctID() != null ? elecDictionaryDao
				.findDictionaryName("所属单位", device.getJctID()).get(0)
				.toString() : "";
		for (Object[] objects : objectList) {
			adjustForm = new ElecAdjustForm();
			adjustForm.setDevID(device.getDevID());
			adjustForm.setSeqID(objects[0].toString());
			adjustForm.setDevName(device.getDevName());
			adjustForm.setJctID(jctID);
			adjustForm.setAdjustDate(objects[3].toString());
			adjustFormList.add(adjustForm);
		}
		return adjustFormList;
	}

	// 找到所有需要导出的字段
	@Override
	public Map<String, String> getAllFieldNameWhenExportExcel(
			ElecAdjustForm elecAdjustForm) {
		Map<String, String> fields = new HashMap<String, String>();
		fields.put("record", "校准记录");
		fields.put("devName", "设备名称");
		fields.put("devType", "设备类型");
		fields.put("adjustPeriod", "校准周期");
		fields.put("useDate", "使用日期");
		fields.put("jctID", "所属单位");
		fields.put("adjustDate", "校准日期");
		fields.put("comment", "备注");
		return fields;
	}

	@Override
	public ArrayList<ArrayList<String>> getFiledDataWhenExportExcel(
			ElecAdjustForm elecAdjustForm, ArrayList<String> fields) {
		List<Object[]> list = this.findAllAdjustWithDevice();
		// 将得到的数组对象转成adjustFrom对象列表
		ArrayList<String> fieldList = null;
		ArrayList<ArrayList<String>> fieldLists = new ArrayList<ArrayList<String>>();
		List<ElecAdjustForm> adjustFormList = this
				.convertObjectListToAllAdjustFormList(list);

		Class clazz = elecAdjustForm.getClass();
		Method getMethod = null;
		ArrayList<String> methodList = new ArrayList<String>();
		// 拼方法
		for (String string : fields) {
			String getMethodStr = "";
			getMethodStr = "get" + string.trim().substring(0, 1).toUpperCase()
					+ string.trim().substring(1);
			methodList.add(getMethodStr);
		}
		for (ElecAdjustForm adjustForm : adjustFormList) {
			fieldList = new ArrayList<String>();
			for (String string : methodList) {
				try {
					getMethod = clazz.getMethod(string, null);
					try {
						fieldList.add((String) getMethod.invoke(adjustForm,
								null));
					} catch (IllegalAccessException | IllegalArgumentException
							| InvocationTargetException e) {
						e.printStackTrace();
					}
				} catch (NoSuchMethodException | SecurityException e) {
					e.printStackTrace();
				}
			}
			fieldLists.add(fieldList);
		}
		return fieldLists;
	}

	private List<ElecAdjustForm> convertObjectListToAllAdjustFormList(
			List<Object[]> list) {
		List<ElecAdjustForm> formList = new ArrayList<ElecAdjustForm>();
		ElecAdjustForm adjustForm = null;
		for (Object[] objects : list) {
			adjustForm = new ElecAdjustForm();
			adjustForm.setRecord(objects[0] != null ? objects[0].toString()
					: "");
			adjustForm.setDevName(objects[1] != null ? objects[1].toString()
					: "");
			adjustForm.setDevType(objects[2].toString() != null
					&& !"".equals(objects[2].toString()) ? elecDictionaryDao
					.findDictionaryName("设备类型", objects[2].toString()).get(0)
					.toString() : "");
			adjustForm.setAdjustPeriod(objects[3] != null ? objects[3]
					.toString() : "" + objects[3] != null ? objects[3]
					.toString() : "");
			adjustForm.setUseDate(objects[4] != null ? objects[4].toString()
					: "");
			adjustForm.setJctID(objects[5].toString() != null
					&& !"".equals(objects[5].toString()) ? elecDictionaryDao
					.findDictionaryName("所属单位", objects[5].toString()).get(0)
					.toString() : "");
			adjustForm.setAdjustDate(objects[6] != null ? objects[6].toString()
					: "");
			adjustForm.setComment(objects[7] != null ? objects[7].toString()
					: "");
			formList.add(adjustForm);
		}
		return formList;
	}

	// 找到所有关联的adjust
	private List<Object[]> findAllAdjustWithDevice() {
		List<Object[]> list = elecAdjustDao.findAllAdjustWithDevice();
		return list;
	}

}
