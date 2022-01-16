package com.yee.carebank.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.biz.MyExerciseBiz;
import com.yee.carebank.model.biz.MyMealBiz;
import com.yee.carebank.model.biz.TmMealBiz;
import com.yee.carebank.model.dto.MyExerciseDto;
import com.yee.carebank.model.dto.MyMealDto;
import com.yee.carebank.model.dto.TmMealDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class DashboardController {

	private static Logger logger = LoggerFactory.getLogger(ExerciseController.class);

	@Autowired
	private MyExerciseBiz mybiz;

	@Autowired
	private TmMealBiz tmbiz;

	@RequestMapping("/dashboard.do")
	public String dashboard(Model model, HttpSession session) {

		logger.info("dashlist");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		int user_no = 0;

		try {
			user_no = loginUser.getUser_no();
		} catch (Exception e) {
			return "redirect: main.do";
		}
		model.addAttribute("mydtooo", mybiz.selectList(user_no));
		model.addAttribute("tmmeal", tmbiz.selectList(user_no));
		return "dashboard";

	}

}
