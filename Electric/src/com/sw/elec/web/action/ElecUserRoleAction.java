package com.sw.elec.web.action;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.service.IElecDictionaryService;
import com.sw.elec.service.IElecUserRoleService;
import com.sw.elec.util.XMLObject;
import com.sw.elec.web.form.ElecDictionaryForm;
import com.sw.elec.web.form.ElecUserForm;
import com.sw.elec.web.form.ElecUserRoleForm;

@SuppressWarnings("serial")
public class ElecUserRoleAction extends BaseAction implements
		ModelDriven<ElecUserRoleForm> {

	private ElecUserRoleForm elecUserRoleForm = new ElecUserRoleForm();

	private IElecUserRoleService elecUserRoleService = (IElecUserRoleService) ServiceProvider
			.getService(IElecUserRoleService.SERVICE_NAME);
	private IElecDictionaryService elecDictionaryService = (IElecDictionaryService) ServiceProvider
			.getService(IElecDictionaryService.SERVICE_NAME);

	@Override
	public ElecUserRoleForm getModel() {
		return elecUserRoleForm;
	}

	public String home() {
		List<ElecDictionaryForm> listDic = elecDictionaryService
				.findDDlNameByKeyword("角色类型");
		this.request.setAttribute("listDic", listDic);
		List<XMLObject> oList = elecUserRoleService.readXML();
		this.request.setAttribute("oList", oList);
		return "home";
	}

	public String edit(){
		String roleid = elecUserRoleForm.getRole();
		//找到对应的角色拥有的权限
		List<XMLObject> oList = elecUserRoleService.readFlagXML(roleid);
		this.request.setAttribute("oList", oList);
		//通过角色找到所有的用户
		List<ElecUserForm> list = elecUserRoleService.findElecUserListByRoleID(roleid);
		this.request.setAttribute("userList", list);
		return "edit";
	}
	
	public String save(){
		elecUserRoleService.save(elecUserRoleForm);
		return "save";
	}
}
