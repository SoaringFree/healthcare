package com.healthcare.controller.patient;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.healthcare.model.Electrocardiogram;
import com.healthcare.model.User;
import com.healthcare.service.BloodGlucoseService;
import com.healthcare.service.BloodOxygenService;
import com.healthcare.service.BloodPressureService;
import com.healthcare.service.ElectrocardiogramService;
import com.healthcare.service.StoredProcedureService;
import com.healthcare.util.DateConvert;

/**
 * 患者健康数据管理
 * @Title: PtDataMgmtController
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月5日 上午9:39:56
 *
 */
@Controller
@RequestMapping("/ptdatamgmt")
@SessionAttributes("UserSession")
public class PtDataMgmtController {

	@Autowired
	private StoredProcedureService spSrv;
	
	@Autowired
	private ElectrocardiogramService ecgSrv;
	
	@Autowired
	private BloodPressureService bpSrv;
	
	@Autowired
	private BloodOxygenService spo2Srv;
	
	@Autowired
	private BloodGlucoseService gluSrv;
	

	/**************************************************************************
	** 心电数据
	**************************************************************************/
	@RequestMapping(value = "/electrocardiogram", method = RequestMethod.GET)
	public ModelAndView electrocardiogramIndex()
	{
		return new ModelAndView("/ptdatamgmt/electrocardiogram");
	}
	
	@RequestMapping(value = "/getmyecgdata", method = RequestMethod.GET)
	@ResponseBody
	public Object getEcgData(int page, int rows, 
			@ModelAttribute("UserSession") User user, HttpServletRequest request){	

		String patientId = user.getUserId();
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
			
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getdoctorpatientecg", new Object[]{page, rows, "", patientId, startTime, endTime})))
			map.put("result", body);
		total = ecgSrv.countDoctorPatientEcg("", patientId, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@RequestMapping(value = "/getecgbyid", method = RequestMethod.GET)
	@ResponseBody
	public Object getEcgById(int id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		
		Electrocardiogram ecg = ecgSrv.getEcg(id);
		if (null != ecg && 0 != ecg.getId()) {
			String ecgStr = ecg.geteCG();
			int len = ecgStr.length() >> 1;
			int[] list = new int[len];
			for (int i = 0; i < len; i++) {
				list[i] = Integer.parseInt(ecgStr.substring(i<<1, (i<<1)+2),16) - 128;
			}
			map.clear();
			map.put("success", true);
			map.put("ecgArr", list);
			map.put("measureDate", ecg.getMeasureDate());
		} 
		
		return map;
	}
	
	
	/**************************************************************************
	** 血氧数据
	**************************************************************************/
	@RequestMapping(value = "/bloodoxygen", method = RequestMethod.GET)
	public ModelAndView bloodoxygenIndex()
	{
		return new ModelAndView("/ptdatamgmt/bloodoxygen");
	}
	
	@RequestMapping(value = "/getmyspo2data", method = RequestMethod.GET)
	@ResponseBody
	public Object getSpo2Data(int page, int rows,
			@ModelAttribute("UserSession") User user, HttpServletRequest request){
		String patientId = user.getUserId();
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
			
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getdoctorpatientspo2", new Object[]{page, rows, "", patientId, startTime, endTime})))
			map.put("result", body);
		total = spo2Srv.countDoctorPatientSpo2("", patientId, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	
	/**************************************************************************
	** 血压数据
	**************************************************************************/
	@RequestMapping(value = "/bloodpressure", method = RequestMethod.GET)
	public ModelAndView bloodpressureIndex()
	{
		return new ModelAndView("/ptdatamgmt/bloodpressure");
	}
	
	@RequestMapping(value = "/getmybpdata", method = RequestMethod.GET)
	@ResponseBody
	public Object getBpData(int page, int rows,
			@ModelAttribute("UserSession") User user, HttpServletRequest request){		
		String patientId = user.getUserId();
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
			
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getdoctorpatientbp", new Object[]{page, rows, "", patientId, startTime, endTime})))
			map.put("result", body);
		total = bpSrv.countDoctorPatientBp("", patientId, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	
	/**************************************************************************
	** 血糖数据
	**************************************************************************/
	@RequestMapping(value = "/bloodglucose", method = RequestMethod.GET)
	public ModelAndView bloodglucoseIndex()
	{
		return new ModelAndView("/ptdatamgmt/bloodglucose");
	}
	
	@RequestMapping(value = "/getmygludata", method = RequestMethod.GET)
	@ResponseBody
	public Object getGluData(int page, int rows,
			@ModelAttribute("UserSession") User user, HttpServletRequest request){		
		String patientId = user.getUserId();
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
			
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getdoctorpatientglu", new Object[]{page, rows, "", patientId, startTime, endTime})))
			map.put("result", body);
		total = gluSrv.countDoctorPatientGlu("", patientId, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
}
