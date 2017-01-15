package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 
 * @Title: FamilyInfo
 * @Description: 亲属信息表 
 *
 * @author: 114-FEI
 * @date: 2017年1月9日 上午10:03:16
 *
 */
public class FamilyInfo extends JavaBean {
	
	/**
	 * 亲属用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String familyId;
	
	/**
	 * 患者用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userId;
	
	/**
	 * 关系
	 */
	@JsonInclude(Include.NON_NULL)
	private String relationship;
	
	/**
	 * 指定时间
	 */
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date bindDate;
	
	
	/************************** 存储过程结果集包含 ************************/
	/**
	 * 亲属姓名
	 */
	@JsonInclude(Include.NON_NULL)
	private String familyName;
	

	public String getFamilyId() {
		return familyId;
	}

	public void setFamilyId(String familyId) {
		this.familyId = familyId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRelationship() {
		return relationship;
	}

	public Date getBindDate() {
		return bindDate;
	}

	public void setBindDate(Date bindDate) {
		this.bindDate = bindDate;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	
	
}
