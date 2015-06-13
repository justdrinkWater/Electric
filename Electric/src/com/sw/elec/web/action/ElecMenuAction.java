package com.sw.elec.web.action;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecCommonMsgService;
import com.sw.elec.web.form.ElecCommonMsgForm;
import com.sw.elec.web.form.ElecMenuForm;

@SuppressWarnings("serial")
public class ElecMenuAction extends BaseAction implements
		ModelDriven<ElecMenuForm> {

	private IElecCommonMsgService commonMsgService = (IElecCommonMsgService) ServiceProvider
			.getService(IElecCommonMsgService.SERVICE_NAME);

	private ElecMenuForm elecMenuForm = new ElecMenuForm();

	@Override
	public ElecMenuForm getModel() {
		return elecMenuForm;
	}

	public String home() {
		return "home";
	}

	public String title() {
		return "title";
	}

	public String left() {
		return "left";
	}

	public String change1() {
		return "change1";
	}

	public String loading() {
		return "loading";
	}

	public String alermJX() {
		return "alermJX";
	}

	public String alermSB() {
		List<ElecCommonMsgForm> list = commonMsgService
				.findElecCommonMsgCurrentDate();
		this.request.setAttribute("comMsg", list);
		return "alermSB";
	}

	public String alermXZ() {
		return "alermXZ";
	}

	public String alermYS() {
		return "alermYS";
	}

	public String alermZD() {
		List<ElecCommonMsgForm> list = commonMsgService
				.findElecCommonMsgCurrentDate();
		this.request.setAttribute("comMsg", list);
		return "alermZD";
	}
}
