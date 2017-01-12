package com.healthcare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.DoctorInfoDao;
import com.healthcare.model.DoctorInfo;

@Service
public class DoctorInfoService {
	
	@Autowired
	private DoctorInfoDao doctorinfoDao;
	
	
	/**
	 * 新增/修改 医生信息
	 * @param dcInfo
	 * @return
	 */
	public Boolean editDoctorInfo(DoctorInfo dcInfo) {
		if (0 < doctorinfoDao.save(dcInfo)) {
			return true;
		} else {
			return false;
		}
	}
	
	
}
