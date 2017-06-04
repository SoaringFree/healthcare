package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.PatientDoctor;

@Repository
public class PatientDoctorDao extends BaseDao<PatientDoctor> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("DoctorId=:doctorId,");
		sb.append("UserId=:userId,");
		sb.append("BindDate=:bindDate ");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<PatientDoctor> buildRowMapper() {
		return new RowMapper<PatientDoctor>() {

			@Override
			public PatientDoctor mapRow(ResultSet rs, int row)
					throws SQLException {
				PatientDoctor bean = new PatientDoctor();
				bean.setId(rs.getInt("Id"));
				bean.setDoctorId(rs.getString("DoctorId"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setBindDate(rs.getDate("BindDate"));
				return bean;
			}
			
		};
	}

}
