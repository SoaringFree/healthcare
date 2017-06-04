package com.healthcare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseDao;
import com.healthcare.model.Device;

/**
 * 获取设备信息
 * @Title: DeviceDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月3日 上午10:52:10
 *
 */
@Repository
public class DeviceDao extends BaseDao<Device> {

	@Override
	protected String buildUptStatement() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SET ");
		
		sb.append("PatientId=:patientId,");
		sb.append("DeviceType=:deviceType,");
		sb.append("DeviceMac=:deviceMac, ");
		sb.append("DeviceName=:deviceName, ");
		sb.append("RegistDate=:registDate ");
		
		sb.append(" WHERE Id=:id");
		return sb.toString();
	}

	@Override
	protected RowMapper<Device> buildRowMapper() {
		return new RowMapper<Device>() {
			public Device mapRow(ResultSet rs, int row) throws SQLException {
				Device bean = new Device();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDeviceType(rs.getInt("DeviceType"));
				bean.setDeviceMac(rs.getString("DeviceMac"));
				bean.setDeviceName(rs.getString("DeviceName"));
				bean.setRegistDate(rs.getTimestamp("RegistDate"));
				return bean;
			}
		};
	}

}
