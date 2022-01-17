package com.yee.carebank.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.biz.MeditationBiz;

@Controller
public class MeditationController {

	private static Logger logger=LoggerFactory.getLogger(MeditationController.class);
	
@Autowired	
  private MeditationBiz biz;
  
	@RequestMapping("/newmeditation.do")
	public String exerciselist(Model model) {
		logger.info("meditation list");
		
		model.addAttribute("list", biz.selectList());
		
		return "meditation";
	}
	
	@RequestMapping("/med_detail.do")
	public String detail(Model model, int meditate_id) {
		logger.info("SELECT ONE");
		model.addAttribute("dto", biz.selectOne(meditate_id)); 
		return "meditation_detail";
	}

	
}
