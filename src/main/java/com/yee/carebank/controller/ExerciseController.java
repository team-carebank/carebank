package com.yee.carebank.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.biz.ExerciseBiz;
import com.yee.carebank.model.biz.MyExerciseBiz;
import com.yee.carebank.model.dto.MyExerciseDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class ExerciseController {

	private static Logger logger = LoggerFactory.getLogger(ExerciseController.class);

	@Autowired
	private ExerciseBiz biz;

	@Autowired
	private MyExerciseBiz mybiz;

	@RequestMapping("/exerciselist.do")
	public String exerciselist(Model model) {
		logger.info("exercise list");

		model.addAttribute("list", biz.selectList());

		return "exercise_main";
	}

	@RequestMapping("/exerdetail.do")
	public String detail(Model model, Integer exer_id, MyExerciseDto dto, HttpSession session) {

		logger.info("exerlist detail");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			model.addAttribute("dto", biz.selectOne(exer_id));
			model.addAttribute("mydtooo", mybiz.selectList(loginUser.getUser_no()));
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect: main.do";
		}
		return "exercise_detail";
	}

}
