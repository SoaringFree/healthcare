package com.healthcare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.BloodOxygenDao;

/**
 * 血氧
 * @Title: BloodOxygenService
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午4:52:05
 *
 */
@Service
public class BloodOxygenService {
	
	@Autowired
	private BloodOxygenDao spo2Dao;
	
	/**
	 * 分页查询统计
	 */
	public int countSpo2(String patientId, String userName, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else if (!"".equals(userName)) {
			filter = " UserName LIKE '%" + userName + "%' AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = spo2Dao.count(filter);
		
		return count;
	}
	
	/**
	 * 删除血氧数据
	 * @param ids
	 * @return
	 */
	public boolean deleteSpo2(long[] ids) {
		
		if (0 < ids.length){
			if (0 < spo2Dao.delete(ids)) {
				return true;
			}
		}
		return false;
	}
	
	
	/**
	 * 医生或患者获取生理数据时，分页查询统计
	 */
	public int countDoctorPatientSpo2(String doctorId, String patientId, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else {
			filter = " PatientId IN (SELECT PatientId FROM ipv6_patient_doctor WHERE DoctorId = '" + doctorId + "') AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = spo2Dao.count(filter);
		
		return count;
	}	

}
