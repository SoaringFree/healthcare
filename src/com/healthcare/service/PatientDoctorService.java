package com.healthcare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.PatientDoctorDao;
import com.healthcare.model.PatientDoctor;

@Service
public class PatientDoctorService {
	
	@Autowired
	private PatientDoctorDao userdoctorDao;
	
	
	/**
	 * 获取某一用户的指定医生信息
	 * @param userId
	 * @return
	 */
	public List<PatientDoctor> getUserDoctors(String userId) {
		List<PatientDoctor> result = null;	
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
	public Boolean assignDoctor(PatientDoctor userDoctor){
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
