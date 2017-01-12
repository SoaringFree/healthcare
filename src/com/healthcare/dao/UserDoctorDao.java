package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.UserDoctor;

@Repository
public class UserDoctorDao extends BaseDao<UserDoctor> {

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
	protected RowMapper<UserDoctor> buildRowMapper() {
		return new RowMapper<UserDoctor>() {

			@Override
			public UserDoctor mapRow(ResultSet rs, int row)
					throws SQLException {
				UserDoctor bean = new UserDoctor();
				bean.setId(rs.getInt("Id"));
				bean.setDoctorId(rs.getString("DoctorId"));
				bean.setUserId(rs.getString("UserId"));
				bean.setBindDate(rs.getDate("BindDate"));
				return bean;
			}
			
		};
	}

}
