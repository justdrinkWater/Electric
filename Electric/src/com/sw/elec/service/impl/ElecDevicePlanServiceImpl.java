package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecDevicePlanDao;
import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.domain.ElecDevicePlan;
import com.sw.elec.domain.ElecUser;
import com.sw.elec.service.IElecDevicePlanService;
import com.sw.elec.util.PageInfo;
import com.sw.elec.util.StringHelper;
import com.sw.elec.web.form.ElecDevicePlanForm;

@Transactional
@Service(IElecDevicePlanService.SERVICE_NAME)
public class ElecDevicePlanServiceImpl implements IElecDevicePlanService {

	@Resource(name = IElecDevicePlanDao.SERVICE_NAME)
	private IElecDevicePlanDao elecDevicePlanDao;

	@Resource(name = IElecDictionaryDao.SERVICE_NAME)
	private IElecDictionaryDao elecDictionaryDao;

	// 保存购置设备计划
	@Override
	public void save(ElecDevicePlanForm elecDevicePlanForm,
			HttpServletRequest request) {
		ElecUser user = (com.sw.elec.domain.ElecUser) request.getSession()
				.getAttribute("globle_user");
		ElecDevicePlan devicePlan = this
				.convertVOToPo(elecDevicePlanForm, user);
		ElecDevicePlan devicePlan2 = null;
		if (elecDevicePlanForm.getDevPlanID() != null
				&& !"".equals(elecDevicePlanForm.getDevPlanID())) {
			devicePlan2 = elecDevicePlanDao.findObjectByID(elecDevicePlanForm
					.getDevPlanID());
			devicePlan.setCreateDate(devicePlan2.getCreateDate());
			devicePlan.setCreateEmpID(devicePlan2.getCreateEmpID());
			devicePlan.setPurchaseState(devicePlan2.getPurchaseState());
			devicePlan.setComment(devicePlan2.getComment());
			elecDevicePlanDao.deleteObjectByIDs(elecDevicePlanForm
					.getDevPlanID());
		} else {
			// 不是修改的时候，在创建的时候需要设置的属性
			devicePlan.setCreateDate(new Date());
			devicePlan.setCreateEmpID(user != null ? user.getUserID() : "");
			devicePlan.setPurchaseState("0");
			devicePlan.setComment(elecDevicePlanForm.getComment());
		}
		elecDevicePlanDao.save(devicePlan);
	}

	// 将VO对象转成PO对象
	private ElecDevicePlan convertVOToPo(ElecDevicePlanForm elecDevicePlanForm,
			ElecUser user) {
		ElecDevicePlan elecDevicePlan = new ElecDevicePlan();
		elecDevicePlan
				.setDevPlanID(elecDevicePlanForm.getDevPlanID() != null
						&& !"".equals(elecDevicePlanForm.getDevPlanID()) ? elecDevicePlanForm
						.getDevPlanID() : "");
		// 可以页面可以得到的属性
		elecDevicePlan.setDevType(elecDevicePlanForm.getDevType());
		elecDevicePlan.setDevName(elecDevicePlanForm.getDevName());
		elecDevicePlan.setTrademark(elecDevicePlanForm.getTrademark());
		elecDevicePlan.setSpecType(elecDevicePlanForm.getSpecType());
		elecDevicePlan.setProduceHome(elecDevicePlanForm.getProduceHome());
		elecDevicePlan.setQuality(elecDevicePlanForm.getQuality());
		elecDevicePlan.setqUnit(elecDevicePlanForm.getQunit());
		elecDevicePlan.setUseness(elecDevicePlanForm.getUseness());
		elecDevicePlan.setDevExpense(Double.valueOf(elecDevicePlanForm
				.getDevExpense()));
		elecDevicePlan.setUseUnit(elecDevicePlanForm.getUseUnit());
		elecDevicePlan.setProduceArea(elecDevicePlanForm.getProduceArea());
		elecDevicePlan.setJctID(elecDevicePlanForm.getJctID());
		if (elecDevicePlanForm.getPlanDate() != null
				&& !"".equals(elecDevicePlanForm.getPlanDate())) {
			elecDevicePlan.setPlanDate(StringHelper
					.stringConvertDate(elecDevicePlanForm.getPlanDate()));
		}
		elecDevicePlan.setAdjustPeriod(elecDevicePlanForm.getAdjustPeriod());
		elecDevicePlan.setaPUnit(elecDevicePlanForm.getApUnit());
		elecDevicePlan
				.setOverhaulPeriod(elecDevicePlanForm.getOverhaulPeriod());
		elecDevicePlan.setoPUnit(elecDevicePlanForm.getOpUnit());
		elecDevicePlan.setConfigure(elecDevicePlanForm.getConfigure());

		elecDevicePlan.setLastEmpID(user != null ? user.getUserID() : "");
		elecDevicePlan.setLastDate(new Date());

		elecDevicePlan.setIsDelete("0");
		return elecDevicePlan;
	}

	// 找到所有的devicePlan
	@Override
	public List<ElecDevicePlanForm> findAllDevicePlanWithPage(
			ElecDevicePlanForm elecDevicePlanForm, HttpServletRequest request) {
		// 可能从页面传来的条件所属单位，设备名称，计划时间，设备类型
		PageInfo pageInfo = new PageInfo(request);
		List<ElecDevicePlan> listDevicePlan = null;
		ArrayList<Object> hqlWhereAndParams = this
				.gethqlWhereAndParams(elecDevicePlanForm);
		String hqlWhere = (String) hqlWhereAndParams.get(0);
		Object[] params = (Object[]) hqlWhereAndParams.get(1);
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.lastDate", "desc");
		if (hqlWhere != null && !"".equals(hqlWhere) && params != null) {
			hqlWhere += " and o.isDelete = '0'";
			listDevicePlan = elecDevicePlanDao
					.findCollectionByConditionWithPage(hqlWhere, params,
							orderBy, pageInfo);
		} else {
			hqlWhere += " and o.isDelete = '0'";
			listDevicePlan = elecDevicePlanDao
					.findCollectionByConditionWithPage(hqlWhere, null, orderBy,
							pageInfo);
		}
		List<ElecDevicePlanForm> planFormList = this.convertPoToVoList(
				listDevicePlan, pageInfo);
		request.setAttribute("page", pageInfo.getPageBean());
		return planFormList;
	}

	// 将PO列表对象转成VO对象列表
	private List<ElecDevicePlanForm> convertPoToVoList(
			List<ElecDevicePlan> listDevicePlan, PageInfo pageInfo) {
		List<ElecDevicePlanForm> planList = new ArrayList<ElecDevicePlanForm>();
		ElecDevicePlanForm devicePlanForm = null;
		int currentFirst = 0;
		if (pageInfo != null) {
			if (pageInfo.getPageSize() < 10) {
				currentFirst = pageInfo.getTotalResult()
						- pageInfo.getPageSize() + 1;
			} else {
				currentFirst = pageInfo.getBeginResult() + 1;
			}
		}
		for (ElecDevicePlan elecDevicePlan : listDevicePlan) {
			devicePlanForm = new ElecDevicePlanForm();
			devicePlanForm = this.convertPoToVo(elecDevicePlan);
			devicePlanForm.setNum(String.valueOf(currentFirst++));
			planList.add(devicePlanForm);
		}
		return planList;
	}

	// 将PO对象转成VO对象
	private ElecDevicePlanForm convertPoToVo(ElecDevicePlan elecDevicePlan) {
		ElecDevicePlanForm elecDevicePlanForm = new ElecDevicePlanForm();

		elecDevicePlanForm.setDevPlanID(elecDevicePlan.getDevPlanID() != null
				&& !"".equals(elecDevicePlan.getDevPlanID()) ? elecDevicePlan
				.getDevPlanID() : "");

		elecDevicePlanForm.setDevName(elecDevicePlan.getDevName());
		elecDevicePlanForm.setQuality(elecDevicePlan.getQuality());
		elecDevicePlanForm.setDevExpense(String.valueOf(elecDevicePlan
				.getDevExpense()));
		elecDevicePlanForm.setSpecType(elecDevicePlan.getSpecType());
		elecDevicePlanForm.setUseness(elecDevicePlan.getUseness());
		elecDevicePlanForm.setUseUnit(elecDevicePlan.getUseUnit());
		elecDevicePlanForm.setPurchaseState(elecDevicePlan.getPurchaseState());
		elecDevicePlanForm.setDevPlanID(elecDevicePlan.getDevPlanID());
		// 增加设置的项，修改页面和查看页面需要
		elecDevicePlanForm.setDevType(elecDevicePlan.getDevType());
		elecDevicePlanForm.setTrademark(elecDevicePlan.getTrademark());
		elecDevicePlanForm.setQunit(elecDevicePlan.getqUnit());
		elecDevicePlanForm.setProduceHome(elecDevicePlan.getProduceHome());
		elecDevicePlanForm.setProduceArea(elecDevicePlan.getProduceArea());
		elecDevicePlanForm.setJctID(elecDevicePlan.getJctID());
		elecDevicePlanForm.setPlanDate(elecDevicePlan.getPlanDate().toString());
		elecDevicePlanForm.setAdjustPeriod(elecDevicePlan.getAdjustPeriod());
		elecDevicePlanForm.setApUnit(elecDevicePlan.getaPUnit());
		elecDevicePlanForm
				.setOverhaulPeriod(elecDevicePlan.getOverhaulPeriod());
		elecDevicePlanForm.setOpUnit(elecDevicePlan.getoPUnit());
		elecDevicePlanForm.setConfigure(elecDevicePlan.getConfigure());

		return elecDevicePlanForm;
	}

	// 从页面传来的数据中拼出查询语句和参数
	private ArrayList<Object> gethqlWhereAndParams(
			ElecDevicePlanForm elecDevicePlanForm) {
		List<Object> paramList = new ArrayList<Object>();
		StringBuffer stringBuffer = new StringBuffer();
		if (elecDevicePlanForm != null) {
			if (elecDevicePlanForm.getJctID() != null
					&& !"".equals(elecDevicePlanForm.getJctID())) {
				stringBuffer.append(" and o.jctID = ? ");
				paramList.add(elecDevicePlanForm.getJctID());
			}
			if (elecDevicePlanForm.getDevName() != null
					&& !"".equals(elecDevicePlanForm.getDevName())) {
				stringBuffer.append(" and o.devName like ? ");
				paramList.add("%" + elecDevicePlanForm.getDevName() + "%");
			}
			if (elecDevicePlanForm.getDevType() != null
					&& !"".equals(elecDevicePlanForm.getDevType())) {
				stringBuffer.append(" and o.devType = ?");
				paramList.add(elecDevicePlanForm.getDevType());
			}
			// 时间比较，需要调整
			/*
			 * if (elecDevicePlanForm.getPlanDatef() != null &&
			 * !"".equals(elecDevicePlanForm.getPlanDatef())) {
			 * stringBuffer.append(" and o. >:  ?");
			 * paramList.add(elecDevicePlanForm.getPlanDatef()); } if
			 * (elecDevicePlanForm.getPlanDatet() != null &&
			 * !"".equals(elecDevicePlanForm.getPlanDatet())) {
			 * stringBuffer.append(" and o. <:  ?");
			 * paramList.add(elecDevicePlanForm.getPlanDatet()); }
			 */
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

	// “删除”指定ID的计划，并不是真正的删除，只是将指定ID的计划的isDelete字段置为1
	@Override
	public void delete(ElecDevicePlanForm elecDevicePlanForm) {
		if (elecDevicePlanForm.getDevPlanID() != null
				&& !"".equals(elecDevicePlanForm.getDevPlanID())) {
			ElecDevicePlan entity = elecDevicePlanDao
					.findObjectByID(elecDevicePlanForm.getDevPlanID());
			entity.setIsDelete("1");
			elecDevicePlanDao.update(entity);
		}
	}

	// 设备购置，将前台传来的选中的设备购置计划ID解析出来，在进行操作数据库
	@Override
	public void purchase(ElecDevicePlanForm elecDevicePlanForm) {
		String plantodevID = elecDevicePlanForm.getPlantodev();
		String[] plantodevIDs = null;
		if (plantodevID != null && !"".equals(plantodevID)) {
			plantodevIDs = plantodevID.trim().split(",");
		}
		List<ElecDevicePlan> plans = elecDevicePlanDao
				.findObjectByIDs(plantodevIDs);
		for (ElecDevicePlan elecDevicePlan : plans) {
			elecDevicePlan.setPurchaseState("1");
			elecDevicePlanDao.update(elecDevicePlan);
		}
	}

	// 通过主键ID找到devicePlan
	@Override
	public ElecDevicePlanForm findDevicePlanByID(String devPlanID) {
		ElecDevicePlan devicePlan = elecDevicePlanDao.findObjectByID(devPlanID);
		ElecDevicePlanForm devicePlanForm = this.convertPoToVo(devicePlan);
		return devicePlanForm;
	}

}
