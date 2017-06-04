package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.BloodPressure;

/**
 * 获取血压数据
 * @Title: BloodPressureDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午5:01:51
 *
 */
@Repository
public class BloodPressureDao extends BaseDao<BloodPressure> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("PatientId=:patientId,");
		sb.append("DeviceMac=:deviceMac,");
		sb.append("SystolicPressure=:systolicPressure,");
		sb.append("DiastolicPressure=:diastolicPressure,");
		sb.append("MeanPressure=:meanPressure,");
		sb.append("PulseRate=:pulseRate,");
		sb.append("MeasureDate=:measureDate");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

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
				bean.setMeasureDate(rs.getTimestamp("MeasureDate"));
				return bean;
			}
		};
	}

}
