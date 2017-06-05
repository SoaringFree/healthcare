package com.healthcare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.ElectrocardiogramDao;
import com.healthcare.model.Electrocardiogram;

/**
 * 
 * @Title: ElectrocardiogramService
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年5月24日 下午3:26:56
 *
 */
@Service
public class ElectrocardiogramService {

	@Autowired
	private ElectrocardiogramDao ecgDao;

	/**
	 * 分页查询统计
	 */
	public int countEcg(String patientId, String userName, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else if (!"".equals(userName)) {
			filter = " UserName LIKE '%" + userName + "%' AND ";
		}
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = ecgDao.count(filter);
		
		return count;
	}	
	
	/**
	 * 获取单条ECG数据
	 * @param id
	 * @return
	 */
	public Electrocardiogram getEcg(int id) {
		if (0 < id) {
			return ecgDao.get(id);
		} else {
			return null;
		}
	}
	
	/**
	 * 删除血压数据
	 * @param ids
	 * @return
	 */
	public boolean deleteEcg(long[] ids) {
		
		if (0 < ids.length){
			if (0 < ecgDao.delete(ids)) {
				return true;
			}
		}
		return false;
	}
	
	
	/**
	 * 医生或患者获取生理数据时，分页查询统计
	 */
	public int countDoctorPatientEcg(String doctorId, String patientId, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else {
			filter = " PatientId IN (SELECT PatientId FROM ipv6_patient_doctor WHERE DoctorId = '" + doctorId + "') AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = ecgDao.count(filter);
		
		return count;
	}	
	
	/**
	 * 亲属获取生理数据时，分页查询统计
	 */
	public int countFamilyPatientEcg(String familyId, String patientId, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else {
			filter = " PatientId IN (SELECT PatientId FROM ipv6_patient_family WHERE FamilyId = '" + familyId + "') AND ";
		}
		
		filter += " MeasureDate >= '" +startTime + "' AND MeasureDate <= '" +  endTime + "' ";
		count = ecgDao.count(filter);
		
		return count;
	}	
	
}
