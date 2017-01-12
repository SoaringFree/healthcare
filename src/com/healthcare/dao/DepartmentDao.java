package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.Department;

@Repository
public class DepartmentDao extends BaseDao<Department> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("DepartmentId=:departmentId,");
		sb.append("Department=:department,");
		sb.append("FoundingDate=:foundingDate ");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<Department> buildRowMapper() {
		return new RowMapper<Department>() {

			@Override
			public Department mapRow(ResultSet rs, int row)
					throws SQLException {
				Department bean = new Department();
				bean.setId(rs.getInt("Id"));
				bean.setDepartmentId(rs.getString("DepartmentId"));
				bean.setDepartment(rs.getString("Department"));
				bean.setFoundingDate(rs.getDate("FoundingDate"));
				return bean;
			}
			
		};
	}
	
}
