package com.healthcare.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 
 * @Title: DoctorInfo
 * @Description: 医生信息表 
 *
 * @author: 114-FEI
 * @date: 2017年1月9日 上午9:59:40
 *
 */
public class DoctorInfo extends JavaBean {
	
	/**
	 * 医生用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String doctorId;
	
	/**
	 * 职称
	 */
	@JsonInclude(Include.NON_NULL)
	private String professional;
	
	/**
	 * 是否专家
	 */
	@JsonInclude(Include.NON_NULL)
	private String expert;
	
	/**
	 * 科室编号
	 */
	@JsonInclude(Include.NON_NULL)
	private String departmentId;
	
	/**
	 * 简介
	 */
	@JsonInclude(Include.NON_NULL)
	private String brief;
	
	/**
	 * 专长
	 */
	@JsonInclude(Include.NON_NULL)
	private String speciality;
	
	/**
	 * 医生姓名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userName;
	
	/**
	 * 科室
	 */
	@JsonInclude(Include.NON_NULL)
	private String department;
	

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public String getExpert() {
		return expert;
	}

	public void setExpert(String expert) {
		this.expert = expert;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
}
