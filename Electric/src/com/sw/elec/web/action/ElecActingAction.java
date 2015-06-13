package com.sw.elec.web.action;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecCommonMsgService;
import com.sw.elec.web.form.ElecCommonMsgForm;

@SuppressWarnings("serial")
public class ElecActingAction extends BaseAction implements
		ModelDriven<ElecCommonMsgForm> {

	private IElecCommonMsgService commonMsgService = (IElecCommonMsgService) ServiceProvider
			.getService(IElecCommonMsgService.SERVICE_NAME);

	private ElecCommonMsgForm elecCommonMsgForm = new ElecCommonMsgForm();

	@Override
	public ElecCommonMsgForm getModel() {
		return elecCommonMsgForm;
	}

	public String home() {
		List<ElecCommonMsgForm> list = commonMsgService.findElecCommonMsgList();
		this.request.setAttribute("comMsg", list);
		return "home";
	}

	public String save() {
		commonMsgService.saveElecCommonMsg(elecCommonMsgForm);
		return "save";
	}
}
