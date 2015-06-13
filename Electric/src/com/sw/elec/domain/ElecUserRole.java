package com.sw.elec.domain;

import java.io.Serializable;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
@SuppressWarnings("serial")
public class ElecUserRole implements Serializable {
	private int seqID; // 主键
	private String userID; // 用户ID
	private String roleID; // 角色ID
	private String remark; // 备注

	public int getSeqID() {
		return seqID;
	}

	public void setSeqID(int seqID) {
		this.seqID = seqID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getRoleID() {
		return roleID;
	}

	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
