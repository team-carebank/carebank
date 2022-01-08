package com.yee.carebank.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.biz.ExerciseBiz;

@Controller
public class ExerciseController {

	private static Logger logger=LoggerFactory.getLogger(ExerciseController.class);
	
	
	@Autowired
	private ExerciseBiz biz;
	
	@RequestMapping("/exerciselist.do")
	public String exerciselist(Model model) {
		logger.info("exercise list");
		
		model.addAttribute("list", biz.selectList());
		
		return "exercise_main";
	}
	
	
	
	@RequestMapping("/exerdetail.do")
	public String detail(Model model, Integer exer_id) {
		logger.info("SELECT ONE");
		model.addAttribute("dto", biz.selectOne(exer_id)); 
		return "exercise_detail";
	}
	 
}

