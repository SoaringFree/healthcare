package com.healthcare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.DeviceDao;
import com.healthcare.dao.UserDao;
import com.healthcare.model.Device;
import com.healthcare.model.User;

/**
 * 获取设备信息
 * @Title: DeviceService
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月3日 上午10:55:40
 *
 */
@Service
public class DeviceService {
	
	@Autowired
	private DeviceDao deviceDao;
	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 分页查询统计
	 */
	public int countDevice(String patientId, String userName, int deviceType, String startTime, String endTime) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(patientId)) {
			filter = " PatientId = '" + patientId + "' AND ";
		} else if (!"".equals(userName)) {
			filter = " UserName LIKE '%" + userName + "%' AND ";
		}
		
		if (0 != deviceType) {
			filter += (" DeviceType = " + String.valueOf(deviceType) + " AND ");
		}

		filter += " RegistDate >= '" +startTime + "' AND RegistDate <= '" +  endTime + "' ";

		if ("".equals(filter))
			count = deviceDao.count();
		else 
			count = deviceDao.count(filter);
		
		return count;
	}
	
	
	/**
	 * 添加设备，验证用户名是否存在
	 * @param userId
	 * @return
	 */
	public Boolean isUserIdAvailable(String userId) {
		String filter = String.format(" UserId='%s' AND RoleId=2", userId);
		List<User> users = userDao.list(filter);
		if (!users.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 添加设备，验证设备地址的合法性
	 * @param devMac
	 * @return
	 */
	public Boolean isDeviceMacAvailable(String devMac) {
		String filter = String.format(" DeviceMac='%s' ", devMac);
		List<Device> devs = deviceDao.list(filter);
		if (devs.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}	
	
	/**
	 * 添加设备，验证该用户是否已有该类型设备
	 * @param userId, devType
	 * @return
	 */
	public Boolean isUserHasDevice(String userId, int devType) {
		String filter = String.format(" PatientId='%s' AND DeviceType=%s", userId, devType);
		List<Device> devs = deviceDao.list(filter);
		if (devs.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}	
	
	/**
	 * 添加设备
	 * @param device
	 * @return
	 */
	public Boolean insertDevice(Device device) {
		long result = 0;
		if (0 == device.getId()) {
			result = deviceDao.save(device);
		}
		
		if (0 < result) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 修改设备，验证设备地址是否可用
	 * @param userId, devMac
	 * @return
	 */
	public Boolean isEditDeviceMacAvailable(String userId, String devMac) {
		String filter = String.format(" DeviceMac='%s' AND PatientId != '%s' ", devMac, userId);
		List<Device> devs = deviceDao.list(filter);
		if (devs.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}	
	
	/**
	 * 修改设备信息
	 * @param dev
	 * @return
	 */
	public Boolean editDevice(Device dev) {
		long result = 0;
		if (0 < dev.getId()) {
			result = deviceDao.update(dev);
		}
		
		if (0 < result) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 删除设备数据
	 * @param ids
	 * @return
	 */
	public boolean deleteDevice(long[] ids) {
		
		if (0 < ids.length){
			if (0 < deviceDao.delete(ids)) {
				return true;
			}
		}
		return false;
	}
	
}
