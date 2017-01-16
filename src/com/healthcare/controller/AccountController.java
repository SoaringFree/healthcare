package com.healthcare.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.healthcare.model.User;
import com.healthcare.service.UserService;

@Controller
@RequestMapping("/account")
@SessionAttributes("UserSession")
public class AccountController {

	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private UserService userSrv;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET )
	public ModelAndView index() {
		
		logger.info(String.format("###---> Go into Account : %s...", "Login"));
		return new ModelAndView("/account/login");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Object login(User user, HttpServletRequest request, HttpSession session, ModelMap model)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		
		if ("".equals(user.getUserId()) || "".equals(user.getPassword()))
		{
			map.put("message", "请输入登录信息！");
			return map;
		}
		
		String userCaptcha = request.getParameter("userCaptcha").toString().toUpperCase();
		String captcha = session.getAttribute("captcha").toString();

		if (!userCaptcha.equals(captcha)) {
			map.put("message", "验证码错误！");
			return map;
		}
		
		User login_user = userSrv.getUser(user);
		if (null != login_user && 0 != login_user.getId())
		{
			String url = "/account/login";
			switch (login_user.getRoleId()) {
			case 1:
				url = "/home/adminindex";
				break;
			case 2:
				url = "/home/userindex";
				break;
			case 3:
				url = "/home/doctorindex";
				break;
			case 4:
				url = "/home/familyindex";
				break;
			default:
				break;
			}

			model.addAttribute("UserSession", login_user);
			map.clear();
			map.put("success", true);
			map.put("url", url);
		} else {
			map.put("message", "用户名或密码错误！");
		}
		
		return  map;
	}
}
