package com.sw.elec.web.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.domain.ElecText;
import com.sw.elec.service.IElecTextService;
import com.sw.elec.util.StringHelper;
import com.sw.elec.web.form.ElecTextForm;

@SuppressWarnings("serial")
public class ElecTextAction extends BaseAction implements
		ModelDriven<ElecTextForm> {

	private IElecTextService elecTextService = (IElecTextService) ServiceProvider
			.getService(IElecTextService.SERVICE_NAME);

	private ElecTextForm elecTextFrom = new ElecTextForm();

	@Override
	public ElecTextForm getModel() {
		return elecTextFrom;
	}

	public String save() {
		// System.out.println(elecTextFrom.getTextName());
		// VO对象转换为PO对象
		// 实例化PO对象
		ElecText elecText = new ElecText();
		elecText.setTextName(elecTextFrom.getTextName());
		elecText.setTextRemark(elecTextFrom.getTextRemark());
		elecText.setTextDate(StringHelper.stringConvertDate(elecTextFrom
				.getTextDate()));
		elecTextService.saveText(elecText);
		return "save";
	}
}
