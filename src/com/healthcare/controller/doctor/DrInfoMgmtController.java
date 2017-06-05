package com.healthcare.controller.doctor;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.healthcare.model.User;
import com.healthcare.model.UserInfo;
import com.healthcare.service.PatientDoctorService;
import com.healthcare.service.StoredProcedureService;
import com.healthcare.service.UserInfoService;
import com.healthcare.service.UserService;
import com.healthcare.util.DateConvert;

/**
 * 医生信息管理
 * @Title: DrInfoMgmtController
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年6月5日 上午10:39:44
 *
 */
@Controller
@RequestMapping("/drinfomgmt")
@SessionAttributes("UserSession")
public class DrInfoMgmtController {

	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@Autowired
	private StoredProcedureService spSrv;
	
	@Autowired
	private UserService userSrv;
	
	@Autowired
	private UserInfoService userinfoSrv;
	
	@Autowired
	private PatientDoctorService userdocSrv;
	
	
	/**************************************************************************
	** 医生个人信息
	**************************************************************************/
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("/drinfomgmt/index");
	}
	
	@RequestMapping(value = "/getdoctoraccount", method = RequestMethod.GET)
	@ResponseBody
	public Object getDoctorAccount(@ModelAttribute("UserSession") User user) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (null != user) {
			map.put("success", true);
			map.put("result", user);
		} else {
			map.put("success", false);
			map.put("message", "用户信息丢失，请重新登录.");
		}
		return map;
	}
	
	
	@RequestMapping(value = "/getdoctorinfo", method = RequestMethod.GET)
	@ResponseBody
	public Object getDoctorInfo(@ModelAttribute("UserSession") User user) {
		Map<String, Object> map = new HashMap<String, Object>();

		String userId = user.getUserId();
		UserInfo userinfo = null;
		if (!"".equals(userId)) {
			userinfo = userinfoSrv.getUserInfoByUserId(userId);
		}
		
		if (null != userinfo) {
			map.put("success", true);
			map.put("result", userinfo);
		} else {
			map.put("success", false);
			map.put("message", "未找到该用户的基本信息.");
		}
		return map;
	}
	
	@RequestMapping(value = "/editdoctor", method = RequestMethod.POST)
	@ResponseBody
	public Object editDoctor(User user, HttpServletRequest request, HttpSession session, ModelMap model) {
		Map<String, Object> map = new HashMap<String, Object>();

		Date registdate = DateConvert.String2DateTime(request.getParameter("user_registDate"));
		Date lastlogindate = DateConvert.String2DateTime(request.getParameter("user_lastLoginDate"));
		user.setRegistDate(registdate);
		user.setLastLoginDate(lastlogindate);
		
		if (userSrv.editUser(user)) {
			// 重置session
			model.addAttribute("UserSession", user);
			map.put("success", true);
		} else {
			map.put("success", false);
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/editdoctorinfo", method = RequestMethod.POST)
	@ResponseBody
	public Object editDoctorInfo(UserInfo userinfo, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String birthday_str = request.getParameter("userinfo_birthday");
		if (!"".equals(birthday_str)) {
			Date birthday = DateConvert.String2Date(birthday_str);
			userinfo.setBirthday(birthday);
		}

		if (userinfoSrv.editUserInfo(userinfo)) {
			map.put("success", true);
		} else {
			map.put("success", true);
		}
		
		return map;
	}
	
	
	/**************************************************************************
	** 医生患者信息
	**************************************************************************/
	@RequestMapping(value = "/mypatient", method = RequestMethod.GET)
	public ModelAndView myDoctor() {
		return new ModelAndView("/drinfomgmt/mypatient");
	}
	
	@RequestMapping(value = "/getmypatient", method = RequestMethod.GET)
	@ResponseBody
	public Object getMyPatients(@ModelAttribute("UserSession") User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;

		if(null!=(body = spSrv.executeSP("getdoctorpatient", new Object[]{ user.getUserId() }))) {
			map.put("success", true);
			map.put("result", body);
		} else {
			map.put("success", false);
		}

		return map;
	}
	

}
