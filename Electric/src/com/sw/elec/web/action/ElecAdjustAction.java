package com.sw.elec.web.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecAdjustService;
import com.sw.elec.service.IElecDeviceService;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.util.ExcelFileGenerator;
import com.sw.elec.web.form.ElecAdjustForm;
import com.sw.elec.web.form.ElecDeviceForm;
import com.sw.elec.web.form.ElecDictionaryForm;

@SuppressWarnings("serial")
public class ElecAdjustAction extends BaseAction implements
		ModelDriven<ElecAdjustForm> {

	private IElecAdjustService elecAdjustService = (IElecAdjustService) ServiceProvider
			.getService(IElecAdjustService.SERVICE_NAME);

	private IElecDictionaryService elecDictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	private IElecDeviceService elecDeviceService = (IElecDeviceService) ServiceProvider
			.getService(IElecDeviceService.SERVICE_NAME);

	private ElecAdjustForm elecAdjustForm = new ElecAdjustForm();

	@Override
	public ElecAdjustForm getModel() {
		return elecAdjustForm;
	}

	public String home() {
		this.initDictionary();
		List<ElecAdjustForm> adjustList = elecAdjustService
				.findAllDeviceAdjustWithPage(elecAdjustForm, request);
		this.request.setAttribute("adjustList", adjustList);
		String searchFlag = elecAdjustForm.getSearchFlag();
		if (searchFlag != null && "1".equals(searchFlag))
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
		List<ElecDictionaryForm> isOrNot = elecDictionaryService
				.findDDlNameByKeyword("是否");
		this.request.setAttribute("jctIDs", jctIDs);
		this.request.setAttribute("devTypes", devTypes);
		this.request.setAttribute("idAdjusts", idAdjusts);
		this.request.setAttribute("isOrNot", isOrNot);
	}

	public String add() {
		this.initDictionary();
		ElecAdjustForm adjustForm = elecAdjustService
				.findAdjustFormByDevID(elecAdjustForm);
		ActionContext.getContext().getValueStack().push(adjustForm);
		return "add";
	}

	public String edit() {
		this.initDictionary();
		ElecAdjustForm adjustForm = elecAdjustService
				.findAdjustFormByDevID(elecAdjustForm);
		ActionContext.getContext().getValueStack().push(adjustForm);
		this.request.setAttribute("adjustForm", adjustForm);
		String viewflag = elecAdjustForm.getViewflag() != null
				&& !"".equals(elecAdjustForm.getViewflag()) ? elecAdjustForm
				.getViewflag() : "";
		this.request.setAttribute("viewflag", viewflag);
		return "edit";
	}

	public String save() {
		elecAdjustService.save(elecAdjustForm, request);
		return "list";
	}

	public String query() {
		List<ElecAdjustForm> aFlist = elecAdjustService
				.findAllDeviceAdjustWithdevID(elecAdjustForm);
		this.request.setAttribute("aFlist", aFlist);
		return "query";
	}

	public String moreAdd() {
		this.initDictionary();
		return "moreAdd";
	}

	public String moreAddList() {
		List<ElecDeviceForm> deviceList = null;
		String findflag = this.request.getParameter("findflag");
		String devType = this.request.getParameter("devType");
		if ("1".equals(findflag) && !"0".equals(devType)) {
			deviceList = elecDeviceService.findDeviceByDevType(devType);
		} else {
			deviceList = elecDeviceService.findAllDevices();
		}
		this.request.setAttribute("deviceList", deviceList);
		return "moreAddList";
	}

	public String upload() {
		return "upload";
	}

	public String exportSet() {
		Map<String, String> fields = elecAdjustService
				.getAllFieldNameWhenExportExcel(elecAdjustForm);
		this.request.setAttribute("fields", fields);
		return "exportSet";
	}

	public String setExportExcel() {
		List<String> nams = getBySelected(elecAdjustForm.getNames());
		List<String> fields = getBySelected(elecAdjustForm.getFields());
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
		String fileName = "设备校验记录.xls";
		// 首先需要得到导出的数据项名称
		ArrayList<String> names = (ArrayList<String>) this.request.getSession()
				.getAttribute("nams");
		ArrayList<String> fields = (ArrayList<String>) this.request
				.getSession().getAttribute("fields");
		// 得到需要导出的数据
		ArrayList<ArrayList<String>> dataList = elecAdjustService
				.getFiledDataWhenExportExcel(elecAdjustForm, fields);
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
