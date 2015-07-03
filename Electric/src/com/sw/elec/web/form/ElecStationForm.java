package com.sw.elec.web.form;

import java.io.Serializable;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
public class ElecStationForm implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String stationID;// 主键ID
	private String jctID;// 所属单位（数据字典）
	private String stationCode;// 站点代号
	private String stationName;// 站点名称
	private String jcFrequency;// 安装地点
	private String produceHome;// 生产厂家
	private String contactType;// 通讯方式
	private String useStartDate;// 使用日期
	private String comment;// 备注
	private String isDelete;// 是否删除，0表示未删除，1表示删除
	private String createEmpID;// 创建人
	private String createDate;// 创建日期
	private String lastEmpID;// 修改人
	private String lastDate;// 修改日期
	private String stationType;// 站点类别（数据字典）
	private String attributionGround;// 归属地

	private String searchflag;// 标志位，为0则进入home，为1则进入sitelist

	private String num;// 序号

	private String viewflag;// 表示是编辑页面还是查看页面

	private String names;// 需要导出的属性
	private String fields;// 需要导出的ID

	public String getStationID() {
		return stationID;
	}

	public void setStationID(String stationID) {
		this.stationID = stationID;
	}

	public String getJctID() {
		return jctID;
	}

	public void setJctID(String jctID) {
		this.jctID = jctID;
	}

	public String getStationCode() {
		return stationCode;
	}

	public void setStationCode(String stationCode) {
		this.stationCode = stationCode;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public String getJcFrequency() {
		return jcFrequency;
	}

	public void setJcFrequency(String jcFrequency) {
		this.jcFrequency = jcFrequency;
	}

	public String getProduceHome() {
		return produceHome;
	}

	public void setProduceHome(String produceHome) {
		this.produceHome = produceHome;
	}

	public String getContactType() {
		return contactType;
	}

	public void setContactType(String contactType) {
		this.contactType = contactType;
	}

	public String getUseStartDate() {
		return useStartDate;
	}

	public void setUseStartDate(String useStartDate) {
		this.useStartDate = useStartDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getCreateEmpID() {
		return createEmpID;
	}

	public void setCreateEmpID(String createEmpID) {
		this.createEmpID = createEmpID;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getLastEmpID() {
		return lastEmpID;
	}

	public void setLastEmpID(String lastEmpID) {
		this.lastEmpID = lastEmpID;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public String getStationType() {
		return stationType;
	}

	public void setStationType(String stationType) {
		this.stationType = stationType;
	}

	public String getAttributionGround() {
		return attributionGround;
	}

	public void setAttributionGround(String attributionGround) {
		this.attributionGround = attributionGround;
	}

	public String getSearchflag() {
		return searchflag;
	}

	public void setSearchflag(String searchflag) {
		this.searchflag = searchflag;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getViewflag() {
		return viewflag;
	}

	public void setViewflag(String viewflag) {
		this.viewflag = viewflag;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getFields() {
		return fields;
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

}
