package com.healthcare.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.healthcare.model.base.JavaBean;

/**
 * 
 * @Title: UserInfo
 * @Description: 用户基本信息表
 *
 * @author: 114-FEI
 * @date: 2017年1月9日 上午10:02:49
 *
 */
public class UserInfo extends JavaBean {
	
	/**
	 * 用户名
	 */
	@JsonInclude(Include.NON_NULL)
	private String userId;
	
	/**
	 * 性别 1/0/2
	 */
	@JsonInclude(Include.NON_NULL)
	private String sex;
	
	/**
	 * 出生日期
	 */
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	private Date birthday;
	
	/**
	 * 名族
	 */
	@JsonInclude(Include.NON_NULL)
	private String nation;
	
	/**
	 * 身份证号码
	 */
	@JsonInclude(Include.NON_NULL)
	private String identity;
	
	/**
	 * 备用电话
	 */
	@JsonInclude(Include.NON_NULL)
	private String backupPhone;
	
	/**
	 * 邮箱
	 */
	@JsonInclude(Include.NON_NULL)
	private String email;
	
	/**
	 * 地址
	 */
	@JsonInclude(Include.NON_NULL)
	private String address;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getBackupPhone() {
		return backupPhone;
	}

	public void setBackupPhone(String backupPhone) {
		this.backupPhone = backupPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
