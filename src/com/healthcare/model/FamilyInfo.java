package com.healthcare.model;

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

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	
	
}
