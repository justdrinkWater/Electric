package com.sw.elec.web.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.service.IElecUserService;
import com.sw.elec.util.ExcelFileGenerator;
import com.sw.elec.web.form.ElecDictionaryForm;
import com.sw.elec.web.form.ElecUserForm;

@SuppressWarnings("serial")
public class ElecUserAction extends BaseAction implements
		ModelDriven<ElecUserForm> {

	private IElecUserService elecUserService = (IElecUserService) ServiceProvider
			.getService(IElecUserService.SERVICE_NAME);

	private IElecDictionaryService elecDictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	private ElecUserForm elecUserForm = new ElecUserForm();

	@Override
	public ElecUserForm getModel() {
		return elecUserForm;
	}

	public String home() {
		// List<ElecUserForm> list = elecUserService.findUsers(elecUserForm);
		List<ElecUserForm> list = elecUserService.findUsersWithPage(
				elecUserForm, request);
		this.request.setAttribute("userList", list);
		String homeflag = this.request.getParameter("homeflag");
		if (homeflag != null && "1".equals(homeflag)) {
			return "userList";
		}
		return "home";
	}

	public String add() {
		this.initDictionary();
		return "add";
	}

	// 初始化字典
	private void initDictionary() {
		List<ElecDictionaryForm> dutyList = elecDictionaryService
				.findDDlNameByKeyword("是否在职");
		List<ElecDictionaryForm> sexList = elecDictionaryService
				.findDDlNameByKeyword("性别");
		List<ElecDictionaryForm> locList = elecDictionaryService
				.findDDlNameByKeyword("地点");
		this.request.setAttribute("dutyList", dutyList);
		this.request.setAttribute("sexList", sexList);
		this.request.setAttribute("locList", locList);
	}

	public String save() {
		elecUserService.saveUser(elecUserForm);
		String roleflag = (String) this.request.getAttribute("roleflag");
		if (roleflag != null && "1".equals(roleflag))
			return edit();
		return "list";
	}

	public String edit() {
		this.initDictionary();
		ElecUserForm elecUser = elecUserService.findUser(elecUserForm
				.getUserID());
		ActionContext.getContext().getValueStack().push(elecUser);
		String viewFlag = elecUserForm.getViewflag() != null ? elecUserForm
				.getViewflag() : "";
		this.request.setAttribute("viewflag", viewFlag);
		// 当roleflag为1时，则跳到userEdit.jsp页面
		// 当rolefla为空，则跳到userIndex.jsp页面
		String roleflag = elecUserForm.getRoleflag();
		this.request.setAttribute("roleflag", roleflag);
		return "edit";
	}

	public String delete() {
		elecUserService.delete(elecUserForm);
		return "list";
	}

	public String importExcel() {
		elecUserService.saveUserByFile(elecUserForm);
		return "importdata";
	}

	public String importpage() {
		return "importpage";
	}

	// 到处excel数据
	public String exportExcel() {
		//导出的文件的名称
		String fileName = "用户名单.xls";
		// 首先需要得到导出的数据项名称
		ArrayList<String> filedNames = (ArrayList<String>) elecUserService
				.getFiledNamesWhenExportExcel(elecUserForm);
		// 得到需要导出的数据
		ArrayList<ArrayList<String>> dataList = elecUserService
				.getFiledDateWhenExportExcel(elecUserForm);

		try {
			OutputStream outputStream = response.getOutputStream();
			response.reset();
			response.setContentType("application/msexcel;charset=GBK");
			response.setHeader("Content-Disposition", "attachment;filename=\""
		            + new String(fileName.getBytes(), "ISO8859-1") + "\"");
			ExcelFileGenerator fileGenerator = new ExcelFileGenerator(
					filedNames, dataList);
			try {
				fileGenerator.expordExcel(outputStream);
				//System.out.println(new PrintStream(outputStream));
				//outputStream.flush();
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
