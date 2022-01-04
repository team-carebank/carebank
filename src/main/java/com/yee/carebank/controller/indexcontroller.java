package com.yee.carebank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yee.carebank.model.biz.indexBiz;
import com.yee.carebank.model.dto.ExerciseDto;

@Controller
public class indexcontroller{
	 
	@RequestMapping("/main.do")
	public String getMain(Model model) { 
		return "main";
	}
	
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