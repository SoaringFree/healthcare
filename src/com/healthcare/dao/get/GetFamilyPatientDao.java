package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.FamilyPatient;

/**
 * 获取某一亲属的监护患者信息
 * @Title: GetFamilyPatientDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月5日 下午5:42:17
 *
 */
@Repository
public class GetFamilyPatientDao extends BaseStoredProcedureDao<FamilyPatient> {

	@Override
	protected RowMapper<FamilyPatient> buildRowMapper() {
		return new RowMapper<FamilyPatient>() {

			@Override
			public FamilyPatient mapRow(ResultSet rs, int row)
					throws SQLException {
				FamilyPatient bean = new FamilyPatient();
				bean.setId(rs.getInt("Id"));
				bean.setFamilyId(rs.getString("FamilyId"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setUserName(rs.getString("UserName"));
				bean.setRelationship(rs.getString("Relationship"));
				bean.setBindDate(rs.getTimestamp("BindDate"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new FamilyPatientSP();
	}
	
	public class FamilyPatientSP extends StoredProcedure {
		FamilyPatientSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("familyId", Types.CHAR));
		}
	}

}
