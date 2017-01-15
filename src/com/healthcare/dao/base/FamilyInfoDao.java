package com.healthcare.dao.base;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.model.FamilyInfo;

@Repository
public class FamilyInfoDao extends BaseDao<FamilyInfo> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("FamilyId=:familyId,");
		sb.append("UserId=:userId,");
		sb.append("Expert=:expert,");
		sb.append("BindDate=:bindDate,");
		
		sb.append(" WHERE Id=:id ");
		return sb.toString();
	}

	@Override
	protected RowMapper<FamilyInfo> buildRowMapper() {

		return new RowMapper<FamilyInfo>() {

			@Override
			public FamilyInfo mapRow(ResultSet rs, int row)
					throws SQLException {
				FamilyInfo bean = new FamilyInfo();
				bean.setId(rs.getInt("Id"));
				bean.setFamilyId(rs.getString("FamilyId"));
				bean.setUserId(rs.getString("UserId"));
				bean.setRelationship(rs.getString("Relationship"));
				bean.setBindDate(rs.getTimestamp("BindDate"));
				return bean;
			}
		};
	}

}
