package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 
 * @Title: BloodPressure
 * @Description: 血压信息表
 * 
 * @author: 114-FEI
 * @date: 2017年1月9日 上午10:04:17
 * 
 */
public class BloodPressure extends JavaBean {

	/**
	 * 用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userId;

	/**
	 * 设备mac地址
	 */
	@JsonInclude(Include.NON_NULL)
	private String deviceMac;

	/**
	 * 收缩压
	 */
	@JsonInclude(Include.NON_NULL)
	private String systolicPressure;

	/**
	 * 舒张压
	 */
	@JsonInclude(Include.NON_NULL)
	private String diastolicPressure;

	/**
	 * 平均压
	 */
	@JsonInclude(Include.NON_NULL)
	private String meanPressure;

	/**
	 * 脉率
	 */
	@JsonInclude(Include.NON_NULL)
	private String pulseRate;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date measureDate;

	/**
	 * 用户姓名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userName;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDeviceMac() {
		return deviceMac;
	}

	public void setDeviceMac(String deviceMac) {
		this.deviceMac = deviceMac;
	}

	public String getSystolicPressure() {
		return systolicPressure;
	}

	public void setSystolicPressure(String systolicPressure) {
		this.systolicPressure = systolicPressure;
	}

	public String getDiastolicPressure() {
		return diastolicPressure;
	}

	public void setDiastolicPressure(String diastolicPressure) {
		this.diastolicPressure = diastolicPressure;
	}

	public String getMeanPressure() {
		return meanPressure;
	}

	public void setMeanPressure(String meanPressure) {
		this.meanPressure = meanPressure;
	}

	public String getPulseRate() {
		return pulseRate;
	}

	public void setPulseRate(String pulseRate) {
		this.pulseRate = pulseRate;
	}

	public Date getMeasureDate() {
		return measureDate;
	}

	public void setMeasureDate(Date measureDate) {
		this.measureDate = measureDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
