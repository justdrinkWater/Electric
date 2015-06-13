package com.sw.elec.web.action;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.web.form.ElecDictionaryForm;

@SuppressWarnings("serial")
public class ElecDictionaryAction extends BaseAction implements
		ModelDriven<ElecDictionaryForm> {

	private IElecDictionaryService dictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	private ElecDictionaryForm elecDictionaryForm = new ElecDictionaryForm();

	@Override
	public ElecDictionaryForm getModel() {
		return elecDictionaryForm;
	}

	public String home() {
		List<ElecDictionaryForm> dicLsit = dictionaryService.findDictionaryKeyword();
		this.request.setAttribute("dicLsit", dicLsit);
		return "home";
	}
	
	public String edit(){
		String keyword = elecDictionaryForm.getKeyword();
		List<ElecDictionaryForm> list = dictionaryService.findDDlNameByKeyword(keyword);
		this.request.setAttribute("ddlList", list);
		return "edit";
	}
	public String save(){
		dictionaryService.saveDictionary(elecDictionaryForm);
		return "save";
	}
}
