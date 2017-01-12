package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 
 * @Title: UserDoctor
 * @Description: 用户 - 医生表 
 *
 * @author: 114-FEI
 * @date: 2017年1月9日 上午10:00:21
 *
 */
public class UserDoctor extends JavaBean {
	
	/**
	 * 患者用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userId;
	
	/**
	 * 医生用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String doctorId;
	
	/**
	 * 指定时间
	 */
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date bindDate;

	
	/************************** 存储过程结果集包含 ************************/
	
	/**
	 * 医生姓名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userName;
	
	/**
	 * 职称
	 */
	@JsonInclude(Include.NON_NULL)
	private String professional; 
	
	/**
	 * 科室编号
	 */
	@JsonInclude(Include.NON_NULL)
	private String departmentId;
	
	/**
	 * 科室名
	 */
	@JsonInclude(Include.NON_NULL)
	private String department;
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}

	public Date getBindDate() {
		return bindDate;
	}

	public void setBindDate(Date bindDate) {
		this.bindDate = bindDate;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

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
	
	
}
