package com.sw.elec.domain;

import java.io.Serializable;

/**
 * PO持久层对象，对于数据表
 * 
 * @author sunwei
 *
 */
public class ElecDictionary implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * SeqID INT NOT NULL, #主键ID(自增长) Keyword VARCHAR(20) NULL, #查询关键字 DdlCode
	 * INT NULL, #数据字典的code DdlName VARCHAR(50) NULL #数据字典的value
	 */

	private int seqID;// 主键ID(自增长)
	private String keyword;// 查询关键字
	private int ddlCode;// 数据字典的code
	private String ddlName;// 数据字典的value

	public int getSeqID() {
		return seqID;
	}

	public void setSeqID(int seqID) {
		this.seqID = seqID;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getDdlCode() {
		return ddlCode;
	}

	public void setDdlCode(int ddlCode) {
		this.ddlCode = ddlCode;
	}

	public String getDdlName() {
		return ddlName;
	}

	public void setDdlName(String ddlName) {
		this.ddlName = ddlName;
	}

}
