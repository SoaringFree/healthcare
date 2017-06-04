package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.PatientDoctor;

@Repository
public class GetPatientDoctorDao extends BaseStoredProcedureDao<PatientDoctor> {

	@Override
	protected RowMapper<PatientDoctor> buildRowMapper() {
		return new RowMapper<PatientDoctor>() {
			public PatientDoctor mapRow(ResultSet rs, int row) throws SQLException {
				PatientDoctor bean = new PatientDoctor();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDoctorId(rs.getString("DoctorId"));
				bean.setBindDate(rs.getTimestamp("BindDate"));
				bean.setProfessional(rs.getString("Professional"));
				bean.setDepartmentId(rs.getString("DepartmentId"));
				bean.setDepartment(rs.getString("Department"));
				bean.setUserName(rs.getString("UserName"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new PatientDoctorSP();
	}
	
	public class PatientDoctorSP extends StoredProcedure {
		PatientDoctorSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("userId", Types.CHAR));
		}
	}

}
