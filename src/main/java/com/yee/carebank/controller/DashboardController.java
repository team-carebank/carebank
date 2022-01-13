package com.yee.carebank.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.biz.MyExerciseBiz;
import com.yee.carebank.model.dto.MyExerciseDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class DashboardController {

	private static Logger logger=LoggerFactory.getLogger(ExerciseController.class);


	@Autowired
	private MyExerciseBiz mybiz;
	
	@RequestMapping("/dashboard.do")
	public String dashboard(Model model,MyExerciseDto dto, HttpSession session) {
		 
		logger.info("dashlist");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		int user_no=dto.setUser_no(loginUser.getUser_no());
		
		model.addAttribute("mydtooo",mybiz.selectList(user_no));
		
		return "dashboard";
		
	}
	
	
	
	
}
