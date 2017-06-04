package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.DoctorPatient;

/**
 * 医生->患者
 * @Title: DoctorPatientDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月4日 上午11:31:04
 *
 */
@Repository
public class DoctorPatientDao extends BaseDao<DoctorPatient> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("DoctorId=:doctorId,");
		sb.append("PatientId=:patientId,");
		sb.append("BindDate=:bindDate ");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<DoctorPatient> buildRowMapper() {
		return new RowMapper<DoctorPatient>() {

			@Override
			public DoctorPatient mapRow(ResultSet rs, int row)
					throws SQLException {
				DoctorPatient bean = new DoctorPatient();
				bean.setId(rs.getInt("Id"));
				bean.setDoctorId(rs.getString("DoctorId"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setBindDate(rs.getDate("BindDate"));
				return bean;
			}
			
		};
	}

}
