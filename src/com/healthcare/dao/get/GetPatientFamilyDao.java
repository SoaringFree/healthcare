package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.PatientFamily;

@Repository
public class GetPatientFamilyDao extends BaseStoredProcedureDao<PatientFamily> {

	@Override
	protected RowMapper<PatientFamily> buildRowMapper() {
		return new RowMapper<PatientFamily>() {

			@Override
			public PatientFamily mapRow(ResultSet rs, int row)
					throws SQLException {
				PatientFamily bean = new PatientFamily();
				bean.setId(rs.getInt("Id"));
				bean.setFamilyId(rs.getString("FamilyId"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setRelationship(rs.getString("Relationship"));
				bean.setBindDate(rs.getTimestamp("BindDate"));
				bean.setFamilyName(rs.getString("UserName"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new PatientFamilySP();
	}

	public class PatientFamilySP extends StoredProcedure {
		PatientFamilySP() {
			super();
			//定义参数 -- 单个用户亲属信息一般不超过10条，因此不需分页操作
			//declareParameter(new SqlParameter("pageNums", Types.INTEGER));
			//declareParameter(new SqlParameter("pageRows", Types.INTEGER));
			declareParameter(new SqlParameter("patientId", Types.CHAR));
		}
	}
}
