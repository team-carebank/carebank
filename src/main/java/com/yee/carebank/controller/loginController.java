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
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
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
		if(res != null) { //객체 존재: 디비에서 잘 읽어왔다 : 회원이 로그인을 성공했다
			session.setAttribute("login", res);
			check = true; //check가  true면 성공 false면 실패판단
		}
		
		 Map<String, Boolean> map = new HashMap<String, Boolean>();
		 map.put("check",check);
		return map;
	}
}
