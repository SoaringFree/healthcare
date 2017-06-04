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
 * 分页获取某一医生的患者血氧数据
 * @Title: GetDoctorPatientSpo2Dao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月4日 下午5:02:26
 *
 */
@Repository
public class GetDoctorPatientSpo2Dao extends BaseStoredProcedureDao<BloodOxygen> {

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
		return new DoctorPatientSpo2SP();
	}
	
	public class DoctorPatientSpo2SP extends StoredProcedure {
		DoctorPatientSpo2SP() {
			super();
			//定义参数
			declareParameter(new SqlParameter("pageNums", Types.INTEGER));
			declareParameter(new SqlParameter("pageRows", Types.INTEGER));
			declareParameter(new SqlParameter("doctorId", Types.CHAR));
			declareParameter(new SqlParameter("patientId", Types.CHAR));
			declareParameter(new SqlParameter("startTime", Types.CHAR));
			declareParameter(new SqlParameter("endTime", Types.CHAR));
		}
	}

}
