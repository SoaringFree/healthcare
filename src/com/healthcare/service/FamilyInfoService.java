package com.healthcare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.FamilyInfoDao;
import com.healthcare.model.FamilyInfo;

@Service
public class FamilyInfoService {
	
	@Autowired
	private FamilyInfoDao familyinfoDao;
	
	/**
	 * 编辑用户亲属信息
	 * @param family
	 * @return
	 */
	public Boolean addfamily(FamilyInfo family) {
		
		if (0 < familyinfoDao.save(family)) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 删除用户亲属信息
	 * @param id
	 * @return
	 */
	public Boolean deletefamily(int id) {
		if (0 < id && 0 < familyinfoDao.delete(id)) {
			return true;
		} else {
			return false;
		}
	}
}
