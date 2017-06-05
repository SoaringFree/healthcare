package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.Electrocardiogram;

/**
 * 分页获取某一亲属的监护患者心电数据
 * @Title: GetDoctorPatientEcgDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月4日 下午3:37:46
 *
 */
@Repository
public class GetFamilyPatientEcgDao extends BaseStoredProcedureDao<Electrocardiogram> {

	@Override
	protected RowMapper<Electrocardiogram> buildRowMapper() {
		return new RowMapper<Electrocardiogram>() {
			public Electrocardiogram mapRow(ResultSet rs, int row) throws SQLException {
				Electrocardiogram bean = new Electrocardiogram();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDeviceMac(rs.getString("DeviceMac"));
				bean.setHeartRate(rs.getString("HeartRate"));
				bean.setUserName(rs.getString("UserName"));
				/** bean.seteCG(rs.getString("ECG")); */
				bean.setMeasureDate(rs.getTimestamp("MeasureDate"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		
		return new FamilyPatientEcgSP();
	}
	
	public class FamilyPatientEcgSP extends StoredProcedure {
		FamilyPatientEcgSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("pageNums", Types.INTEGER));
			declareParameter(new SqlParameter("pageRows", Types.INTEGER));
			declareParameter(new SqlParameter("familyId", Types.CHAR));
			declareParameter(new SqlParameter("patientId", Types.CHAR));
			declareParameter(new SqlParameter("startTime", Types.CHAR));
			declareParameter(new SqlParameter("endTime", Types.CHAR));
		}
	}

}
