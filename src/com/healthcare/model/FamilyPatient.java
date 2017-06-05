package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 亲属 -> 患者
 * @Title: FamilyInfo
 * @Description: 亲属信息表 
 *
 * @author: 114-FEI
 * @date: 2017年1月9日 上午10:03:16
 *
 */
public class FamilyPatient extends JavaBean {
	
	/**
	 * 亲属用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String familyId;
	
	/**
	 * 患者用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String patientId;
	
	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

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
	 * 患者姓名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userName;
	

	public String getFamilyId() {
		return familyId;
	}

	public void setFamilyId(String familyId) {
		this.familyId = familyId;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
}
