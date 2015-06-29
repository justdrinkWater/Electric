package com.sw.elec.web.form;

import java.io.Serializable;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
public class ElecAdjustForm implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String seqID; // 仪器校准，主键ID
	private String devID; // 设备ID，外键
	private String isAdjust; // 是否校准，0未校准，1已校准
	private String adjustDate; // 校准日期
	private String overhaulDate; // 检修日期
	private String isHaving; // 是否有记录，0没有记录，1有记录
	private String record; // 记录描述
	private String comment; // 备注
	private String isDelete; // 是否删除，0为未删除
	private String createEmpID; // 创建人
	private String createDate; // 创建日期
	private String lastEmpID; // 修改人
	private String lastDate; // 修改日期

	private String num;// 序号

	private String searchFlag;// 表示是否是点击首页进来的

	private String viewflag;// 是否可以编辑，1为不可以编辑
	// 页面需要的属性
	private String devName;// 设备名
	private String adjustPeriod;// 校准周期
	private String useDate;// 使用日期
	private String jctID; // 所属单位
	private String devType; // 设备类型
	private String isHaveRecord;

	private String names;// 需要导出的属性
	private String fields;// 选择需要导出的id

	private String startDatef;// 校准时间的开始时间
	private String startDatet;// 校准时间的截止时间

	public String getSeqID() {
		return seqID;
	}

	public void setSeqID(String seqID) {
		this.seqID = seqID;
	}

	public String getDevID() {
		return devID;
	}

	public void setDevID(String devID) {
		this.devID = devID;
	}

	public String getIsAdjust() {
		return isAdjust;
	}

	public void setIsAdjust(String isAdjust) {
		this.isAdjust = isAdjust;
	}

	public String getAdjustDate() {
		return adjustDate;
	}

	public void setAdjustDate(String adjustDate) {
		this.adjustDate = adjustDate;
	}

	public String getOverhaulDate() {
		return overhaulDate;
	}

	public void setOverhaulDate(String overhaulDate) {
		this.overhaulDate = overhaulDate;
	}

	public String getIsHaving() {
		return isHaving;
	}

	public void setIsHaving(String isHaving) {
		this.isHaving = isHaving;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
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

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getSearchFlag() {
		return searchFlag;
	}

	public void setSearchFlag(String searchFlag) {
		this.searchFlag = searchFlag;
	}

	public String getDevName() {
		return devName;
	}

	public void setDevName(String devName) {
		this.devName = devName;
	}

	public String getAdjustPeriod() {
		return adjustPeriod;
	}

	public void setAdjustPeriod(String adjustPeriod) {
		this.adjustPeriod = adjustPeriod;
	}

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

	public String getJctID() {
		return jctID;
	}

	public void setJctID(String jctID) {
		this.jctID = jctID;
	}

	public String getDevType() {
		return devType;
	}

	public void setDevType(String devType) {
		this.devType = devType;
	}

	public String getIsHaveRecord() {
		return isHaveRecord;
	}

	public void setIsHaveRecord(String isHaveRecord) {
		this.isHaveRecord = isHaveRecord;
	}

	public String getStartDatef() {
		return startDatef;
	}

	public void setStartDatef(String startDatef) {
		this.startDatef = startDatef;
	}

	public String getStartDatet() {
		return startDatet;
	}

	public void setStartDatet(String startDatet) {
		this.startDatet = startDatet;
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
