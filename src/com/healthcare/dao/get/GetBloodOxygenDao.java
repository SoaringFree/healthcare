package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.BloodOxygen;

/**
 * 分页获取血氧数据
 * @Title: GetBloodOxygenDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午4:41:15
 *
 */
@Repository
public class GetBloodOxygenDao extends BaseStoredProcedureDao<BloodOxygen> {

	@Override
	protected RowMapper<BloodOxygen> buildRowMapper() {
		return new RowMapper<BloodOxygen>() {
			public BloodOxygen mapRow(ResultSet rs, int row) throws SQLException {
				BloodOxygen bean = new BloodOxygen();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDeviceMac(rs.getString("DeviceMac"));
				bean.setBloodOxygen(rs.getString("BloodOxygen"));
				bean.setVolumeWave(rs.getString("VolumeWave"));
				bean.setPulseRate(rs.getString("PulseRate"));
				bean.setUserName(rs.getString("UserName"));
				bean.setMeasureDate(rs.getTimestamp("MeasureDate"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new BloodOxygenSP();
	}
	
	public class BloodOxygenSP extends StoredProcedure {
		BloodOxygenSP() {
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
