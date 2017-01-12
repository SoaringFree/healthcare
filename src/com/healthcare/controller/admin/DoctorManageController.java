package com.healthcare.controller.admin;

import java.util.HashMap;
import java.util.List;
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

import com.healthcare.model.DoctorInfo;
import com.healthcare.service.DoctorInfoService;
import com.healthcare.service.StoredProcedureService;
import com.healthcare.service.UserService;

@Controller
@RequestMapping("/doctormanage")
@SessionAttributes("UserSession")
public class DoctorManageController {
	
	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@Autowired
	private StoredProcedureService spSrv;
	
	@Autowired
	private UserService userSrv;
	
	@Autowired
	private DoctorInfoService doctorinfoSrv;
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("/doctormanage/index");
	}
	
	@RequestMapping(value = "/getdoctors", method = RequestMethod.GET)
	@ResponseBody
	public Object getUserDoctors(int page, int rows, HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getuser", new Object[]{page, rows, userId, userName, 3})))
			map.put("result", body);
		total = userSrv.getUserNumbers(userId, userName, 3);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getdoctorinfo", method = RequestMethod.GET)
	@ResponseBody
	public Object getDoctorInfo(String doctorId, HttpServletRequest request) {	
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		List<DoctorInfo> docInfos = null;
		
		if(null!=(body = spSrv.executeSP("getdoctorinfo", new Object[]{ doctorId }))) {
			docInfos = (List<DoctorInfo>)body;
			if (docInfos.isEmpty()) {
				map.put("success", false);
			} else {
				map.put("success", true);
				map.put("doctorinfo", docInfos);
			}
		} else {
			map.put("success", false);
		}
			
		return map;
	}
	
	@RequestMapping(value = "/editdoctorinfo", method = RequestMethod.POST)
	@ResponseBody
	public Object getDoctorInfo(DoctorInfo doctorinfo, HttpServletRequest request) {	
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(doctorinfoSrv.editDoctorInfo(doctorinfo)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}
			
		return map;
	}
	
	
	@RequestMapping(value = "/bindingindex", method = RequestMethod.GET)
	public ModelAndView bindingIndex() {
		return new ModelAndView("/doctormanage/bindingindex");
	}
	
	@RequestMapping(value = "/getusers", method = RequestMethod.GET)
	@ResponseBody
	public Object getUsers(int page, int rows, HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getuser", new Object[]{page, rows, userId, userName, 2})))
			map.put("result", body);
		total = userSrv.getUserNumbers(userId, userName, 2);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@RequestMapping(value = "/getuserdoctors", method = RequestMethod.GET)
	@ResponseBody
	public Object getUserDoctors(String userId, HttpServletRequest request) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;

		if(null!=(body = spSrv.executeSP("getuserdoctor", new Object[]{ userId }))) {
			map.put("success", true);
			map.put("result", body);
		} else {
			map.put("success", false);
		}

		return map;
	}
	
	
}
