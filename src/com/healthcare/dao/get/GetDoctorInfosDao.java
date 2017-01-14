package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.DoctorInfo;

@Repository
public class GetDoctorInfosDao extends BaseStoredProcedureDao<DoctorInfo> {

	@Override
	protected RowMapper<DoctorInfo> buildRowMapper() {
		return new RowMapper<DoctorInfo>() {
			public DoctorInfo mapRow(ResultSet rs, int row) throws SQLException {
				DoctorInfo bean = new DoctorInfo();
				bean.setId(rs.getLong("Id"));
				bean.setDoctorId(rs.getString("DoctorId"));
				bean.setProfessional(rs.getString("Professional"));
				bean.setExpert(rs.getString("Expert"));
				bean.setDepartmentId(rs.getString("DepartmentId"));
				bean.setBrief(rs.getString("Brief"));
				bean.setSpeciality(rs.getString("Speciality"));
				bean.setDepartment(rs.getString("Department"));
				bean.setUserName(rs.getString("UserName"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new DoctorInfosSP();
	}
	
	public class DoctorInfosSP extends StoredProcedure {
		DoctorInfosSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("pageNums", Types.INTEGER));
			declareParameter(new SqlParameter("pageRows", Types.INTEGER));
		}
	}
}
