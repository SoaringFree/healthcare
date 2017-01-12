package com.healthcare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.UserDoctorDao;
import com.healthcare.model.UserDoctor;

@Service
public class UserDoctorService {
	
	@Autowired
	private UserDoctorDao userdoctorDao;
	
	
	/**
	 * 获取某一用户的指定医生信息
	 * @param userId
	 * @return
	 */
	public List<UserDoctor> getUserDoctors(String userId) {
		List<UserDoctor> result = null;	
		if (!"".equals(userId)) {
			String filter = String.format(" UserId='%s' ", userId);
			result = userdoctorDao.list(filter);
		}
		return result;
	}
}
