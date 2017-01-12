package com.healthcare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.DepartmentDao;
import com.healthcare.model.Department;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentDao departmentDao;
	
	/**
	 * 加载部门信息
	 * @return
	 */
	public List<Department> getDepartments() {
		return departmentDao.list();
	}
}
