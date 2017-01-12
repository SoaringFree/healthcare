package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.UserDoctor;

@Repository
public class GetUserDoctorDao extends BaseStoredProcedureDao<UserDoctor> {

	@Override
	protected RowMapper<UserDoctor> buildRowMapper() {
		return new RowMapper<UserDoctor>() {
			public UserDoctor mapRow(ResultSet rs, int row) throws SQLException {
				UserDoctor bean = new UserDoctor();
				bean.setId(rs.getLong("Id"));
				bean.setUserId(rs.getString("UserId"));
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
		return new UserDoctorSP();
	}
	
	public class UserDoctorSP extends StoredProcedure {
		UserDoctorSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("userId", Types.CHAR));
		}
	}

}
