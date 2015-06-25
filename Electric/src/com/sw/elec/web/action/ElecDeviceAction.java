package com.sw.elec.web.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecDeviceService;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.util.ExcelFileGenerator;
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
		List<ElecDeviceForm> list = elecDeviceService.findDevicesWithPage(
				elecDeviceForm, request);
		this.request.setAttribute("listDevice", list);
		String searchFlag = elecDeviceForm.getSearchFlag();
		if (searchFlag != null && "1".equals(searchFlag))
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

	public String edit() {
		this.initDictionary();
		ElecDeviceForm elecDeviceF = elecDeviceService
				.findDevice(elecDeviceForm.getDevID());
		if ("1".equals(elecDeviceForm.getViewflag())) {
			this.request.setAttribute("viewflag", "1");
		}
		this.request.setAttribute("viewflag", "");
		ActionContext.getContext().getValueStack().push(elecDeviceF);
		return "edit";
	}

	public String save() {
		elecDeviceService.saveDevice(elecDeviceForm, request);
		return "list";
	}

	public String exportSet() {
		Map<String, String> fields = elecDeviceService
				.getAllFiledNamesWhenExportExcel(elecDeviceForm);
		this.request.setAttribute("fields", fields);
		return "exportSet";
	}

	public String setExportExcel() {
		List<String> nams = getBySelected(elecDeviceForm.getNames());
		List<String> fields = getBySelected(elecDeviceForm.getFields());
		this.request.getSession().setAttribute("nams", nams);
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

	@SuppressWarnings("unchecked")
	public String export() {
		// 导出的文件的名称
		String fileName = "设备详情.xls";
		// 首先需要得到导出的数据项名称
		ArrayList<String> names = (ArrayList<String>) this.request.getSession()
				.getAttribute("nams");
		ArrayList<String> fields = (ArrayList<String>) this.request
				.getSession().getAttribute("fields");
		// 得到需要导出的数据
		ArrayList<ArrayList<String>> dataList = elecDeviceService
				.getFiledDateWhenExportExcel(elecDeviceForm, fields);
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

	public String delete() {
		elecDeviceService.delete(elecDeviceForm);
		return "list";
	}
}
