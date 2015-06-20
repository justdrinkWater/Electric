package com.sw.elec.web.form;

import java.io.File;
import java.io.Serializable;

/**
 * @author sunwei
 *
 */
@SuppressWarnings("serial")
public class ElecUserForm implements Serializable {

	private String userID; // 主键ID
	private String jctID; // 所属单位code
	private String userName; // 用户姓名
	private String logonName; // 登录名
	private String logonPwd; // 密码
	private String sexID; // 性别
	private String birthday; // 出生日期
	private String address; // 联系地址
	private String contactTel; // 联系电话
	private String email; // 电子邮箱
	private String mobile; // 手机
	private String isDuty; // 是否在职
	private String onDutyDate; // 入职时间
	private String offDutyDate; // 离职时间
	private String remark; // 备注

	private String viewflag;

	private String flag;// 表示是否拥有这个权限

	private String md5Flag;// 表示是否需要对这个密码进行加密，因为在编辑用户的时候不需要再次进行加密

	private String roleflag;// 用于判断当前的用户是否是系统管理员或者是高级管理员,当为1时，表示不是，为空则是

	private File file;// 导入excel的文件

	private String fileExtension;// 文件的扩展名，struct2上传文件会只会将文件变成文件输入流，所以无法获得文件的后缀名

	public String getFileExtension() {
		return fileExtension;
	}

	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getJctID() {
		return jctID;
	}

	public void setJctID(String jctID) {
		this.jctID = jctID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLogonName() {
		return logonName;
	}

	public void setLogonName(String logonName) {
		this.logonName = logonName;
	}

	public String getLogonPwd() {
		return logonPwd;
	}

	public void setLogonPwd(String logonPwd) {
		this.logonPwd = logonPwd;
	}

	public String getSexID() {
		return sexID;
	}

	public void setSexID(String sexID) {
		this.sexID = sexID;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getIsDuty() {
		return isDuty;
	}

	public void setIsDuty(String isDuty) {
		this.isDuty = isDuty;
	}

	public String getOnDutyDate() {
		return onDutyDate;
	}

	public void setOnDutyDate(String onDutyDate) {
		this.onDutyDate = onDutyDate;
	}

	public String getOffDutyDate() {
		return offDutyDate;
	}

	public void setOffDutyDate(String offDutyDate) {
		this.offDutyDate = offDutyDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getViewflag() {
		return viewflag;
	}

	public void setViewflag(String viewflag) {
		this.viewflag = viewflag;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getMd5Flag() {
		return md5Flag;
	}

	public void setMd5Flag(String md5Flag) {
		this.md5Flag = md5Flag;
	}

	public String getRoleflag() {
		return roleflag;
	}

	public void setRoleflag(String roleflag) {
		this.roleflag = roleflag;
	}

}
