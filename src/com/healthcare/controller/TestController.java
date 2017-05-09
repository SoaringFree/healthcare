package com.healthcare.controller;

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
import com.healthcare.model.UserInfo;
import com.healthcare.service.StoredProcedureService;

/**
 * 
 * @Title: TestController
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年4月13日 上午9:29:46
 *
 */
@Controller
@RequestMapping("/test")
@SessionAttributes("UserSession")
public class TestController {

	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private StoredProcedureService spSrv;
	
	
	/*******************************************************************/
	/*
	 * 心电数据展示
	 */
	@RequestMapping(value = "/ecg", method = RequestMethod.GET )
	public ModelAndView index() {
		return new ModelAndView("/test/ecg");
	}
	
	@RequestMapping(value = "/getuserecglist", method = RequestMethod.GET)
	@ResponseBody
	public Object getECGList(int page, int rows, HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Object body = null;
		
		int total = 0;

		//if(null!=(body = spSrv.executeSP("getuser", new Object[]{page, rows, userId, userName, roleId})))
			//map.put("result", body);
		//total = userSrv.getUserNumbers(userId, userName, roleId);
		
		map.put("total", (int)(total/rows + 1));
		map.put("page", page);
		map.put("records", total);
		
		return map;
	}
	
	
	@RequestMapping(value = "/getuserecg", method = RequestMethod.GET)
	@ResponseBody
	public Object getECG(int id, HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Electrocardiogram ecg = null;
		/*
		if (!"".equals(userid)) {
			userinfo = userinfoSrv.getUserInfoByUserId(userid);
		}
		*/
		
		if (null != ecg) {
			map.put("success", true);
			map.put("result", ecg);
		} else {
			map.put("success", false);
			map.put("message", "未找到该用户的心电信息！");
		}
		
		return map;
	}
	
	
	
	
	
	/*******************************************************************/
	/*
	 * 健康咨询
	 */
	@RequestMapping(value = "/chat", method = RequestMethod.GET )
	public ModelAndView chatIndex() {
		return new ModelAndView("/test/chat");
	}
	
	
	/*
	 * 血压数据展示
	 */
	@RequestMapping(value = "/bp", method = RequestMethod.GET )
	public ModelAndView bpindex() {
		return new ModelAndView("/test/bp");
	}
	
	
	/*******************************************************************/
	/**
	 * Web IDE
	 * 
	 */
	@RequestMapping(value = "/webindex1", method = RequestMethod.GET )
	public ModelAndView webindex1() {
		return new ModelAndView("/test/webindex1");
	}
	
}
