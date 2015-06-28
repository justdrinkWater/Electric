package com.sw.elec.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
public class ElecAdjust implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String sqlID; // 仪器校准，主键ID
	private String devID; // 设备ID
	private String isAdjust; // 是否校准，0未校准，1已校准
	private Date adjustDate; // 校准日期
	private Date overhaulDate; // 检修日期
	private String isHaving; // 是否检修，0位检修，1已检修
	private String record; // 记录描述
	private String comment; // 备注
	private String isDelete; // 是否删除，0为未删除
	private String createEmpID; // 创建人
	private Date createDate; // 创建日期
	private String lastEmpID; // 修改人
	private Date lastDate; // 修改日期

	public String getSqlID() {
		return sqlID;
	}

	public void setSqlID(String sqlID) {
		this.sqlID = sqlID;
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

	public Date getAdjustDate() {
		return adjustDate;
	}

	public void setAdjustDate(Date adjustDate) {
		this.adjustDate = adjustDate;
	}

	public Date getOverhaulDate() {
		return overhaulDate;
	}

	public void setOverhaulDate(Date overhaulDate) {
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getLastEmpID() {
		return lastEmpID;
	}

	public void setLastEmpID(String lastEmpID) {
		this.lastEmpID = lastEmpID;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

}
