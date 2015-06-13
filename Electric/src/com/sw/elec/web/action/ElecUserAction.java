package com.sw.elec.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.service.IElecUserService;
import com.sw.elec.web.form.ElecDictionaryForm;
import com.sw.elec.web.form.ElecUserForm;

@SuppressWarnings("serial")
public class ElecUserAction extends BaseAction implements
		ModelDriven<ElecUserForm> {

	private IElecUserService elecUserService = (IElecUserService) ServiceProvider
			.getService(IElecUserService.SERVICE_NAME);

	private IElecDictionaryService elecDictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	private ElecUserForm elecUserForm = new ElecUserForm();

	@Override
	public ElecUserForm getModel() {
		return elecUserForm;
	}

	public String home() {
		List<ElecUserForm> list = elecUserService.findUsers(elecUserForm);
		this.request.setAttribute("userList", list);
		return "home";
	}

	public String add() {
		this.initDictionary();
		return "add";
	}

	// 初始化字典
	private void initDictionary() {
		List<ElecDictionaryForm> dutyList = elecDictionaryService
				.findDDlNameByKeyword("是否在职");
		List<ElecDictionaryForm> sexList = elecDictionaryService
				.findDDlNameByKeyword("性别");
		List<ElecDictionaryForm> locList = elecDictionaryService
				.findDDlNameByKeyword("地点");
		this.request.setAttribute("dutyList", dutyList);
		this.request.setAttribute("sexList", sexList);
		this.request.setAttribute("locList", locList);
	}

	public String save() {
		elecUserService.saveUser(elecUserForm);
		return "list";
	}

	public String edit() {
		this.initDictionary();
		ElecUserForm elecUser = elecUserService.findUser(elecUserForm
				.getUserID());
		ActionContext.getContext().getValueStack().push(elecUser);
		String viewFlag = elecUserForm.getViewflag() != null ? elecUserForm
				.getViewflag() : "";
		this.request.setAttribute("viewflag", viewFlag);
		return "edit";
	}

	public String delete() {
		elecUserService.delete(elecUserForm);
		return "list";
	}

}
