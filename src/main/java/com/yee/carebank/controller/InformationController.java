package com.yee.carebank.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yee.carebank.model.biz.CommentBiz;
import com.yee.carebank.model.biz.MealBiz;
import com.yee.carebank.model.biz.SuppleBiz;
import com.yee.carebank.model.dto.CommentDto;
import com.yee.carebank.model.dto.FoodDto;
import com.yee.carebank.model.dto.MealDto;
import com.yee.carebank.model.dto.ShoppingDto;
import com.yee.carebank.model.dto.SuppleDto;

@Controller
public class InformationController {

	@Autowired
	MealBiz biz;

	@Autowired
	SuppleBiz sBiz;

	@Autowired
	CommentBiz cBiz;

	@RequestMapping("/mealmain.do")
	public String main(Model model) {
		model.addAttribute("category", biz.selectCatList());

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
		List<CommentDto> comment = cBiz.selectList(id, 1);

		boolean flag = false;

		model.addAttribute("meal", meal);
		model.addAttribute("ingredient", ingredient);
		model.addAttribute("comment", comment);

		if (ingredient.size() > 1) {
			flag = true;
		}

		model.addAttribute("flag", flag);

		return "mealinfo";
	}

	@RequestMapping("/mealcomm.do")
	@ResponseBody
	public boolean writeComment(HttpServletRequest request, @RequestBody String data) {
		// MemberDto user = request.getSession().getAttribute("loginUser");
		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();
		int info_id = jo.get("info_id").getAsInt();
		String comment = jo.get("comment").getAsString();

		CommentDto dto = new CommentDto();
		dto.setInfo_id(info_id);
		dto.setContent(comment);
		dto.setUser_no(1001);

		int res = cBiz.write(dto, 1);

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/supplemain.do")
	public String sMain(Model model) {
		model.addAttribute("category", sBiz.selectCatList());

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
		List<ShoppingDto> shopping = sBiz.getShopping(supple.getSupple_name());

		model.addAttribute("supple", supple);
		model.addAttribute("description", description);
		model.addAttribute("shopping", shopping);

		return "suppleinfo";
	}
}
