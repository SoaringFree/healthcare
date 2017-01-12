package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 
 * @Title: Department
 * @Description: （医生）科室信息表 
 *
 * @author: 114-FEI
 * @date: 2017年1月9日 上午10:02:26
 *
 */
public class Department extends JavaBean {
	
	@JsonInclude(Include.NON_NULL)
	private String departmentId;
	
	@JsonInclude(Include.NON_NULL)
	private String department;

	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	private Date foundingDate;
	
	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Date getFoundingDate() {
		return foundingDate;
	}

	public void setFoundingDate(Date foundingDate) {
		this.foundingDate = foundingDate;
	}
	
	
}
