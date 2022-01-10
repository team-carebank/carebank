package com.yee.carebank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yee.carebank.model.biz.UserBiz;
import com.yee.carebank.model.biz.indexBiz;
import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class indexcontroller{
	 
	private static final Logger logger=LoggerFactory.getLogger(indexcontroller.class);
	

	@Autowired
	private UserBiz userbiz;
	 
	@RequestMapping("/main.do")
	public String getMain(UserDto userdto,HttpSession session, Model model,HttpServletRequest request ) {
		UserDto login_info = userbiz.login(userdto); //로그인정보가져오기
		//HttpSession session=request.getSession();
		if(session.getAttribute("login")==null) {
			logger.info("로그인 안됨");
		}else {
			logger.info("로그인완료");
		}
		return "main";
	}

	
//	@RequestMapping("/main.do")
//	public String getMain(Model model) {
//		return "main";
//	}
	@RequestMapping("/exercise.do")
	public String getExercise(Model model) { 
		return "exercise_main";
	}
	 
	@RequestMapping("/exercise_detail.do")
	public String getExer_detail(Model model) { 
		return "exercise_detail";
	}
	
	@RequestMapping("/meditation.do")
	public String getMeditation(Model model) { 
		return "meditation";
	}
	
	@RequestMapping("/meditation_detail.do")
	public String getMedit_detail(Model model) { 
		return "meditation_detail";
	}
	

}