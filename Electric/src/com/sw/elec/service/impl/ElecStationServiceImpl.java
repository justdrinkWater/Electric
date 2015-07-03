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

import org.hibernate.dialect.FirebirdDialect;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.dao.IElecStationDao;
import com.sw.elec.domain.ElecStation;
import com.sw.elec.domain.ElecUser;
import com.sw.elec.service.IElecStationService;
import com.sw.elec.util.PageInfo;
import com.sw.elec.util.StringHelper;
import com.sw.elec.web.form.ElecStationForm;

@Transactional
@Service(IElecStationService.SERVICE_NAME)
public class ElecStationServiceImpl implements IElecStationService {

	@Resource(name = IElecStationDao.SERVICE_NAME)
	private IElecStationDao elecStationDao;

	@Resource(name = IElecDictionaryDao.SERVICE_NAME)
	private IElecDictionaryDao elecDictionaryDao;

	@Override
	public List<ElecStationForm> findAllStationWithPage(
			ElecStationForm elecStationForm, HttpServletRequest request) {
		PageInfo pageInfo = new PageInfo(request);
		List<ElecStation> listStation = null;
		ArrayList<Object> hqlWhereAndParams = this
				.gethqlWhereAndParams(elecStationForm);
		String hqlWhere = (String) hqlWhereAndParams.get(0);
		Object[] params = (Object[]) hqlWhereAndParams.get(1);
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.lastDate", "desc");
		if (hqlWhere != null && !"".equals(hqlWhere) && params != null) {
			hqlWhere += " and o.isDelete = '0' ";
			listStation = elecStationDao.findCollectionByConditionWithPage(
					hqlWhere, params, orderBy, pageInfo);
		} else {
			hqlWhere += " and o.isDelete = '0'";
			listStation = elecStationDao.findCollectionByConditionWithPage(
					hqlWhere, null, orderBy, pageInfo);
		}
		List<ElecStationForm> formList = this.convertPoToVoList(listStation,
				pageInfo);
		request.setAttribute("page", pageInfo.getPageBean());
		return formList;
	}

	// 将PO对象列表转成VO对象列表
	private List<ElecStationForm> convertPoToVoList(
			List<ElecStation> listStation, PageInfo pageInfo) {
		List<ElecStationForm> stationList = new ArrayList<ElecStationForm>();
		ElecStationForm elecStationForm = null;
		int currentFirst = 0;
		if (pageInfo != null) {
			if (pageInfo.getPageSize() < 10) {
				currentFirst = pageInfo.getTotalResult()
						- pageInfo.getPageSize() + 1;
			} else {
				currentFirst = pageInfo.getBeginResult() + 1;
			}
		}
		for (ElecStation elecStation : listStation) {
			elecStationForm = new ElecStationForm();
			elecStationForm = this.convertPoToVo(elecStation);
			elecStationForm.setNum(String.valueOf(currentFirst++));
			stationList.add(elecStationForm);
		}
		return stationList;
	}

	// 将PO对象转成VO对象
	private ElecStationForm convertPoToVo(ElecStation elecStation) {
		ElecStationForm elecStationForm = new ElecStationForm();
		if (elecStation != null) {
			// 主键
			if (elecStation.getStationID() != null
					&& !"".equals(elecStation.getStationID())) {
				elecStationForm.setStationID(elecStation.getStationID());
			}
			// 其他属性
			elecStationForm.setProduceHome(elecStation.getProduceHome());
			elecStationForm.setUseStartDate(elecStation.getUseStartDate()
					.toString());
			elecStationForm.setComment(elecStation.getComment());
			elecStationForm.setIsDelete("0");

			// 还有创建人，创建时间，修改时间，修改人的属性，页面不需要

			// home页面需要显示的属性
			elecStationForm
					.setJctID(elecStation.getJctID() != null ? elecDictionaryDao
							.findDictionaryName("所属单位", elecStation.getJctID())
							.get(0).toString()
							: "");
			elecStationForm.setAttributionGround(elecStation
					.getAttributionGround());
			elecStationForm.setStationCode(elecStation.getStationCode());
			elecStationForm.setStationName(elecStation.getStationCode());
			elecStationForm
					.setStationType(elecStation.getStationType() != null ? elecDictionaryDao
							.findDictionaryName("站点类别",
									elecStation.getStationType()).get(0)
							.toString()
							: "");
			elecStationForm.setContactType(elecStation.getContactType());
			elecStationForm.setJcFrequency(elecStation.getjCFrequency());
		}
		return elecStationForm;
	}

	// 解析从页面传来的数据，拼出查询语句和参数
	private ArrayList<Object> gethqlWhereAndParams(
			ElecStationForm elecStationForm) {
		List<Object> paramList = new ArrayList<Object>();
		StringBuffer stringBuffer = new StringBuffer();
		// 可能存在的条件，所属单位，站点名称，站点代号，站点类型，通讯方式，归属地
		if (elecStationForm != null) {
			if (elecStationForm.getJctID() != null
					&& !"".equals(elecStationForm.getJctID())) {
				stringBuffer.append(" and o.jctID = ? ");
				paramList.add(elecStationForm.getJctID());
			}
			if (elecStationForm.getStationName() != null
					&& !"".equals(elecStationForm.getStationName())) {
				stringBuffer.append(" and o.stationName like ?");
				paramList.add("%" + elecStationForm.getStationName() + "%");
			}
			if (elecStationForm.getStationCode() != null
					&& !"".equals(elecStationForm.getStationCode())) {
				stringBuffer.append(" and o.stationCode like ?");
				paramList.add("%" + elecStationForm.getStationCode() + "%");
			}
			if (elecStationForm.getStationType() != null
					&& !"".equals(elecStationForm.getStationType())) {
				stringBuffer.append(" and o.stationType = ?");
				paramList.add(elecStationForm.getStationType());
			}
			if (elecStationForm.getContactType() != null
					&& !"".equals(elecStationForm.getContactType())) {
				stringBuffer.append(" and o.contactType like ?");
				paramList.add("%" + elecStationForm.getContactType() + "%");
			}
			if (elecStationForm.getAttributionGround() != null
					&& !"".equals(elecStationForm.getAttributionGround())) {
				stringBuffer.append(" and o.attributionGround like ?");
				paramList.add("%" + elecStationForm.getAttributionGround()
						+ "%");
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

	// 保存站点信息
	@Override
	public void saveStation(ElecStationForm elecStationForm,
			HttpServletRequest request) {
		if (elecStationForm != null) {
			String stationID = elecStationForm.getStationID();
			ElecUser elecUser = (ElecUser) request.getSession().getAttribute(
					"globle_user");
			ElecStation elecStation = null;
			// 要更新时候
			if (stationID != null && !"".equals(stationID)) {
				elecStationDao.deleteObjectByIDs(stationID);
				elecStation = this.convertVoToPo(elecStationForm);
			} else {
				elecStation = this.convertVoToPo(elecStationForm);
				elecStation.setCreateDate(new Date());
				elecStation.setCreateEmpID(elecUser.getUserID());
			}
			// 非页面中的属性
			elecStation.setIsDelete("0");
			elecStation.setLastEmpID(elecUser.getUserID());
			elecStation.setLastDate(new Date());
			elecStationDao.save(elecStation);
		}
	}

	private ElecStation convertVoToPo(ElecStationForm elecStationForm) {
		ElecStation elecStation = new ElecStation();
		// 页面属性
		elecStation.setJctID(elecStationForm.getJctID());
		elecStation.setStationName(elecStationForm.getStationName());
		elecStation.setStationCode(elecStationForm.getStationCode());
		elecStation.setUseStartDate(StringHelper
				.stringConvertDate(elecStationForm.getUseStartDate()));
		elecStation.setjCFrequency(elecStationForm.getJcFrequency());
		elecStation.setProduceHome(elecStationForm.getProduceHome());
		elecStation.setContactType(elecStationForm.getContactType());
		elecStation.setStationType(elecStationForm.getStationType());
		elecStation
				.setAttributionGround(elecStationForm.getAttributionGround());
		elecStation.setComment(elecStationForm.getComment());
		return elecStation;
	}

	// 通过站点的主键ID找到记录
	@Override
	public ElecStationForm findStationByID(String stationID) {
		ElecStation elecStation = elecStationDao.findObjectByID(stationID);
		ElecStationForm elecStationForm = this.convertPoToVo(elecStation);
		return elecStationForm;
	}

	// 删除，不是真的删除，是将isDelete字段置为1
	@Override
	public void deleteStation(ElecStationForm elecStationForm) {
		ElecStation entity = elecStationDao.findObjectByID(elecStationForm
				.getStationID());
		entity.setIsDelete("1");
		elecStationDao.update(entity);
	}

	// 找到所有需要导出的字段
	@Override
	public Map<String, String> getAllFieldNameWhenExportExcel(
			ElecStationForm elecStationForm) {
		Map<String, String> fields = new HashMap<String, String>();
		fields.put("jctID", "所属单位");
		fields.put("stationCode", "站点代号");
		fields.put("stationName", "站点名称");
		fields.put("jcFrequency", "安装地点");
		fields.put("produceHome", "生产厂家");
		fields.put("contactType", "通讯方法");
		fields.put("useStartDate", "使用日期");
		fields.put("comment", "备注");
		fields.put("createEmpID", "创建人");
		fields.put("createDate", "创建日期");
		fields.put("lastEmpID", "修改人");
		fields.put("lastDate", "修改日期");
		fields.put("stationType", "站点类别");
		fields.put("attributionGround", "对归属地");
		return fields;
	}

	@Override
	public ArrayList<ArrayList<String>> getFiledDataWhenExportExcel(
			ElecStationForm elecStationForm, ArrayList<String> fields) {
		List<ElecStation> list = this.findAllStation();

		ArrayList<String> fieldList = null;
		ArrayList<ArrayList<String>> fieldLists = new ArrayList<ArrayList<String>>();
		List<ElecStationForm> stationFormList = this.convertPoToVoList(list,
				null);

		Class clazz = elecStationForm.getClass();
		Method getMethod = null;
		ArrayList<String> methodList = new ArrayList<String>();

		for (String string : fields) {
			String getMethodStr = "";
			getMethodStr = "get" + string.trim().substring(0, 1).toUpperCase()
					+ string.trim().substring(1);
			methodList.add(getMethodStr);
		}
		for (ElecStationForm stationForm : stationFormList) {
			fieldList = new ArrayList<String>();
			for (String string : methodList) {
				try {
					getMethod = clazz.getMethod(string, null);
					try {
						fieldList.add((String) getMethod.invoke(stationForm,
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

	// 找所有的statio
	private List<ElecStation> findAllStation() {
		List<ElecStation> list = elecStationDao
				.findCollectionByConditionNoPage("", null, null);
		return list;
	}
}
