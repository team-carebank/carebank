package com.yee.carebank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yee.carebank.model.biz.indexBiz;

@Controller
public class indexcontroller{
	
	@Autowired
	private indexBiz biz;
	
	@RequestMapping("/main.do")
	public String getMain(Model model) {
		System.out.println("메인으로~");
		return "main";
	}
	 
}