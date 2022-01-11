package com.yee.carebank.api;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.UserBiz;
import com.yee.carebank.model.dto.UserDto;



@Controller
public class SocialLoginAPI {
	@Autowired
	private UserBiz userbiz;

	private static final Logger logger = LoggerFactory.getLogger(SocialLoginAPI.class);

	
	@RequestMapping("/kakaologin.do")
	@ResponseBody
	public String kakaologin(HttpSession session, @RequestBody UserDto kakaodto) {
		
		logger.info("KAKAO LOGIN");
		
		UserDto kakaologin = new UserDto();
		
		String user_id = kakaodto.getUser_id();
		int idchk = userbiz.idchk(user_id);
		
		if(idchk != 0) { // 중복아이디 존재
			
			kakaologin = userbiz.login(kakaodto);
			session.setAttribute("login_info", kakaologin);
			
			return "main.do" ; 
		}
		else {// 중복없음: 회원가입 시키기
			int res = userbiz.regis(kakaodto);
				if(res>0) {
					session.setAttribute("login_info", kakaodto);
					return "main.do";
				}
				else {
					return "loginform.do";
				} 
		}
		
		
	
		
		
	}
		

	
	
	
}
