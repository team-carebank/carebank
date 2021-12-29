package com.yee.carebank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	@RequestMapping("/mealmain.do")
	public String hopitalMain() {
		return "meallist";
	}
}
