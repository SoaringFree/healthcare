package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.PatientFamily;

@Repository
public class PatientFamilyDao extends BaseDao<PatientFamily> {

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
	protected RowMapper<PatientFamily> buildRowMapper() {

		return new RowMapper<PatientFamily>() {

			@Override
			public PatientFamily mapRow(ResultSet rs, int row)
					throws SQLException {
				PatientFamily bean = new PatientFamily();
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
