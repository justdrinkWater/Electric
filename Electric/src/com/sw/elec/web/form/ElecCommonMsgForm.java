package com.sw.elec.web.form;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ElecCommonMsgForm implements Serializable {
	private String stationRun; // 站点运行情况

	private String devRun; // 设备运行情况

	private String createDate; // 创建日期

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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

}
