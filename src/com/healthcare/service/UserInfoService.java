package com.healthcare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.UserInfoDao;
import com.healthcare.model.UserInfo;

@Service
public class UserInfoService {
	
	@Autowired
	private UserInfoDao userinfoDao;
	
	
	/**
	 * 通过数据id获取用户基本信息
	 * @param id
	 * @return
	 */
	public UserInfo getUserInfoByUserId(String userid) {
		UserInfo userinfo = null;
		List<UserInfo> infolist = null;
		if (!"".equals(userid)) {
			String filter = String.format(" UserId='%s' ", userid);
			infolist = userinfoDao.list(filter);
			if (!infolist.isEmpty()) {
				userinfo = infolist.get(0);
			}
		}
		
		return userinfo;
	}
	
	
	/**
	 * 添加/修改用户基本信息
	 * @param userinfo
	 * @return
	 */
	public Boolean editUserInfo(UserInfo userinfo) {
		long result = 0;
		if (0 <= userinfo.getId()) {
			result = userinfoDao.save(userinfo);
		} 
		
		if (0 < result) {
			return true;
		} else {
			return false;
		}
	}
	
}
