package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.Electrocardiogram;

/**
 * 获取心电数据
 * @Title: ElectrocardiogramDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年5月24日 下午3:22:18
 *
 */
@Repository
public class ElectrocardiogramDao extends BaseDao<Electrocardiogram> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("PatientId=:patientId,");
		sb.append("DeviceMac=:deviceMac,");
		sb.append("HeartRate=:heartRate,");
		sb.append("ECG=:eCG,");
		sb.append("MeasureDate=:measureDate");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<Electrocardiogram> buildRowMapper() {
		return new RowMapper<Electrocardiogram>() {
			public Electrocardiogram mapRow(ResultSet rs, int row) throws SQLException {
				Electrocardiogram bean = new Electrocardiogram();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDeviceMac(rs.getString("DeviceMac"));
				bean.setHeartRate(rs.getString("HeartRate"));
				bean.seteCG(rs.getString("ECG"));
				bean.setMeasureDate(rs.getTimestamp("MeasureDate"));
				return bean;
			}
		};
	}

}
