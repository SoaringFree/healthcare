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

import com.healthcare.model.Department;
import com.healthcare.service.DepartmentService;

@Controller
@RequestMapping("/department")
@SessionAttributes("UserSession")
public class DepartmentController {

	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@Autowired
	private DepartmentService departmentSrv;
	
	
	@RequestMapping(value = "/getdepartments", method = RequestMethod.GET)
	@ResponseBody
	public Object getDepartments(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Department> depts = departmentSrv.getDepartments();
		if (depts.isEmpty()) {
			map.put("success", false);
		} else {
			map.put("success", true);
			map.put("result", depts);
		}
		
		return map;
	}
	
	
}
