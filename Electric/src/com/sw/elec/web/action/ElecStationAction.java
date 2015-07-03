package com.sw.elec.web.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.service.IElecStationService;
import com.sw.elec.util.ExcelFileGenerator;
import com.sw.elec.web.form.ElecDictionaryForm;
import com.sw.elec.web.form.ElecStationForm;

@SuppressWarnings("serial")
public class ElecStationAction extends BaseAction implements
		ModelDriven<ElecStationForm> {

	private IElecStationService elecStationService = (IElecStationService) ServiceProvider
			.getService(IElecStationService.SERVICE_NAME);

	private IElecDictionaryService elecDictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	private ElecStationForm elecStationForm = new ElecStationForm();

	@Override
	public ElecStationForm getModel() {
		return elecStationForm;
	}

	public String home() {
		this.initDictionary();
		List<ElecStationForm> stationList = elecStationService
				.findAllStationWithPage(elecStationForm, request);
		this.request.setAttribute("stationList", stationList);
		String searchflag = elecStationForm.getSearchflag();
		if (searchflag != null && "1".equals(searchflag))
			return "infoList";
		return "home";
	}

	// 初始化，将所属单位，设备类型，设备状态从数据字典中查出来，放入request中
	private void initDictionary() {
		List<ElecDictionaryForm> jctIDs = elecDictionaryService
				.findDDlNameByKeyword("所属单位");
		List<ElecDictionaryForm> stationTypes = elecDictionaryService
				.findDDlNameByKeyword("站点类别");
		this.request.setAttribute("jctIDs", jctIDs);
		this.request.setAttribute("stationTypes", stationTypes);
	}

	public String add() {
		this.initDictionary();
		return "add";
	}

	public String save() {
		elecStationService.saveStation(elecStationForm, request);
		return "list";
	}

	public String edit() {
		this.initDictionary();
		ElecStationForm elecStationF = elecStationService
				.findStationByID(elecStationForm.getStationID());
		if ("1".equals(elecStationForm.getViewflag())) {
			this.request.setAttribute("viewflag", "1");
		} else {
			this.request.setAttribute("viewflag", "");
		}
		ActionContext.getContext().getValueStack().push(elecStationF);
		return "edit";
	}

	public String delete() {
		elecStationService.deleteStation(elecStationForm);
		return "list";
	}

	public String exportSet() {
		Map<String, String> fields = elecStationService
				.getAllFieldNameWhenExportExcel(elecStationForm);
		this.request.setAttribute("fields", fields);
		return "exportSet";
	}

	public String setExportExcel() {
		List<String> names = getBySelected(elecStationForm.getNames());
		List<String> fields = getBySelected(elecStationForm.getFields());
		this.request.getSession().setAttribute("names", names);
		this.request.getSession().setAttribute("fields", fields);
		return null;
	}

	// 将用户选择的需要导出的选项分割成list
	private List<String> getBySelected(String names) {
		String[] strs = names.trim().split("#");
		List<String> result = new ArrayList<String>();
		for (String string : strs) {
			result.add(string.trim());
		}
		return result;
	}

	public String export() {
		// 导出的文件的名称
		String fileName = "站点基本信息.xls";
		// 首先需要得到导出的数据项名称
		ArrayList<String> names = (ArrayList<String>) this.request.getSession()
				.getAttribute("names");
		ArrayList<String> fields = (ArrayList<String>) this.request
				.getSession().getAttribute("fields");
		// 得到需要导出的数据
		ArrayList<ArrayList<String>> dataList = elecStationService
				.getFiledDataWhenExportExcel(elecStationForm, fields);
		try {
			OutputStream outputStream = response.getOutputStream();
			response.reset();
			response.setContentType("application/msexcel;charset=GBK");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(fileName.getBytes(), "ISO8859-1") + "\"");
			ExcelFileGenerator fileGenerator = new ExcelFileGenerator(names,
					dataList);
			try {
				fileGenerator.expordExcel(outputStream);
				if (outputStream != null)
					outputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
