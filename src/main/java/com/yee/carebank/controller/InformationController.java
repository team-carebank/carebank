package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public Map<String, Object> selectMeal(@RequestBody String subcat_id_str) {
		int subcat_id = Integer.parseInt(subcat_id_str);

		Map<String, Object> res = new HashMap<String, Object>();

		List<MealDto> gallery = biz.selectGallery(subcat_id);
		List<String> food = biz.selectFood(subcat_id);
		String category = biz.selectCategory(subcat_id);

		res.put("gallery", gallery);
		res.put("food", food);
		res.put("category", category);

		return res;
	}
}
