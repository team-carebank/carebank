package com.yee.carebank.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.MyInfoBiz;
import com.yee.carebank.model.dto.UserDto;


@Controller
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);

@Autowired
private MyInfoBiz infobiz;

	@RequestMapping("/myinfo.do")
	public String myinfo() {
		logger.info("MYPAGE");
		return "mypage_myinfo";
	}
	
	@RequestMapping("/myinfoUpdate.do")
	@ResponseBody
	public boolean myinfoUpdate(HttpSession session, @RequestBody UserDto newdto) {
		logger.info("MYPAGE INFO UPDATE");
		
		int res = infobiz.myinfoUpdate(newdto);
		
		if(res > 0) {
			session.setAttribute("login_info", newdto);
			return true;

		}
		else {
			return false;
		}
	}
	
	@RequestMapping("/disable.do")
	//@ResponseBody
	public String disable(HttpSession session, @RequestParam int user_no) {
		logger.info("MYPAGE USER DISABLE");
	
		int res = infobiz.disable(user_no);
		
		if (res > 0) {
			
			return "redirect:logout.do";
		}
		else {
			return "redirect:myinfo.do";
		
		}
	}
	
	
	
	
}
