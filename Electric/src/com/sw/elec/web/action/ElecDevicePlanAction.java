package com.sw.elec.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecDevicePlanService;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.web.form.ElecDevicePlanForm;
import com.sw.elec.web.form.ElecDictionaryForm;

@SuppressWarnings("serial")
public class ElecDevicePlanAction extends BaseAction implements
		ModelDriven<ElecDevicePlanForm> {

	private IElecDevicePlanService elecDevicePlanService = (IElecDevicePlanService) ServiceProvider
			.getService(IElecDevicePlanService.SERVICE_NAME);

	private IElecDictionaryService elecDictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	private ElecDevicePlanForm elecDevicePlanForm = new ElecDevicePlanForm();

	@Override
	public ElecDevicePlanForm getModel() {
		return elecDevicePlanForm;
	}

	public String home() {
		this.initDictionary();
		List<ElecDevicePlanForm> planList = elecDevicePlanService
				.findAllDevicePlanWithPage(elecDevicePlanForm, request);
		this.request.setAttribute("planList", planList);
		String searchflag = elecDevicePlanForm.getSearchFlag();
		if (searchflag != null && "1".equals(searchflag))
			return "planList";
		return "home";
	}

	// 初始化，将所属单位，设备类型，设备状态从数据字典中查出来，放入request中
	private void initDictionary() {
		List<ElecDictionaryForm> jctIDs = elecDictionaryService
				.findDDlNameByKeyword("所属单位");
		List<ElecDictionaryForm> devTypes = elecDictionaryService
				.findDDlNameByKeyword("设备类型");
		List<ElecDictionaryForm> devStates = elecDictionaryService
				.findDDlNameByKeyword("设备状态");
		List<ElecDictionaryForm> opUnits = elecDictionaryService
				.findDDlNameByKeyword("检修周期单位");
		List<ElecDictionaryForm> apUnits = elecDictionaryService
				.findDDlNameByKeyword("校准周期单位");
		this.request.setAttribute("jctIDs", jctIDs);
		this.request.setAttribute("devTypes", devTypes);
		this.request.setAttribute("devStates", devStates);
		this.request.setAttribute("opUnits", opUnits);
		this.request.setAttribute("apUnits", apUnits);
	}

	public String add() {
		this.initDictionary();
		return "add";
	}

	public String save() {
		elecDevicePlanService.save(elecDevicePlanForm, request);
		return "list";
	}

	public String delete() {
		elecDevicePlanService.delete(elecDevicePlanForm);
		return "list";
	}

	public String purchase() {
		elecDevicePlanService.purchase(elecDevicePlanForm);
		return "list";
	}

	public String edit() {
		this.initDictionary();
		ElecDevicePlanForm devicePlanForm = elecDevicePlanService
				.findDevicePlanByID(elecDevicePlanForm.getDevPlanID());
		if("1".equals(elecDevicePlanForm.getViewflag())){
			this.request.setAttribute("viewflag", "1");
		}else{
			this.request.setAttribute("viewflag", "");
		}
		ActionContext.getContext().getValueStack().push(devicePlanForm);
		return "edit";
	}
}
