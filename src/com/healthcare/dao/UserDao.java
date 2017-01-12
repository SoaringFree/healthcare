package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.User;

@Repository
public class UserDao extends BaseDao<User> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("UserId=:userId,");
		sb.append("Password=:password,");
		sb.append("RoleId=:roleId,");
		sb.append("UserName=:userName,");
		sb.append("RegistDate=:registDate,");
		sb.append("LastLoginDate=:lastLoginDate");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<User> buildRowMapper() {
		return new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User bean = new User();
				bean.setId(rs.getLong("Id"));
				bean.setUserId(rs.getString("UserId"));
				bean.setPassword(rs.getString("Password"));
				bean.setRoleId(rs.getInt("RoleId"));
				bean.setUserName(rs.getString("UserName"));
				bean.setRegistDate(rs.getTimestamp("RegistDate"));
				bean.setLastLoginDate(rs.getTimestamp("LastLoginDate"));
				return bean;
			}
		};
	}

}
