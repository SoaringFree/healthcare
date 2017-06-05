package com.healthcare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.BloodPressureDao;

/**
 * 
 * @Title: BloodPressureService
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午5:06:04
 *
 */
@Service
public class BloodPressureService {

	@Autowired
	private BloodPressureDao bpDao;
	
	/**
	 * 分页查询统计
	 */
	public int countBp(String patientId, String userName, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else if (!"".equals(userName)) {
			filter = " UserName LIKE '%" + userName + "%' AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = bpDao.count(filter);
		
		return count;
	}
	
	/**
	 * 删除血压数据
	 * @param ids
	 * @return
	 */
	public boolean deleteBp(long[] ids) {
		
		if (0 < ids.length){
			if (0 < bpDao.delete(ids)) {
				return true;
			}
		}
		return false;
	}
	
	
	/**
	 * 医生或患者获取生理数据时，分页查询统计
	 */
	public int countDoctorPatientBp(String doctorId, String patientId, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else {
			filter = " PatientId IN (SELECT PatientId FROM ipv6_patient_doctor WHERE DoctorId = '" + doctorId + "') AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = bpDao.count(filter);
		
		return count;
	}	
	
	/**
	 * 亲属获取生理数据时，分页查询统计
	 */
	public int countFamilyPatientBp(String familyId, String patientId, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else {
			filter = " PatientId IN (SELECT PatientId FROM ipv6_patient_family WHERE FamilyId = '" + familyId + "') AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = bpDao.count(filter);
		
		return count;
	}	
	
}
