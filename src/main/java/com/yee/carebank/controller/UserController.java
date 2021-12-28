package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.UserBiz;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserBiz userbiz;
	
	@RequestMapping("/loginform.do")
	public String loginform() {
		return "login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> login(HttpSession session, @RequestBody UserDto userdto) {
		logger.info("LOGIN");
		
		UserDto res = userbiz.login(userdto);
		
		boolean check = false;
		if(res != null) {
			session.setAttribute("login", res);
			check = true; 
		}
		
		 Map<String, Boolean> map = new HashMap<String, Boolean>();
		 map.put("check",check);
		 //test//
		return map;
	}
}
