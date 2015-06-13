package com.sw.elec.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
public class ElecCommonMsg implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String comID;// 主键ID
	private String stationRun;// 站点运行情况
	private String devRun;// 设备运行情况
	private Date createDate;// 创建日期

	public String getComID() {
		return comID;
	}

	public void setComID(String comID) {
		this.comID = comID;
	}

	public String getStationRun() {
		return stationRun;
	}

	public void setStationRun(String stationRun) {
		this.stationRun = stationRun;
	}

	public String getDevRun() {
		return devRun;
	}

	public void setDevRun(String devRun) {
		this.devRun = devRun;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
