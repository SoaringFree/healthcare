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

import com.healthcare.model.FamilyInfo;
import com.healthcare.model.User;
import com.healthcare.model.UserInfo;
import com.healthcare.service.FamilyInfoService;
import com.healthcare.service.StoredProcedureService;
import com.healthcare.service.UserInfoService;
import com.healthcare.service.UserService;
import com.healthcare.util.DateConvert;

/**
 * 
 * @Title: UserManageController
 * @Description: 用户管理 
 *
 * @author: 114-FEI
 * @date: 2017年1月6日 上午10:19:52
 *
 */
@Controller
@RequestMapping("/usermanage")
@SessionAttributes("UserSession")
public class UserManageController {

	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@Autowired
	private StoredProcedureService spSrv;
	
	@Autowired
	private UserService userSrv;
	
	@Autowired
	private UserInfoService userinfoSrv;
	
	@Autowired
	private FamilyInfoService familySrv;
	
	
	@RequestMapping(value = "/userindex", method = RequestMethod.GET)
	public ModelAndView userIndex() {
		return new ModelAndView("/usermanage/userindex");
	}
	
	@RequestMapping(value = "/addfamily", method = RequestMethod.GET)
	public ModelAndView addFamily() {
		return new ModelAndView("/usermanage/addfamily");
	}
	
	
	@RequestMapping(value = "/getuser", method = RequestMethod.GET)
	@ResponseBody
	public Object getUser(int page, int rows, HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String roleIdStr = request.getParameter("roleId");
		
		int roleId = 0;
		if (null != roleIdStr && !"".equals(roleIdStr))
			roleId = Integer.parseInt(request.getParameter("roleId"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;

		if(null!=(body = spSrv.executeSP("getuser", new Object[]{page, rows, userId, userName, roleId})))
			map.put("result", body);
		total = userSrv.getUserNumbers(userId, userName, roleId);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@RequestMapping(value = "/getuserinfo", method = RequestMethod.GET)
	@ResponseBody
	public Object getUserInfo(String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserInfo userinfo = null;
		if (!"".equals(userid)) {
			userinfo = userinfoSrv.getUserInfoByUserId(userid);
		}
		
		if (null != userinfo) {
			map.put("success", true);
			map.put("userinfo", userinfo);
		} else {
			map.put("success", false);
			map.put("message", "未找到该用户得基本信息！");
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/createuser", method = RequestMethod.POST)
	@ResponseBody
	public Object createUser(User user, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Date dt = new Date();
		user.setRegistDate(dt);
		user.setLastLoginDate(dt);
		
		if (userSrv.insertUser(user)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}
		return map;
	}
	
	
	@RequestMapping(value = "/isUserIdAvailable", method = RequestMethod.GET)
	@ResponseBody
	public Object IsUserIdAvailable(String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Boolean isAvaliable = false;

		if (!userId.equals("")) {
			if (userSrv.isUserIdAvailable(userId)) {
				isAvaliable = true;
			}
		}
		map.put("valid", isAvaliable);
		return map;
	}
	
	
	@RequestMapping(value = "/edituser", method = RequestMethod.POST)
	@ResponseBody
	public Object editUser(User user, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		Date registdate = DateConvert.String2DateTime(request.getParameter("detail_registDate"));
		Date lastlogindate = DateConvert.String2DateTime(request.getParameter("detail_lastLoginDate"));
		user.setRegistDate(registdate);
		user.setLastLoginDate(lastlogindate);
		
		if (userSrv.editUser(user)) {
			map.put("success", true);
		} else {
			map.put("success", true);
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/deleteuser", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteUser(int id, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (userSrv.deleteUser(id)) {
			map.put("success", true);
		} else {
			map.put("success", true);
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/edituserinfo", method = RequestMethod.POST)
	@ResponseBody
	public Object editUserInfo(UserInfo userinfo, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String birthday_str = request.getParameter("edit_birthday");
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
	
	
	@RequestMapping(value = "/getfamilyinfo", method = RequestMethod.GET)
	@ResponseBody
	public Object getFamilyInfo(String userId, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		Object body = null;
		if (!"".equals(userId)) {
			if(null!=(body = spSrv.executeSP("getfamilyinfo", new Object[]{userId}))) {
				map.clear();
				map.put("success", true);
				map.put("result", body);
			}	
		}
		
		return map;
	}
	
	@RequestMapping(value = "/searchfamily", method = RequestMethod.GET)
	@ResponseBody
	public Object searchFamily(int page, int rows, HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");

		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		int total = 0;
		
		if (!"".equals(userId) || !"".equals(userName)) {
			if(null!=(body = spSrv.executeSP("getuser", new Object[]{page, rows, userId, userName, 4})))
				map.put("result", body);
			total = userSrv.getUserNumbers(userId, userName, 4);
		} 

		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	@RequestMapping(value = "/addfamily", method = RequestMethod.POST)
	@ResponseBody
	public Object addFamily(FamilyInfo family, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date dt = new Date();
		family.setBindDate(dt);
		
		if (familySrv.addfamily(family)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}
		
		return map;
	}
	
	@RequestMapping(value = "/deletefamily", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteFamily(int id, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (familySrv.deletefamily(id)) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}
		
		return map;
	}
}
