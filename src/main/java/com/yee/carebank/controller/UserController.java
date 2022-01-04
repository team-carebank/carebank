package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	//로그인 페이지 이동
	@RequestMapping("/loginform.do")
	public String loginform() {
		logger.info("LOGIN FORM");
		return "login";
	}
	
	//로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> login(HttpSession session, @RequestBody UserDto userdto) {
		logger.info("LOGIN");
		
		UserDto res = userbiz.login(userdto);
		
		boolean check = false;
		if(res != null) {
			if(passwordEncoder.matches(userdto.getUser_pw(), res.getUser_pw())) {
				
				session.setAttribute("login", res);
				check = true; 
			}
		}
		
		 Map<String, Boolean> map = new HashMap<String, Boolean>();
		 map.put("check",check);
		 //test//
		return map;
	}
	
	//회원가입 페이지 이동
	@RequestMapping("/regisform.do")
	public String regisform() {
		logger.info("REGIS FORM");
		return "register";
	}
	
	//회원가입
	@RequestMapping(value = "/regis.do", method = RequestMethod.POST)
	public String regis(UserDto userdto) {
		logger.info("REGISTER");
		
		userdto.setUser_pw(passwordEncoder.encode(userdto.getUser_pw()));
		int res = userbiz.regis(userdto);
		if(res>0) {

			return "redirect:loginform.do";
		}
		else {
			
			return "redirect:regisform.do";
		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
}
