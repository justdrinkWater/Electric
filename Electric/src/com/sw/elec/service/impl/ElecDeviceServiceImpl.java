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
		List<ElecDevice> listDevice = null;
		// 拼凑查询语句
		if (elecDeviceForm != null) {
			listDevice = getDevices(elecDeviceForm, pageInfo);
		}
		listDeviceForm = this.convertPoToVoList(listDevice, pageInfo);
		request.setAttribute("page", pageInfo.getPageBean());
		return listDeviceForm;
	}

	// 拼凑hql语句
	private List<ElecDevice> getDevices(ElecDeviceForm elecDeviceForm,
			PageInfo pageInfo) {
		List<ElecDevice> listDevice;
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.createDate", "desc");
		List<Object> paramsList = new ArrayList<Object>();
		StringBuffer stringBuffer = new StringBuffer();
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
			stringBuffer.append(" and o.devState = ? ");
			paramsList.add(elecDeviceForm.getDevState());
		}
		if (elecDeviceForm.getDevName() != null
				&& !"".equals(elecDeviceForm.getDevName())) {
			stringBuffer.append(" and o.devName like ?");
			paramsList.add("%" + elecDeviceForm.getDevName() + "%");
		}
		// o.`UseDate` > '2015-06-09' 
		// o.`UseDate` < '2015-06-11'
		// 需要拼凑时间段的条件,已经通过js使得两端都有时间的值
		if (elecDeviceForm.getUseDatef() != null
				&& !"".equals(elecDeviceForm.getUseDatef())
				|| elecDeviceForm.getUseDatet() != null
				&& !"".equals(elecDeviceForm.getUseDatet())) {
			stringBuffer.append(" and o.useDate > ? ");
			stringBuffer.append(" and o.useDate < ? ");
			paramsList.add(StringHelper.stringConvertDate(elecDeviceForm.getUseDatef()));
			paramsList.add(StringHelper.stringConvertDate(elecDeviceForm.getUseDatet()));
		}
		listDevice = getDeviceList(pageInfo, orderBy, paramsList, stringBuffer);
		return listDevice;
	}

	// 从数据库中查找得到elecDeviceList
	private List<ElecDevice> getDeviceList(PageInfo pageInfo,
			LinkedHashMap<String, String> orderBy, List<Object> paramsList,
			StringBuffer stringBuffer) {
		List<ElecDevice> listDevice;
		String hqlWhere = stringBuffer.toString();
		Object[] params = null;
		if (paramsList.size() != 0) {
			params = new Object[paramsList.size()];
			for (int i = 0; i < paramsList.size(); i++) {
				params[i] = paramsList.get(i);
			}
		}
		if (hqlWhere != null && !"".equals(hqlWhere)) {
			hqlWhere += " and o.isDelete = '0' ";
			listDevice = elecDeviceDao.findCollectionByConditionWithPage(
					hqlWhere, params, orderBy, pageInfo);
		} else {
			hqlWhere += " and o.isDelete = '0' ";
			listDevice = elecDeviceDao.findCollectionByConditionWithPage(
					hqlWhere, null, orderBy, pageInfo);
		}
		return listDevice;
	}

	// 将PO对象序列转化为VO对象序列
	private List<ElecDeviceForm> convertPoToVoList(List<ElecDevice> listDevice,
			PageInfo pageInfo) {
		ElecDeviceForm elecDeviceForm = null;
		int currentFist = 0;
		if (pageInfo != null) {
			if (pageInfo.getPageSize() < 10) {
				currentFist = pageInfo.getTotalResult()
						- pageInfo.getPageSize() + 1;
			} else {
				currentFist = pageInfo.getBeginResult() + 1;
			}
		}
		List<ElecDeviceForm> listDeviceForm = new ArrayList<ElecDeviceForm>();
		for (ElecDevice elecDevice : listDevice) {
			elecDeviceForm = convertPoToVo(elecDevice);
			elecDeviceForm.setNum(String.valueOf(currentFist++));
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
			// elecDevice.setDevID(elecDeviceForm.getDevID());
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
		if (elecDeviceForm != null && elecDeviceForm.getDevID() != null
				&& !"".equals(elecDeviceForm.getDevID())) {
			elecDevice.setDevID(elecDeviceForm.getDevID());
		}
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

	// 添加所有可以导出的属性名
	@Override
	public Map<String, String> getAllFiledNamesWhenExportExcel(
			ElecDeviceForm elecDeviceForm) {
		Map<String, String> fields = new HashMap<String, String>();
		fields.put("createEmpID", "创建人");
		fields.put("createDate", "创建时间");
		fields.put("lastEmpID", "修改人");
		fields.put("lastDate", "修改时间");
		fields.put("apState", "是否校准");
		fields.put("opState", "是否检修");
		fields.put("devName", "设备名称");
		fields.put("jctID", "所属单位");
		fields.put("devType", "设备类型");
		fields.put("quality", "数量");
		fields.put("qunit", "数量单位");
		fields.put("devExpense", "金额");
		fields.put("configure", "配置");
		fields.put("specType", "规格型号");
		fields.put("trademark", "品牌");
		fields.put("devState", "状态");
		fields.put("produceHome", "厂家");
		fields.put("produceArea", "产地");
		fields.put("useness", "用途");
		fields.put("useUnit", "使用单位");
		fields.put("overhaulPeriod", "检修周期");
		fields.put("opUnit", "检修周期单位");
		fields.put("useDate", "使用日期");
		fields.put("adjustPeriod", "校准周期");
		fields.put("apUnit", "校准周期单位");
		fields.put("runDescribe", "运行情况描述");
		fields.put("comment", "备注");
		return fields;
	}

	@Override
	public ArrayList<ArrayList<String>> getFiledDateWhenExportExcel(
			ElecDeviceForm elecDeviceForm, ArrayList<String> fields) {
		// 从数据库中得到所有的device
		List<ElecDevice> list = this.findAllDevice();
		ArrayList<String> fieldList = null;
		ArrayList<ArrayList<String>> fieldLists = new ArrayList<ArrayList<String>>();
		// 将PO转成VO对象
		List<ElecDeviceForm> listForm = this.convertPoToVoList(list, null);

		Class clazz = elecDeviceForm.getClass();
		Method getMethod = null;
		ArrayList<String> methodList = new ArrayList<String>();
		// 需要拼出方法
		for (String string : fields) {
			String getMethodStr = "";
			getMethodStr = "get" + string.substring(0, 1).toUpperCase()
					+ string.substring(1);
			methodList.add(getMethodStr);
		}
		for (ElecDeviceForm elecDForm : listForm) {
			fieldList = new ArrayList<String>();
			for (String string : methodList) {
				try {
					getMethod = clazz.getMethod(string, null);
					try {
						fieldList.add((String) getMethod
								.invoke(elecDForm, null));
					} catch (IllegalAccessException | IllegalArgumentException
							| InvocationTargetException e) {
						e.printStackTrace();
					}
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
				} catch (SecurityException e) {
					e.printStackTrace();
				}
			}
			fieldLists.add(fieldList);

		}
		return fieldLists;
	}

	// 找出所有的device
	private List<ElecDevice> findAllDevice() {
		String hqlWhere = "";
		Object[] params = {};
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.createDate", " desc ");
		List<ElecDevice> list = elecDeviceDao.findCollectionByConditionNoPage(
				hqlWhere, params, orderBy);
		return list;
	}

	// “删除”指定ID的设备，这里并不是真正的删除，只是将指定ID的设备的isDelete字段，置为1
	@Override
	public void delete(ElecDeviceForm elecDeviceForm) {
		ElecDevice entity = this.convertVoToPo(elecDeviceForm);
		entity.setIsDelete("1");
		elecDeviceDao.update(entity);
	}
}
