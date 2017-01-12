package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.DoctorInfo;

@Repository
public class DoctorInfoDao extends BaseDao<DoctorInfo> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("DoctorId=:doctorId,");
		sb.append("Professional=:professional,");
		sb.append("Expert=:expert,");
		sb.append("DepartmentId=:departmentId,");
		sb.append("Brief=:brief,");
		sb.append("Speciality=:speciality ");
		
		sb.append(" WHERE Id=:id ");
		return sb.toString();
	}

	@Override
	protected RowMapper<DoctorInfo> buildRowMapper() {
		return new RowMapper<DoctorInfo>() {

			@Override
			public DoctorInfo mapRow(ResultSet rs, int row)
					throws SQLException {
				DoctorInfo bean = new DoctorInfo();
				bean.setId(rs.getInt("Id"));
				bean.setDoctorId(rs.getString("DoctorId"));
				bean.setProfessional(rs.getString("Professional"));
				bean.setExpert(rs.getString("Expert"));
				bean.setDepartmentId(rs.getString("DepartmentId"));
				bean.setBrief(rs.getString("Brief"));
				bean.setSpeciality(rs.getString("Speciality"));
				return bean;
			}
			
		};
	}

}
