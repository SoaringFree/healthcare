package com.healthcare.controller.user;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import com.healthcare.model.DoctorInfo;
import com.healthcare.model.User;
import com.healthcare.model.UserInfo;
import com.healthcare.service.StoredProcedureService;
import com.healthcare.service.PatientDoctorService;
import com.healthcare.service.UserInfoService;
import com.healthcare.service.UserService;
import com.healthcare.util.DateConvert;

@Controller
@RequestMapping("/userinfo")
@SessionAttributes("UserSession")
public class UserInfoController {

	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@Autowired
	private StoredProcedureService spSrv;
	
	@Autowired
	private UserService userSrv;
	
	@Autowired
	private UserInfoService userinfoSrv;
	
	@Autowired
	private PatientDoctorService userdocSrv;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("/userinfo/index");
	}
	
	@RequestMapping(value = "/getuseraccount", method = RequestMethod.GET)
	@ResponseBody
	public Object getUserAccount(@ModelAttribute("UserSession") User user) {
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
	
	
	@RequestMapping(value = "/getuserinfo", method = RequestMethod.GET)
	@ResponseBody
	public Object getUserInfo(@ModelAttribute("UserSession") User user) {
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
			map.put("message", "未找到该用户得基本信息.");
		}
		return map;
	}
	
	@RequestMapping(value = "/edituser", method = RequestMethod.POST)
	@ResponseBody
	public Object editUser(User user, HttpServletRequest request, HttpSession session, ModelMap model) {
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
	
	
	@RequestMapping(value = "/edituserinfo", method = RequestMethod.POST)
	@ResponseBody
	public Object editUserInfo(UserInfo userinfo, HttpServletRequest request) {
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
	
	
	/******************************用户医生信息********************************/
	@RequestMapping(value = "/mydoctor", method = RequestMethod.GET)
	public ModelAndView myDoctor() {
		return new ModelAndView("/userinfo/mydoctor");
	}
	
	@RequestMapping(value = "/getmydoctors", method = RequestMethod.GET)
	@ResponseBody
	public Object getMyDoctors(@ModelAttribute("UserSession") User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;

		if(null!=(body = spSrv.executeSP("getuserdoctor", new Object[]{ user.getUserId() }))) {
			map.put("success", true);
			map.put("result", body);
		} else {
			map.put("success", false);
		}

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
	
}
