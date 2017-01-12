package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.UserInfo;

@Repository
public class UserInfoDao extends BaseDao<UserInfo> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("UserId=:userId,");
		sb.append("Sex=:sex,");
		sb.append("Birthday=:birthday,");
		sb.append("Nation=:nation,");
		sb.append("Identity=:identity,");
		sb.append("BackupPhone=:backupPhone,");
		sb.append("Email=:email,");
		sb.append("Address=:address");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<UserInfo> buildRowMapper() {
		return new RowMapper<UserInfo>() {

			@Override
			public UserInfo mapRow(ResultSet rs, int row)
					throws SQLException {
				UserInfo bean = new UserInfo();
				bean.setId(rs.getLong("Id"));
				bean.setUserId(rs.getString("UserId"));
				bean.setSex(rs.getString("Sex"));
				bean.setBirthday(rs.getTimestamp("Birthday"));
				bean.setNation(rs.getString("Nation"));
				bean.setIdentity(rs.getString("Identity"));
				bean.setBackupPhone(rs.getString("BackupPhone"));
				bean.setEmail(rs.getString("Email"));
				bean.setAddress(rs.getString("Address"));
				return bean;
			}
			
		};
	}

}
