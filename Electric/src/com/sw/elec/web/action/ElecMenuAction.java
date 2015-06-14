package com.sw.elec.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ModelDriven;
import com.sw.elec.container.ServiceProvider;
import com.sw.elec.domain.ElecUser;
import com.sw.elec.service.IElecCommonMsgService;
import com.sw.elec.service.IElecUserService;
import com.sw.elec.util.MD5keyBean;
import com.sw.elec.web.form.ElecCommonMsgForm;
import com.sw.elec.web.form.ElecMenuForm;

@SuppressWarnings("serial")
public class ElecMenuAction extends BaseAction implements
		ModelDriven<ElecMenuForm> {

	private IElecCommonMsgService commonMsgService = (IElecCommonMsgService) ServiceProvider
			.getService(IElecCommonMsgService.SERVICE_NAME);

	private IElecUserService elecUserService = (IElecUserService) ServiceProvider
			.getService(IElecUserService.SERVICE_NAME);

	private ElecMenuForm elecMenuForm = new ElecMenuForm();

	@Override
	public ElecMenuForm getModel() {
		return elecMenuForm;
	}

	public String home() {
		// 首先需要得到用户首页填写的用户名和密码
		String logonName = elecMenuForm.getName();
		String logonPw = elecMenuForm.getPassword();
		MD5keyBean md5keyBean = new MD5keyBean();
		// 接着再判断在数据库中是否有这个用户名
		ElecUser elecUser = elecUserService.findUserByName(logonName);
		// 如果没有则显示错误信息，说明是用户名填写错误
		if (elecUser == null) {
			this.addFieldError("error", "用户名输入错误，请重新输入！");
			return "error";
			// 如果有这个用户，再判断密码是否填写的正确
		} else {
			// 如果填写的密码与数据库中对应的密码不一致，则显示错误信息，说明用户密码填写错误
			if (!elecUser.getLogonPwd().equals(
					md5keyBean.getkeyBeanofStr(logonPw))) {
				this.addFieldError("error", "密码输入错误，请重新输入！");
				return "error";
			}
			this.request.getSession().setAttribute("globle_user", elecUser);
			// 如果填写的密码与数据库中对应的密码一致，再判断子用户是否拥有权限
			String popedom = elecUserService.getPopedomByLogonName(logonName);
			// 如果没有权限，则不能进入系统
			if (popedom == null || "".equals(popedom)) {
				this.addFieldError("error", "此用户没有权限！");
				return "error";
			}
			this.request.getSession().setAttribute("globle_popedom", popedom);
			// 再获得用户有哪些角色
			HashMap<String, String> map = elecUserService
					.findUserRoles(logonName);
			this.request.getSession().setAttribute("globle_roles", map);
		}

		// 有权限，则可以进入系统
		return "home";
	}

	public String title() {
		return "title";
	}

	public String left() {
		return "left";
	}

	public String change1() {
		return "change1";
	}

	public String loading() {
		return "loading";
	}

	public String alermJX() {
		return "alermJX";
	}

	public String alermSB() {
		List<ElecCommonMsgForm> list = commonMsgService
				.findElecCommonMsgCurrentDate();
		this.request.setAttribute("comMsg", list);
		return "alermSB";
	}

	public String alermXZ() {
		return "alermXZ";
	}

	public String alermYS() {
		return "alermYS";
	}

	public String alermZD() {
		List<ElecCommonMsgForm> list = commonMsgService
				.findElecCommonMsgCurrentDate();
		this.request.setAttribute("comMsg", list);
		return "alermZD";
	}
	public String logout(){
		//退出的时候需要清空session
		this.request.getSession().invalidate();
		return "logout";
	}
}
