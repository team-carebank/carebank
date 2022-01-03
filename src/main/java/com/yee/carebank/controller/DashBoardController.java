package com.yee.carebank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class DashBoardController {

	@Controller
	public class MainController {
		
		@RequestMapping(value="/", method=RequestMethod.GET)
		public String home(Model model) {
			
			
			model.addAttribute("menu","home");
			return "dashboard_main";
		}
		
		@RequestMapping(value="/bmi", method=RequestMethod.GET)
		public String bmi(Model model) {

			model.addAttribute("menu","bmi");

			return "dashboard_bmi";
		}
		
		@RequestMapping(value="/health", method=RequestMethod.GET)
		public String health(Model model) {

			model.addAttribute("menu","health");

			return "dashboard_health";
		}
		
		@RequestMapping(value="/Mind", method=RequestMethod.GET)
		public String Mind(Model model) {
			
			model.addAttribute("menu","Mind");

			return "dashboard_mind";
		}
		
		@RequestMapping(value="/Nutrient", method=RequestMethod.GET)
		public String Nutrient(Model model) {
			
			model.addAttribute("menu","Nutrient");

			return "dashboard_nutrient";
		}
	}
}
