package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.User;

@Repository
public class GetUserDao extends BaseStoredProcedureDao<User> {

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
				bean.setRoleName(rs.getString("RoleName"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new UserSP();
	}

	public class UserSP extends StoredProcedure {
		UserSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("pageNums", Types.INTEGER));
			declareParameter(new SqlParameter("pageRows", Types.INTEGER));
			declareParameter(new SqlParameter("userId", Types.CHAR));
			declareParameter(new SqlParameter("userName", Types.CHAR));
			declareParameter(new SqlParameter("roleId", Types.INTEGER));
		}
	}
}
