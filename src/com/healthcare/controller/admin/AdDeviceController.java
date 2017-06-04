package com.healthcare.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.healthcare.model.Device;
import com.healthcare.service.DeviceService;
import com.healthcare.service.StoredProcedureService;
import com.healthcare.util.DateConvert;

/**
 * 设备管理
 * @Title: AdDeviceController
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月3日 上午11:02:59
 *
 */
@Controller
@RequestMapping("/addevicemgmt")
@SessionAttributes("UserSession")
public class AdDeviceController {
	
	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@Autowired
	private StoredProcedureService spSrv;
	
	@Autowired
	private DeviceService devSrv;
	
	
	/**************************************************************************
	** 设备数据
	**************************************************************************/
	@RequestMapping(value = "/device", method = RequestMethod.GET)
	public ModelAndView deviceIndex()
	{
		return new ModelAndView("/addevicemgmt/device");
	}
	
	@RequestMapping(value = "/getdevice", method = RequestMethod.GET)
	@ResponseBody
	public Object getDevice(int page, int rows, HttpServletRequest request){		
		String patientId = request.getParameter("patientId");
		String userName = request.getParameter("userName");
		int deviceType = Integer.parseInt(request.getParameter("deviceType"));
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		
		if ("".equals(startTime))
			startTime = "2017-01-01";
		if ("".equals(endTime))
			endTime= "2030-01-01";
		if (!DateConvert.DateCompare(startTime, endTime)) {
			startTime = "2017-01-01";
			endTime= "2030-01-01";
		}
		
		logger.info(String.format("###---> deviceType: %s ", patientId));
			
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getdevice", new Object[]{page, rows, patientId, userName, deviceType, startTime, endTime})))
			map.put("result", body);
		total = devSrv.countDevice(patientId, userName, deviceType, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@RequestMapping(value = "/isUserIdAvailable", method = RequestMethod.GET)
	@ResponseBody
	public Object IsUserIdAvailable(String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Boolean isAvaliable = false;

		if (!userId.equals("")) {
			if (devSrv.isUserIdAvailable(userId)) {
				isAvaliable = true;
			}
		}
		map.put("valid", isAvaliable);
		return map;
	}
	
	@RequestMapping(value = "/isDeviceMacAvailable", method = RequestMethod.GET)
	@ResponseBody
	public Object isDeviceMacAvailable(String deviceMac) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Boolean isAvaliable = false;

		if (!deviceMac.equals("")) {
			if (devSrv.isDeviceMacAvailable(deviceMac)) {
				isAvaliable = true;
			}
		}
		map.put("valid", isAvaliable);
		return map;
	}
	
	@RequestMapping(value = "/adddevice", method = RequestMethod.POST)
	@ResponseBody
	public Object addDevice(String userId, int deviceType, String deviceMac, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Date dt = new Date();
		
		Device dev = new Device();
		dev.setPatientId(userId);
		dev.setDeviceType(deviceType);
		dev.setDeviceMac(deviceMac);
		
		String devName="";
		if (1 == deviceType) {
			devName = "SPO2";
		} else if (2 == deviceType) {
			devName = "ECG";
		} else if (3 == deviceType) {
			devName = "BP";
		} else {
			devName = "GLU";
		}
		dev.setDeviceName(devName);
		dev.setRegistDate(dt);
		
		if(devSrv.isUserHasDevice(userId, deviceType)) {
			map.put("success", false);
			map.put("message", "该用户已有该类型的设备.");
		} else {
			if (devSrv.insertDevice(dev)) {
				map.put("success", true);
			} else {
				map.put("success", false);
				map.put("message", "服务器错误，请重试.");
			}
		}

		return map;
	}
	
	@RequestMapping(value = "/editdevice", method = RequestMethod.POST)
	@ResponseBody
	public Object editDevice(Device device, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Date dt = new Date();

		int deviceType = device.getDeviceType();
		String devName="";
		if (1 == deviceType) {
			devName = "SPO2";
		} else if (2 == deviceType) {
			devName = "ECG";
		} else if (3 == deviceType) {
			devName = "BP";
		} else {
			devName = "GLU";
		}
		device.setDeviceName(devName);
		device.setRegistDate(dt);
		
		if(devSrv.isEditDeviceMacAvailable(device.getPatientId(), device.getDeviceMac())) {
			if (devSrv.editDevice(device)) {
				map.put("success", true);
			} else {
				map.put("success", false);
				map.put("message", "修改失败，请重试.");
			}
		} else {
			map.put("success", false);
			map.put("message", "该设备正被其他用户使用.");
		}

		return map;
	}
	
	@RequestMapping(value = "/deletedevice", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteDevice(long[] ids, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();	
		if (devSrv.deleteDevice(ids)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}

		return map;
	}
	
	
}
