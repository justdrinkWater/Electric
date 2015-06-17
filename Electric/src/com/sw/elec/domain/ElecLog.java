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
public class ElecLog implements Serializable {
	/**
	 * LogID VARCHAR(50) NOT NULL, #主键ID IpAddress VARCHAR(50), #IP地址 OpeName
	 * VARCHAR(50), #操作人 OpeTime DATETIME, #操作时间 Details VARCHAR(500) #操作明细
	 */

	private String logID; // 主键ID
	private String ipAddress; // IP地址
	private String opeName; // 操作人
	private Date opeTime; // 操作时间
	private String details; // 操作明细

	public String getLogID() {
		return logID;
	}

	public void setLogID(String logID) {
		this.logID = logID;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getOpeName() {
		return opeName;
	}

	public void setOpeName(String opeName) {
		this.opeName = opeName;
	}

	public Date getOpeTime() {
		return opeTime;
	}

	public void setOpeTime(Date opeTime) {
		this.opeTime = opeTime;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}
}
