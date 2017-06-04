package com.healthcare.dao.get;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.healthcare.dao.base.BaseStoredProcedureDao;
import com.healthcare.model.BloodGlucose;

/**
 * 分页获取血糖数据
 * @Title: GetBloodGlucoseDao
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月1日 下午4:15:20
 *
 */
@Repository
public class GetBloodGlucoseDao extends BaseStoredProcedureDao<BloodGlucose> {

	@Override
	protected RowMapper<BloodGlucose> buildRowMapper() {
		return new RowMapper<BloodGlucose>() {
			public BloodGlucose mapRow(ResultSet rs, int row) throws SQLException {
				BloodGlucose bean = new BloodGlucose();
				bean.setId(rs.getLong("Id"));
				bean.setPatientId(rs.getString("PatientId"));
				bean.setDeviceMac(rs.getString("DeviceMac"));
				bean.setBloodGlucose(rs.getFloat("BloodGlucose"));
				bean.setUserName(rs.getString("UserName"));
				bean.setMeasureDate(rs.getTimestamp("MeasureDate"));
				return bean;
			}
		};
	}

	@Override
	protected StoredProcedure buildStoredProcedure() {
		return new BloodGlucoseSP();
	}
	
	public class BloodGlucoseSP extends StoredProcedure {
		BloodGlucoseSP() {
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
