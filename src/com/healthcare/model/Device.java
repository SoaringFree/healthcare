package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

public class Device extends JavaBean {
	
	/**
	 * 用户ID
	 */
	@JsonInclude(Include.NON_NULL)
	private String patientId;
	
	/**
	 * 设备类型
	 */
	@JsonInclude(Include.NON_NULL)
	private int deviceType;

	/**
	 * 设备MAC地址
	 */
	@JsonInclude(Include.NON_NULL)
	private String deviceMac;
	
	/**
	 * 设备名称
	 */
	@JsonInclude(Include.NON_NULL)
	private String deviceName;
	
	/**
	 * 注册时间
	 */
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date registDate;
	
	/**
	 * 用户姓名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public int getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(int deviceType) {
		this.deviceType = deviceType;
	}

	public String getDeviceMac() {
		return deviceMac;
	}

	public void setDeviceMac(String deviceMac) {
		this.deviceMac = deviceMac;
	}

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
		
}
