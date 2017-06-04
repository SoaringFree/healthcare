package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.BloodGlucose;

/**
 * 获取血糖数据
 * @Title: BloodGlucoseDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午4:20:11
 *
 */
@Repository
public class BloodGlucoseDao extends BaseDao<BloodGlucose> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("PatientId=:patientId,");
		sb.append("DeviceMac=:deviceMac,");
		sb.append("BloodGlucose=:bloodGlucose,");
		sb.append("MeasureDate=:measureDate");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<BloodGlucose> buildRowMapper() {
		return new RowMapper<BloodGlucose>() {
			public BloodGlucose mapRow(ResultSet rs, int row) throws SQLException {
				BloodGlucose bean = new BloodGlucose();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDeviceMac(rs.getString("DeviceMac"));
				bean.setBloodGlucose(rs.getFloat("BloodGlucose"));
				bean.setMeasureDate(rs.getTimestamp("MeasureDate"));
				return bean;
			}
		};
	}

}
