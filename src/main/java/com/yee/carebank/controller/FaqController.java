package com.yee.carebank.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.biz.FaqBiz;



@Controller
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqBiz faqbiz;
	

	@RequestMapping("/faqlist.do")
	public String list(Model model) {
		logger.info("SELECT FAQ LIST");
		
		model.addAttribute("list", faqbiz.selectList());
		return "faq";
	}

}
