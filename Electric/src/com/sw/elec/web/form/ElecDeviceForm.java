package com.sw.elec.web.form;

import java.io.Serializable;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
public class ElecDeviceForm implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String devID; // 主键ID
	private String devPlanID; // 外键ID，计划ID
	private String isDelete; // 是否删除，0表示正常
	private String createEmpID; // 创建人
	private String createDate; // 创建时间
	private String lastEmpID; // 修改人
	private String lastDate; // 修改时间
	private String apState; // 是否校准（0未校准，1已校准）
	private String opState; // 是否检修（0未检修，1已检修）

	// 这是编辑和添加页面需要的属性
	private String devName; // 设备名称
	private String jctID; // 所属单位（数据字典）
	private String devType; // 设备类型（数据字典）
	private String quality; // 数量
	private String qunit; // 数量单位
	private String devExpense; // 金额
	private String configure; // 配置
	private String specType; // 规格型号
	private String trademark; // 品牌
	private String devState; // 状态（数据字典）
	private String produceHome; // 厂家
	private String produceArea;// 产地
	private String useness; // 用途
	private String useUnit; // 使用单位
	private String overhaulPeriod;// 检修周期（数字）
	private String opUnit; // 检修周期单位（数据字典）
	private String useDate; // 使用日期
	private String adjustPeriod;// 校准周期（数字）
	private String apUnit; // 校准周期单位（数据字典）
	private String runDescribe;// 运行情况描述
	private String comment; // 备注

	private String searchFlag;// 表示是否是查询，为1表示是查询

	private String viewflag;// 表示是否是查看(1)还是编辑

	private String num;// 序号

	private String names;// 需要导出的属性

	private String fields;// 选择需要导出的id

	private String useDatef;// 使用时间的上界限

	private String useDatet;// 下界限

	public String getDevID() {
		return devID;
	}

	public void setDevID(String devID) {
		this.devID = devID;
	}

	public String getDevPlanID() {
		return devPlanID;
	}

	public void setDevPlanID(String devPlanID) {
		this.devPlanID = devPlanID;
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

	public String getApState() {
		return apState;
	}

	public void setApState(String apState) {
		this.apState = apState;
	}

	public String getOpState() {
		return opState;
	}

	public void setOpState(String opState) {
		this.opState = opState;
	}

	public String getDevName() {
		return devName;
	}

	public void setDevName(String devName) {
		this.devName = devName;
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

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public String getQunit() {
		return qunit;
	}

	public void setQunit(String qunit) {
		this.qunit = qunit;
	}

	public String getDevExpense() {
		return devExpense;
	}

	public void setDevExpense(String devExpense) {
		this.devExpense = devExpense;
	}

	public String getConfigure() {
		return configure;
	}

	public void setConfigure(String configure) {
		this.configure = configure;
	}

	public String getSpecType() {
		return specType;
	}

	public void setSpecType(String specType) {
		this.specType = specType;
	}

	public String getTrademark() {
		return trademark;
	}

	public void setTrademark(String trademark) {
		this.trademark = trademark;
	}

	public String getDevState() {
		return devState;
	}

	public void setDevState(String devState) {
		this.devState = devState;
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

	public String getUseUnit() {
		return useUnit;
	}

	public void setUseUnit(String useUnit) {
		this.useUnit = useUnit;
	}

	public String getOverhaulPeriod() {
		return overhaulPeriod;
	}

	public void setOverhaulPeriod(String overhaulPeriod) {
		this.overhaulPeriod = overhaulPeriod;
	}

	public String getOpUnit() {
		return opUnit;
	}

	public void setOpUnit(String opUnit) {
		this.opUnit = opUnit;
	}

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

	public String getAdjustPeriod() {
		return adjustPeriod;
	}

	public void setAdjustPeriod(String adjustPeriod) {
		this.adjustPeriod = adjustPeriod;
	}

	public String getApUnit() {
		return apUnit;
	}

	public void setApUnit(String apUnit) {
		this.apUnit = apUnit;
	}

	public String getRunDescribe() {
		return runDescribe;
	}

	public void setRunDescribe(String runDescribe) {
		this.runDescribe = runDescribe;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getSearchFlag() {
		return searchFlag;
	}

	public void setSearchFlag(String searchFlag) {
		this.searchFlag = searchFlag;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
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

	public String getViewflag() {
		return viewflag;
	}

	public void setViewflag(String viewflag) {
		this.viewflag = viewflag;
	}

	public String getUseDatef() {
		return useDatef;
	}

	public void setUseDatef(String useDatef) {
		this.useDatef = useDatef;
	}

	public String getUseDatet() {
		return useDatet;
	}

	public void setUseDatet(String useDatet) {
		this.useDatet = useDatet;
	}

}
