package com.healthcare.controller.user;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/userhealthconsult")
@SessionAttributes("UserSession")
public class UserHealthConsult {
	
	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@RequestMapping(value = "/userindex", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("/healthconsult/userindex");
	}

}
