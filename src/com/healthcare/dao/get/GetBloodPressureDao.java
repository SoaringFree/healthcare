package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.BloodPressure;

/**
 * 分页获取血压数据信息
 * @Title: GetBloodPressureDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午4:58:09
 *
 */
@Repository
public class GetBloodPressureDao extends BaseStoredProcedureDao<BloodPressure> {

	@Override
	protected RowMapper<BloodPressure> buildRowMapper() {
		return new RowMapper<BloodPressure>() {
			public BloodPressure mapRow(ResultSet rs, int row) throws SQLException {
				BloodPressure bean = new BloodPressure();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDeviceMac(rs.getString("DeviceMac"));
				bean.setSystolicPressure(rs.getString("SystolicPressure"));
				bean.setDiastolicPressure(rs.getString("DiastolicPressure"));
				bean.setMeanPressure(rs.getString("MeanPressure"));
				bean.setPulseRate(rs.getString("PulseRate"));
				bean.setUserName(rs.getString("UserName"));
				bean.setMeasureDate(rs.getTimestamp("MeasureDate"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new BloodPressureSP();
	}
	
	public class BloodPressureSP extends StoredProcedure {
		BloodPressureSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("pageNums", Types.INTEGER));
			declareParameter(new SqlParameter("pageRows", Types.INTEGER));
			declareParameter(new SqlParameter("patientId", Types.CHAR));
			declareParameter(new SqlParameter("userName", Types.CHAR));
			declareParameter(new SqlParameter("startTime", Types.CHAR));
			declareParameter(new SqlParameter("endTime", Types.CHAR));
		}
	}

}
