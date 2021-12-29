package com.yee.carebank.controller;

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
	public List<MealDto> selectMeal(@RequestBody String subcat_id_str) {
		int subcat_id = Integer.parseInt(subcat_id_str);

		List<MealDto> res = biz.selectList(subcat_id);

		return res;
	}
}
