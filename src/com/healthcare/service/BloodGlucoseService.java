package com.healthcare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.BloodGlucoseDao;

/**
 * 血糖
 * @Title: BloodGlucoseService
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午4:27:11
 *
 */
@Service
public class BloodGlucoseService {
	
	@Autowired
	private BloodGlucoseDao gluDao;
	
	/**
	 * 分页查询统计
	 */
	public int countGlu(String patientId, String userName, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else if (!"".equals(userName)) {
			filter = " UserName LIKE '%" + userName + "%' AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = gluDao.count(filter);
		
		return count;
	}
	
	/**
	 * 删除血糖数据
	 * @param ids
	 * @return
	 */
	public boolean deleteGlu(long[] ids) {
		
		if (0 < ids.length){
			if (0 < gluDao.delete(ids)) {
				return true;
			}
		}
		return false;
	}
	
	
	/**
	 * 医生或患者获取生理数据时，分页查询统计
	 */
	public int countDoctorPatientGlu(String doctorId, String patientId, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else {
			filter = " PatientId IN (SELECT PatientId FROM ipv6_patient_doctor WHERE DoctorId = '" + doctorId + "') AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = gluDao.count(filter);
		
		return count;
	}	

}
