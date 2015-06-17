package com.sw.elec.web.action;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecLogService;
import com.sw.elec.web.form.ElecLogForm;

@SuppressWarnings("serial")
public class ElecLogAction extends BaseAction implements
		ModelDriven<ElecLogForm> {

	private IElecLogService elecLogService = (IElecLogService) ServiceProvider
			.getService(IElecLogService.SERVICE_NAME);

	private ElecLogForm elecLogForm = new ElecLogForm();

	@Override
	public ElecLogForm getModel() {
		return elecLogForm;
	}

	public String home() {
		List<ElecLogForm> listLogs = elecLogService.findElecLog(elecLogForm);
		this.request.setAttribute("listLogs", listLogs);
		return "home";
	}

	public String delete() {
		elecLogService.deleteLogByFind(elecLogForm);
		return "list";
	}

}
