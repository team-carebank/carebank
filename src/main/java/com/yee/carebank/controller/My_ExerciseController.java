package com.yee.carebank.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.biz.MyExerciseBiz;

@Controller
public class My_ExerciseController {


	private static Logger logger=LoggerFactory.getLogger(ExerciseController.class);
	
	@Autowired
	private MyExerciseBiz biz;
	
	@RequestMapping("myexerciselist.do")
	public String myexerciselist(Model model) {
		logger.info("myexercise list");
		
		model.addAttribute("list", biz.selectList());
		
		return null;
	}
}
