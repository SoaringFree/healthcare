package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.Device;

/**
 * 分页获取设备信息
 * @Title: GetDeviceDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月3日 上午10:46:22
 *
 */
@Repository
public class GetDeviceDao extends BaseStoredProcedureDao<Device> {

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
				bean.setUserName(rs.getString("UserName"));
				bean.setRegistDate(rs.getTimestamp("RegistDate"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new DeviceSP();
	}
	
	public class DeviceSP extends StoredProcedure {
		DeviceSP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("pageNums", Types.INTEGER));
			declareParameter(new SqlParameter("pageRows", Types.INTEGER));
			declareParameter(new SqlParameter("patientId", Types.CHAR));
			declareParameter(new SqlParameter("userName", Types.CHAR));
			declareParameter(new SqlParameter("deviceType", Types.INTEGER));
			declareParameter(new SqlParameter("startTime", Types.CHAR));
			declareParameter(new SqlParameter("endTime", Types.CHAR));
		}
	}

}
