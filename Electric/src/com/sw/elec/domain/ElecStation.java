package com.sw.elec.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
public class ElecStation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String stationID;// 主键ID
	private String jctID;// 所属单位（数据字典）
	private String stationCode;// 站点代号
	private String stationName;// 站点名称
	private String jCFrequency;// 安装地点
	private String produceHome;// 生产厂家
	private String contactType;// 通讯方式
	private Date useStartDate;// 使用日期
	private String comment;// 备注
	private String isDelete;// 是否删除，0表示未删除，1表示删除
	private String createEmpID;// 创建人
	private Date createDate;// 创建日期
	private String lastEmpID;// 修改人
	private Date lastDate;// 修改日期
	private String stationType;// 站点类别
	private String attributionGround;// 归属地

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

	public String getjCFrequency() {
		return jCFrequency;
	}

	public void setjCFrequency(String jCFrequency) {
		this.jCFrequency = jCFrequency;
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

	public Date getUseStartDate() {
		return useStartDate;
	}

	public void setUseStartDate(Date useStartDate) {
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

}
