package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 获取某个医生的患者信息
 * @Title: DoctorPatient
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月4日 上午11:24:07
 *
 */
public class DoctorPatient extends JavaBean {
	
	/**
	 * 患者用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String patientId;
	
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
	 * 患者姓名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userName;


	public String getPatientId() {
		return patientId;
	}


	public void setPatientId(String patientId) {
		this.patientId = patientId;
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
	

}
