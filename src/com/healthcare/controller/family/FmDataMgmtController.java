package com.healthcare.controller.family;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
 * 亲属用户对患者健康数据查看
 * @Title: FmDataMgmtController
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年5月24日 上午9:38:27
 *
 */
@Controller
@RequestMapping("/fmdatamgmt")
@SessionAttributes("UserSession")
public class FmDataMgmtController {
	
	protected final Log logger = LogFactory.getLog(getClass()); 
	
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
	** 获取患者信息
	**************************************************************************/
	@RequestMapping(value = "/getmypatient", method = RequestMethod.GET)
	@ResponseBody
	public Object getMyPatient(@ModelAttribute("UserSession") User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		if(null!=(body = spSrv.executeSP("getfamilypatient", new Object[]{ user.getUserId() }))) {
			map.put("result", body);
			map.put("success", true);
		} else 
			map.put("success", false);

		return map;
	}
	
	
	/**************************************************************************
	** 心电数据
	**************************************************************************/
	@RequestMapping(value = "/electrocardiogram", method = RequestMethod.GET)
	public ModelAndView electrocardiogramIndex()
	{
		return new ModelAndView("/fmdatamgmt/electrocardiogram");
	}
	
	@RequestMapping(value = "/getmypatientecgdata", method = RequestMethod.GET)
	@ResponseBody
	public Object getEcgData(int page, int rows, 
			@ModelAttribute("UserSession") User user, HttpServletRequest request){	
		String familyId = user.getUserId();
		String patientId = request.getParameter("patientId");
		if (patientId.equals("0"))
			patientId = "";
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

		if(null!=(body = spSrv.executeSP("getfamilypatientecg", new Object[]{page, rows, familyId, patientId, startTime, endTime})))
			map.put("result", body);
		total = ecgSrv.countFamilyPatientEcg(familyId, patientId, startTime, endTime);
		
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
		return new ModelAndView("/fmdatamgmt/bloodoxygen");
	}
	
	@RequestMapping(value = "/getmypatientspo2data", method = RequestMethod.GET)
	@ResponseBody
	public Object getSpo2Data(int page, int rows,
			@ModelAttribute("UserSession") User user, HttpServletRequest request){
		String familyId = user.getUserId();
		String patientId = request.getParameter("patientId");
		if (patientId.equals("0"))
			patientId = "";
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

		if(null!=(body = spSrv.executeSP("getfamilypatientspo2", new Object[]{page, rows, familyId, patientId, startTime, endTime})))
			map.put("result", body);
		total = spo2Srv.countFamilyPatientSpo2(familyId, patientId, startTime, endTime);
		
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
		return new ModelAndView("/fmdatamgmt/bloodpressure");
	}
	
	@RequestMapping(value = "/getmypatientbpdata", method = RequestMethod.GET)
	@ResponseBody
	public Object getBpData(int page, int rows,
			@ModelAttribute("UserSession") User user, HttpServletRequest request){		
		String familyId = user.getUserId();
		String patientId = request.getParameter("patientId");
		if (patientId.equals("0"))
			patientId = "";
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

		if(null!=(body = spSrv.executeSP("getfamilypatientbp", new Object[]{page, rows, familyId, patientId, startTime, endTime})))
			map.put("result", body);
		total = bpSrv.countFamilyPatientBp(familyId, patientId, startTime, endTime);
		
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
		return new ModelAndView("/fmdatamgmt/bloodglucose");
	}
	
	@RequestMapping(value = "/getmypatientgludata", method = RequestMethod.GET)
	@ResponseBody
	public Object getGluData(int page, int rows,
			@ModelAttribute("UserSession") User user, HttpServletRequest request){		
		String familyId = user.getUserId();
		String patientId = request.getParameter("patientId");
		if (patientId.equals("0"))
			patientId = "";
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

		if(null!=(body = spSrv.executeSP("getfamilypatientglu", new Object[]{page, rows, familyId, patientId, startTime, endTime})))
			map.put("result", body);
		total = gluSrv.countFamilyPatientGlu(familyId, patientId, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	
	
}
