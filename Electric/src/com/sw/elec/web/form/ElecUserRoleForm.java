package com.sw.elec.web.form;

import java.io.Serializable;

/**
 * @author sunwei
 *
 */
@SuppressWarnings("serial")
public class ElecUserRoleForm implements Serializable {
	private String role;
	private String roleid;
	private String[] selectoper;// 权限编号
	private String[] selectuser;// 用户ID

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String[] getSelectoper() {
		return selectoper;
	}

	public void setSelectoper(String[] selectoper) {
		this.selectoper = selectoper;
	}

	public String[] getSelectuser() {
		return selectuser;
	}

	public void setSelectuser(String[] selectuser) {
		this.selectuser = selectuser;
	}

}
