package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.MealBiz;
import com.yee.carebank.model.dto.MealDto;

@Controller
public class InformationController {

	@Autowired
	MealBiz biz;

	@RequestMapping("/mealmain.do")
	public String main() {
		return "meallist";
	}

	@RequestMapping("/meallist.do")
	@ResponseBody
	public Map<String, Object> selectList(@RequestBody String subcat_id_str) {
		int subcat_id = Integer.parseInt(subcat_id_str);

		Map<String, Object> res = new HashMap<String, Object>();

		List<MealDto> meal = biz.selectMeal(subcat_id);
		List<String> food = biz.selectFood(subcat_id);

		res.put("meal", meal);
		res.put("food", food);

		return res;
	}
	
	@RequestMapping("/mealinfo.do")
	public String selectMeal(Model model, int id) {
		Map<String, Object> res = biz.selectOne(id);
		
		model.addAttribute(res);
		
		return "mealinfo";
	}

}
