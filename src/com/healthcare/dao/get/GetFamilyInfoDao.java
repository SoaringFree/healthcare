package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.FamilyInfo;

@Repository
public class GetFamilyInfoDao extends BaseStoredProcedureDao<FamilyInfo> {

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
				bean.setFamilyName(rs.getString("UserName"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new FamilyInfoSP();
	}

	public class FamilyInfoSP extends StoredProcedure {
		FamilyInfoSP() {
			super();
			//定义参数 -- 单个用户亲属信息不超过10条，因此不需分页操作
			//declareParameter(new SqlParameter("pageNums", Types.INTEGER));
			//declareParameter(new SqlParameter("pageRows", Types.INTEGER));
			declareParameter(new SqlParameter("userId", Types.CHAR));
		}
	}
}
