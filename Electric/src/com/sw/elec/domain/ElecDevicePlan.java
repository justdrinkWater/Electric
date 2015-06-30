package com.sw.elec.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
@SuppressWarnings("serial")
public class ElecDevicePlan implements Serializable {

	private String devPlanID;// 购置计划ID，主键ID
	private String jctID;// 所属单位code（对应数据字典）
	private String devName;// 计划购置设备名称
	private String devType;// 设备类型code（对应数据字典）
	private String trademark;// 品牌
	private String specType;// 规格型号
	private String produceHome;// 厂家
	private String produceArea;// 产地
	private String useness;// 用途有
	private String quality;// 数量
	private String useUnit;// 使用单位
	private double devExpense;// 金额
	private Date planDate;// 计划时间
	private String adjustPeriod;// 校准周期
	private String overhaulPeriod;// 检修周期
	private String configure;// 配置
	private String comment;// 备注
	private String purchaseState;// 购买状态，0表示计划购买，1表示已购买
	private String isDelete;// 是否删除，0表示未删除，1表示已删除
	private String createEmpID;// 创建人ID
	private Date createDate;// 创建时间
	private String lastEmpID;// 修改人ID
	private Date lastDate;// 修改时间
	private String qUnit;// 数量单位
	private String aPUnit;// 校准周期单位
	private String oPUnit;// 检修周期单位

	public String getDevPlanID() {
		return devPlanID;
	}

	public void setDevPlanID(String devPlanID) {
		this.devPlanID = devPlanID;
	}

	public String getJctID() {
		return jctID;
	}

	public void setJctID(String jctID) {
		this.jctID = jctID;
	}

	public String getDevName() {
		return devName;
	}

	public void setDevName(String devName) {
		this.devName = devName;
	}

	public String getDevType() {
		return devType;
	}

	public void setDevType(String devType) {
		this.devType = devType;
	}

	public String getTrademark() {
		return trademark;
	}

	public void setTrademark(String trademark) {
		this.trademark = trademark;
	}

	public String getSpecType() {
		return specType;
	}

	public void setSpecType(String specType) {
		this.specType = specType;
	}

	public String getProduceHome() {
		return produceHome;
	}

	public void setProduceHome(String produceHome) {
		this.produceHome = produceHome;
	}

	public String getProduceArea() {
		return produceArea;
	}

	public void setProduceArea(String produceArea) {
		this.produceArea = produceArea;
	}

	public String getUseness() {
		return useness;
	}

	public void setUseness(String useness) {
		this.useness = useness;
	}

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public String getUseUnit() {
		return useUnit;
	}

	public void setUseUnit(String useUnit) {
		this.useUnit = useUnit;
	}

	public double getDevExpense() {
		return devExpense;
	}

	public void setDevExpense(double devExpense) {
		this.devExpense = devExpense;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public String getAdjustPeriod() {
		return adjustPeriod;
	}

	public void setAdjustPeriod(String adjustPeriod) {
		this.adjustPeriod = adjustPeriod;
	}

	public String getOverhaulPeriod() {
		return overhaulPeriod;
	}

	public void setOverhaulPeriod(String overhaulPeriod) {
		this.overhaulPeriod = overhaulPeriod;
	}

	public String getConfigure() {
		return configure;
	}

	public void setConfigure(String configure) {
		this.configure = configure;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPurchaseState() {
		return purchaseState;
	}

	public void setPurchaseState(String purchaseState) {
		this.purchaseState = purchaseState;
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

	public String getqUnit() {
		return qUnit;
	}

	public void setqUnit(String qUnit) {
		this.qUnit = qUnit;
	}

	public String getaPUnit() {
		return aPUnit;
	}

	public void setaPUnit(String aPUnit) {
		this.aPUnit = aPUnit;
	}

	public String getoPUnit() {
		return oPUnit;
	}

	public void setoPUnit(String oPUnit) {
		this.oPUnit = oPUnit;
	}

}
