package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.BloodOxygen;

/**
 * 获取血氧信息
 * @Title: BloodOxygen
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午4:48:08
 *
 */
@Repository
public class BloodOxygenDao extends BaseDao<BloodOxygen> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("PatientId=:patientId,");
		sb.append("DeviceMac=:deviceMac,");
		sb.append("BloodOxygen=:bloodOxygen,");
		sb.append("PulseRate=:pulseRate,");
		sb.append("VolumeWave=:volumeWave,");
		sb.append("MeasureDate=:measureDate");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<BloodOxygen> buildRowMapper() {
		return new RowMapper<BloodOxygen>() {
			public BloodOxygen mapRow(ResultSet rs, int row) throws SQLException {
				BloodOxygen bean = new BloodOxygen();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDeviceMac(rs.getString("DeviceMac"));
				bean.setBloodOxygen(rs.getString("BloodOxygen"));
				bean.setPulseRate(rs.getString("PulseRate"));
				bean.setVolumeWave(rs.getString("VolumeWave"));
				bean.setMeasureDate(rs.getTimestamp("MeasureDate"));
				return bean;
			}
		};
	}

}
