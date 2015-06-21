package com.sw.elec.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.service.IElecDeviceService;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.web.form.ElecDeviceForm;
import com.sw.elec.web.form.ElecDictionaryForm;

@SuppressWarnings("serial")
public class ElecDeviceAction extends BaseAction implements
		ModelDriven<ElecDeviceForm> {

	private IElecDeviceService elecDeviceService = (IElecDeviceService) ServiceProvider
			.getService(IElecDeviceService.SERVICE_NAME);
	private IElecDictionaryService elecDictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	private ElecDeviceForm elecDeviceForm = new ElecDeviceForm();

	@Override
	public ElecDeviceForm getModel() {
		return elecDeviceForm;
	}

	public String home() {
		this.initDictionary();
		String searchFlag = elecDeviceForm.getSearchFlag();
		List<ElecDeviceForm> list = elecDeviceService.findDevicesWithPage(
				elecDeviceForm, request);
		this.request.setAttribute("listDevice", list);
		if ("1".equals(searchFlag))
			return "equapmentList";
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
		this.request.setAttribute("jctIDs", jctIDs);
		this.request.setAttribute("devTypes", devTypes);
		this.request.setAttribute("devStates", devStates);
	}

	public String edit() {

		return "edit";
	}
}
