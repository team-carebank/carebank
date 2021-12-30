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
import com.yee.carebank.model.biz.SuppleBiz;
import com.yee.carebank.model.dto.FoodDto;
import com.yee.carebank.model.dto.MealDto;
import com.yee.carebank.model.dto.SuppleDto;

@Controller
public class InformationController {

	@Autowired
	MealBiz biz;

	@Autowired
	SuppleBiz sBiz;

	@RequestMapping("/mealmain.do")
	public String main() {
		return "meallist";
	}

	@RequestMapping("/meallist.do")
	@ResponseBody
	public Map<String, Object> selectList(@RequestBody int subcat_id) {
		Map<String, Object> res = new HashMap<String, Object>();

		List<MealDto> meal = biz.selectMeal(subcat_id);
		List<String> food = biz.selectFood(subcat_id);

		res.put("meal", meal);
		res.put("food", food);

		return res;
	}

	@RequestMapping("/mealinfo.do")
	public String selectMeal(Model model, int id) {
		MealDto meal = biz.selectOne(id);
		List<FoodDto> ingredient = biz.selectIngredient(id);

		boolean flag = false;

		model.addAttribute("meal", meal);
		model.addAttribute("ingredient", ingredient);

		if (ingredient.size() > 1) {
			flag = true;
		}

		model.addAttribute("flag", flag);

		return "mealinfo";
	}

	@RequestMapping("/supplemain.do")
	public String sMain() {
		return "supplelist";
	}

	@RequestMapping("/supplelist.do")
	@ResponseBody
	public Map<String, Object> selectSList(@RequestBody int subcat_id) {
		Map<String, Object> res = new HashMap<String, Object>();

		res.put("supple", sBiz.selectList(subcat_id));

		return res;
	}

	@RequestMapping("/suppleinfo.do")
	public String selectSupple(Model model, int id) {
		SuppleDto supple = sBiz.selectOne(id);
		List<String> description = sBiz.selectInfo(id);

		model.addAttribute("supple", supple);
		model.addAttribute("description", description);

		return "suppleinfo";
	}
}
