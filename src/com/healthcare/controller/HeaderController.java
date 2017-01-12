package com.healthcare.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.healthcare.model.User;

@Controller
@RequestMapping("/header")
@SessionAttributes("UserSession")
public class HeaderController {
	@RequestMapping(value = "/loadheader", method = RequestMethod.GET)
	@ResponseBody
	public Object LoadHeader(@ModelAttribute("UserSession") User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userinfo", user);
		return map;
	}
}
