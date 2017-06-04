package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.DoctorPatient;

/**
 * 获取某个医生的患者信息
 * @Title: GetDoctorPatientDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月4日 上午11:27:54
 *
 */
@Repository
public class GetDoctorPatientDao extends BaseStoredProcedureDao<DoctorPatient> {

	@Override
	protected RowMapper<DoctorPatient> buildRowMapper() {
		return new RowMapper<DoctorPatient>() {
			public DoctorPatient mapRow(ResultSet rs, int row) throws SQLException {
				DoctorPatient bean = new DoctorPatient();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDoctorId(rs.getString("DoctorId"));
				bean.setBindDate(rs.getTimestamp("BindDate"));
				bean.setUserName(rs.getString("UserName"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		
		return new DoctorPatientSP();
	}
	
	public class DoctorPatientSP extends StoredProcedure {
		DoctorPatientSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("doctorId", Types.CHAR));
		}
	}

}
