package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 
 * @Title: BloodOxygen
 * @Description: 血氧信息表 
 *
 * @author: 114-FEI
 * @date: 2017年1月9日 上午10:06:05
 *
 */
public class BloodOxygen extends JavaBean {

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
	 * 血氧
	 */
	@JsonInclude(Include.NON_NULL)
	private String bloodoxygen;
	
	/**
	 * 脉率
	 */
	@JsonInclude(Include.NON_NULL)
	private String pulseRate;
	
	/**
	 * 血氧容积波
	 */
	@JsonInclude(Include.NON_NULL)
	private String volumeWave;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
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

	public String getBloodoxygen() {
		return bloodoxygen;
	}

	public void setBloodoxygen(String bloodoxygen) {
		this.bloodoxygen = bloodoxygen;
	}

	public String getPulseRate() {
		return pulseRate;
	}

	public void setPulseRate(String pulseRate) {
		this.pulseRate = pulseRate;
	}

	public String getVolumeWave() {
		return volumeWave;
	}

	public void setVolumeWave(String volumeWave) {
		this.volumeWave = volumeWave;
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
