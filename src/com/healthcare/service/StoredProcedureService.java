package com.healthcare.service;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.get.GetBloodGlucoseDao;
import com.healthcare.dao.get.GetBloodOxygenDao;
import com.healthcare.dao.get.GetBloodPressureDao;
import com.healthcare.dao.get.GetDeviceDao;
import com.healthcare.dao.get.GetDoctorInfoDao;
import com.healthcare.dao.get.GetDoctorInfosDao;
import com.healthcare.dao.get.GetDoctorPatientBpDao;
import com.healthcare.dao.get.GetDoctorPatientDao;
import com.healthcare.dao.get.GetDoctorPatientEcgDao;
import com.healthcare.dao.get.GetDoctorPatientGluDao;
import com.healthcare.dao.get.GetDoctorPatientSpo2Dao;
import com.healthcare.dao.get.GetElectrocardiogramDao;
import com.healthcare.dao.get.GetFamilyPatientBpDao;
import com.healthcare.dao.get.GetFamilyPatientDao;
import com.healthcare.dao.get.GetFamilyPatientEcgDao;
import com.healthcare.dao.get.GetFamilyPatientGluDao;
import com.healthcare.dao.get.GetFamilyPatientSpo2Dao;
import com.healthcare.dao.get.GetPatientFamilyDao;
import com.healthcare.dao.get.GetUserDao;
import com.healthcare.dao.get.GetPatientDoctorDao;

@Service
public class StoredProcedureService {

		@Autowired
		private GetUserDao getuserDao;
		
		@Autowired
		private GetDoctorInfoDao getdoctorinfoDao;
		
		@Autowired
		private GetDoctorInfosDao getdoctorinfosDao;
		
		@Autowired
		private GetPatientDoctorDao getpatientdoctorDao;
		
		@Autowired
		private GetPatientFamilyDao getpatientfamilyDao;
		
			
		/**************************************************************************
		** 医生或患者，获取生理数据
		**************************************************************************/
		@Autowired
		private GetElectrocardiogramDao getelectrocardiogramDao;
		@Autowired
		private GetBloodGlucoseDao getbloodglucoseDao;
		@Autowired
		private GetBloodOxygenDao getbloodoxygenDao;
		@Autowired
		private GetBloodPressureDao getbloodpressureDao;
		
		
		@Autowired
		private GetDeviceDao getdeviceDao;
		
		
		
		
		/**************************************************************************
		** 医生或患者，获取生理数据
		**************************************************************************/
		@Autowired
		private GetDoctorPatientDao getdoctorpatientDao;
		@Autowired
		private GetDoctorPatientEcgDao getdoctorpatientecgDao;
		@Autowired
		private GetDoctorPatientBpDao getdoctorpatientbpDao;
		@Autowired
		private GetDoctorPatientGluDao getdoctorpatientgluDao;
		@Autowired
		private GetDoctorPatientSpo2Dao getdoctorpatientspo2Dao;
		
		
		/**************************************************************************
		** 亲属，获取生理数据
		**************************************************************************/
		@Autowired
		private GetFamilyPatientDao getfamilypatientDao;
		@Autowired
		private GetFamilyPatientEcgDao getfamilypatientecgDao;
		@Autowired
		private GetFamilyPatientBpDao getfamilypatientbpDao;
		@Autowired
		private GetFamilyPatientGluDao getfamilypatientgluDao;
		@Autowired
		private GetFamilyPatientSpo2Dao getfamilypatientspo2Dao;
		
		
		
		
		
		
		/**
		 * 执行存储过程
		 * @param sp_name 存储过程名
		 * @param args 参数列表
		 * @return List<'T'> Object
		 */
		@SuppressWarnings("unchecked")
		public Object executeSP(String sp_name, Object... args) {
			Object result = null;
			boolean isDebug =true;
			try {
				Field spField = this.getClass().getDeclaredField(
						sp_name.concat("Dao"));
				Class<Object[]>[] parameterTypes = new Class[1];
				parameterTypes[0] = Object[].class;
				Object spObject = spField.get(this);
				Method spCall = spObject.getClass().getSuperclass()
						.getDeclaredMethod("call", parameterTypes);
				result = spCall.invoke(spObject, (Object) args);
			} catch (NoSuchFieldException e) {
				if (isDebug)
					e.printStackTrace();
			} catch (SecurityException e) {
				if (isDebug)
					e.printStackTrace();
			} catch (NoSuchMethodException e) {
				if (isDebug)
					e.printStackTrace();
			} catch (IllegalAccessException e) {
				if (isDebug)
					e.printStackTrace();
			} catch (IllegalArgumentException e) {
				if (isDebug)
					e.printStackTrace();
			} catch (InvocationTargetException e) {
				if (isDebug)
					e.printStackTrace();
			}
			return result;
		}
}
