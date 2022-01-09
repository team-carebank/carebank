package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.yee.carebank.model.biz.MealBiz;
import com.yee.carebank.model.dto.FoodDto;

@Controller
public class TeachableController {

	@Autowired
	MealBiz biz;

	@RequestMapping("/tm.do")
	public String goPage() {
		return "tm/tmpage";
	}

	@RequestMapping("/getinfo.do")
	@ResponseBody
	Map<String, FoodDto> getInfo(@RequestBody String data) {
		Map<String, FoodDto> res = new HashMap<String, FoodDto>();

		String food = new JsonParser().parse(data).getAsJsonObject().get("food").getAsString();

		FoodDto dto = biz.selectNutrient(food);

		res.put("res", dto);

		return res;
	}
}
