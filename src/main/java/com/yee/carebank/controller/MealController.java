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
public class MealController {

	@Autowired
	MealBiz biz;

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

		model.addAttribute("meal", meal);
		model.addAttribute("ingredient", ingredient);
		model.addAttribute("comment", comment);

		return "mealinfo";
	}

	@RequestMapping("/mealcomm.do")
	@ResponseBody
	public boolean write(HttpServletRequest request, @RequestBody String data) {
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

	@RequestMapping("/mcommupdate.do")
	@ResponseBody
	public boolean modify(HttpServletRequest request, @RequestBody String data) {
		// MemberDto user = request.getSession().getAttribute("loginUser");
		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();
		int comm_no = jo.get("comm_no").getAsInt();
		String comment = jo.get("comment").getAsString();

		CommentDto dto = new CommentDto();
		dto.setComm_no(comm_no);
		dto.setContent(comment);

		int res = cBiz.update(dto, 1);

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/mcommdelete.do")
	@ResponseBody
	public boolean delete(HttpServletRequest request, @RequestBody int comm_no) {
		// MemberDto user = request.getSession().getAttribute("loginUser");

		int res = cBiz.delete(comm_no, 1);

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("prefer/meallist.do")
	public String preferMeal(Model model) {
		// <!--- 로그인 기능 연결 시 수정 --->
		int user_no = 1001;
		int subcat_id = 1;
		// <!--- 끝 --->
		model.addAttribute("random", biz.selectRandom(user_no));
		model.addAttribute("comment", biz.selectByComment());
		model.addAttribute("meal", biz.selectMeal(subcat_id));
		return "mealprefer";
	}
}