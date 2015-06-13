package com.sw.elec.web.form;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ElecDictionaryForm implements Serializable {
	/*
	 * SeqID INT NOT NULL, #主键ID(自增长) Keyword VARCHAR(20) NULL, #查询关键字 DdlCode
	 * INT NULL, #数据字典的code DdlName VARCHAR(50) NULL #数据字典的value
	 */

	private String sqlID;
	private String keyword;
	private String ddlCode;
	private String ddlName;
	private String keywordname;
	private String typeflag;
	private String[] itemname;

	public String getSqlID() {
		return sqlID;
	}

	public void setSqlID(String sqlID) {
		this.sqlID = sqlID;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDdlCode() {
		return ddlCode;
	}

	public void setDdlCode(String ddlCode) {
		this.ddlCode = ddlCode;
	}

	public String getDdlName() {
		return ddlName;
	}

	public void setDdlName(String ddlName) {
		this.ddlName = ddlName;
	}

	public String getKeywordname() {
		return keywordname;
	}

	public void setKeywordname(String keywordname) {
		this.keywordname = keywordname;
	}

	public String getTypeflag() {
		return typeflag;
	}

	public void setTypeflag(String typeflag) {
		this.typeflag = typeflag;
	}

	public String[] getItemname() {
		return itemname;
	}

	public void setItemname(String[] itemname) {
		this.itemname = itemname;
	}

}
