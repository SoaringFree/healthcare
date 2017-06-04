package com.healthcare.controller.admin;

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

import com.healthcare.model.Electrocardiogram;
import com.healthcare.service.BloodGlucoseService;
import com.healthcare.service.BloodOxygenService;
import com.healthcare.service.BloodPressureService;
import com.healthcare.service.ElectrocardiogramService;
import com.healthcare.service.StoredProcedureService;
import com.healthcare.util.DateConvert;

/**
 * 
 * @Title: DataMangeController
 * @Description: 生理数据管理 
 *
 * @author: 114-FEI
 * @date: 2017年1月6日 上午10:20:08
 *
 */
@Controller
@RequestMapping("/addatamgmt")
@SessionAttributes("UserSession")
public class AdDataMgmtController {
	
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
	** 心电数据
	**************************************************************************/
	@RequestMapping(value = "/electrocardiogram", method = RequestMethod.GET)
	public ModelAndView electrocardiogramIndex()
	{
		return new ModelAndView("/addatamgmt/electrocardiogram");
	}
	
	@RequestMapping(value = "/getecgdata", method = RequestMethod.GET)
	@ResponseBody
	public Object getEcgData(int page, int rows, HttpServletRequest request){		
		String patientId = request.getParameter("patientId");
		String userName = request.getParameter("userName");
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
		
		logger.info(String.format("###---> patientId: %s userName: %s", patientId, userName));
			
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getelectrocardiogram", new Object[]{page, rows, patientId, userName, startTime, endTime})))
			map.put("result", body);
		total = ecgSrv.countEcg(patientId, userName, startTime, endTime);
		
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
	
	@RequestMapping(value = "/deleteecgdata", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteEcgData(long[] ids, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();	
		if (ecgSrv.deleteEcg(ids)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}

		return map;
	}
	
	
	/**************************************************************************
	** 血氧数据
	**************************************************************************/
	@RequestMapping(value = "/bloodoxygen", method = RequestMethod.GET)
	public ModelAndView bloodoxygenIndex()
	{
		return new ModelAndView("/addatamgmt/bloodoxygen");
	}
	
	@RequestMapping(value = "/getspo2data", method = RequestMethod.GET)
	@ResponseBody
	public Object getSpo2Data(int page, int rows, HttpServletRequest request){
		String patientId = request.getParameter("patientId");
		String userName = request.getParameter("userName");
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

		if(null!=(body = spSrv.executeSP("getbloodoxygen", new Object[]{page, rows, patientId, userName, startTime, endTime})))
			map.put("result", body);
		total = spo2Srv.countSpo2(patientId, userName, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@RequestMapping(value = "/deletespo2data", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteSpo2Data(long[] ids, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();	
		if (spo2Srv.deleteSpo2(ids)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}

		return map;
	}
	
	
	/**************************************************************************
	** 血压数据
	**************************************************************************/
	@RequestMapping(value = "/bloodpressure", method = RequestMethod.GET)
	public ModelAndView bloodpressureIndex()
	{
		return new ModelAndView("/addatamgmt/bloodpressure");
	}
	
	@RequestMapping(value = "/getbpdata", method = RequestMethod.GET)
	@ResponseBody
	public Object getBpData(int page, int rows, HttpServletRequest request){		
		String patientId = request.getParameter("patientId");
		String userName = request.getParameter("userName");
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

		if(null!=(body = spSrv.executeSP("getbloodpressure", new Object[]{page, rows, patientId, userName, startTime, endTime})))
			map.put("result", body);
		total = bpSrv.countBp(patientId, userName, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@RequestMapping(value = "/deletebpdata", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteBpData(long[] ids, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();	
		if (bpSrv.deleteBp(ids)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}

		return map;
	}
	
	
	/**************************************************************************
	** 血糖数据
	**************************************************************************/
	@RequestMapping(value = "/bloodglucose", method = RequestMethod.GET)
	public ModelAndView bloodglucoseIndex()
	{
		return new ModelAndView("/addatamgmt/bloodglucose");
	}
	
	@RequestMapping(value = "/getgludata", method = RequestMethod.GET)
	@ResponseBody
	public Object getGluData(int page, int rows, HttpServletRequest request){		
		String patientId = request.getParameter("patientId");
		String userName = request.getParameter("userName");
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

		if(null!=(body = spSrv.executeSP("getbloodglucose", new Object[]{page, rows, patientId, userName, startTime, endTime})))
			map.put("result", body);
		total = gluSrv.countGlu(patientId, userName, startTime, endTime);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@RequestMapping(value = "/deletegludata", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteGluData(long[] ids, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();	
		if (gluSrv.deleteGlu(ids)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}

		return map;
	}
	
	
	
	
}
