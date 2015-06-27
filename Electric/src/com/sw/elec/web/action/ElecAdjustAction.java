package com.sw.elec.web.action;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecAdjustService;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.web.form.ElecAdjustForm;
import com.sw.elec.web.form.ElecDictionaryForm;

@SuppressWarnings("serial")
public class ElecAdjustAction extends BaseAction implements
		ModelDriven<ElecAdjustForm> {

	private IElecAdjustService elecAdjustService = (IElecAdjustService) ServiceProvider
			.getService(IElecAdjustService.SERVICE_NAME);

	private IElecDictionaryService elecDictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	private ElecAdjustForm elecAdjustForm = new ElecAdjustForm();

	@Override
	public ElecAdjustForm getModel() {
		return elecAdjustForm;
	}

	public String home() {
		this.initDictionary();
		List<ElecAdjustForm> adjustList = elecAdjustService.findAllDeviceAdjustWithPage(elecAdjustForm,request);
		this.request.setAttribute("adjustList", adjustList);
		String searchFlag = elecAdjustForm.getSearchFlag();
		if(searchFlag!=null&&"1".equals(searchFlag))
			return "adjustList";
		return "home";
	}

	// 初始化，将所属单位，设备类型，设备状态从数据字典中查出来，放入request中
	private void initDictionary() {
		List<ElecDictionaryForm> jctIDs = elecDictionaryService
				.findDDlNameByKeyword("所属单位");
		List<ElecDictionaryForm> devTypes = elecDictionaryService
				.findDDlNameByKeyword("设备类型");
		List<ElecDictionaryForm> idAdjusts = elecDictionaryService
				.findDDlNameByKeyword("校准状态");
		this.request.setAttribute("jctIDs", jctIDs);
		this.request.setAttribute("devTypes", devTypes);
		this.request.setAttribute("idAdjusts", idAdjusts);
	}
	public String edit(){
		return "edit";
	}
}
