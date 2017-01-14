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
	
	/**
	 * 统计某一医生的患者数量
	 * @param doctorId
	 * @return
	 */
	public int countDoctorUsers(String doctorId) {
		int count = 0;
		if (!"".equals(doctorId)) {
			String filter = String.format(" DoctorId='%s' ", doctorId);
			count = userdoctorDao.count(filter);
		}
		return count;
	}
	
	/**
	 * 为患者指定医生
	 * @param userDoctor
	 * @return
	 */
	public Boolean assignDoctor(UserDoctor userDoctor){
		Boolean flag = false;
		if (0 < userdoctorDao.save(userDoctor))
			flag = true;
		return flag;
	}
	
	/**
	 * 删除用户的指定医生
	 * @param id
	 * @return
	 */
	public Boolean deleteDoctor(int id) {
		Boolean flag = false;
		if (0 < id) {
			if (0 < userdoctorDao.delete(id)) {
				flag = true;
			}
		}
		return flag;
	}
}
