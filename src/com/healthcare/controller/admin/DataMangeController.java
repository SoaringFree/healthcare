package com.healthcare.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("/datamanage")
@SessionAttributes("UserSession")
public class DataMangeController {
	
	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@RequestMapping(value = "/electrocardiogramindex", method = RequestMethod.GET)
	public ModelAndView electrocardiogramIndex()
	{
		return new ModelAndView("/datamanage/electrocardiogramindex");
	}
	
	@RequestMapping(value = "/bloodoxygenindex", method = RequestMethod.GET)
	public ModelAndView bloodoxygenIndex()
	{
		return new ModelAndView("/datamanage/bloodoxygenindex");
	}
	
	@RequestMapping(value = "/bloodpressureindex", method = RequestMethod.GET)
	public ModelAndView bloodpressureIndex()
	{
		return new ModelAndView("/datamanage/bloodpressureindex");
	}
	
	@RequestMapping(value = "/bloodglucoseindex", method = RequestMethod.GET)
	public ModelAndView bloodglucoseIndex()
	{
		return new ModelAndView("/datamanage/bloodglucoseindex");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
