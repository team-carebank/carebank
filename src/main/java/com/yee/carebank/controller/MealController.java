package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.yee.carebank.model.dto.CommentDto;
import com.yee.carebank.model.dto.FoodDto;
import com.yee.carebank.model.dto.MealDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class MealController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	MealBiz biz;

	@Autowired
	CommentBiz cBiz;

	@RequestMapping("/mealmain.do")
	public String main(Model model) {
		logger.info("INFO - MAIN [MEAL]");

		model.addAttribute("category", biz.selectCatList());

		return "meallist";
	}

	@RequestMapping("/meallist.do")
	@ResponseBody
	public Map<String, Object> selectList(@RequestBody int subcat_id) {
		logger.info("INFO - SELECT LIST [MEAL]");

		Map<String, Object> res = new HashMap<String, Object>();

		List<MealDto> meal = biz.selectMeal(subcat_id);
		List<String> food = biz.selectFood(subcat_id);

		res.put("meal", meal);
		res.put("food", food);

		return res;
	}

	@RequestMapping("/mealinfo.do")
	public String selectMeal(Model model, int id) {
		logger.info("INFO - REQUEST DETAIL [MEAL]");

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
	public boolean write(HttpSession session, @RequestBody String data) {
		logger.info("INFO - WRITE A COMMENT [MEAL]");

		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();
		int info_id = jo.get("info_id").getAsInt();
		String comment = jo.get("comment").getAsString();

		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		CommentDto dto = new CommentDto();

		int res = 0;

		try {
			dto.setInfo_id(info_id);
			dto.setContent(comment);
			dto.setUser_no(loginUser.getUser_no());

			res = cBiz.write(dto, 1);
		} catch (Exception e) {
			logger.error("ERROR - LOGIN DATA IS NOT FOUND");
			return false;
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/mcommupdate.do")
	@ResponseBody
	public boolean modify(HttpSession session, @RequestBody String data) {
		logger.info("INFO - MODIFY A COMMENT [MEAL]");

		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();
		int comm_no = jo.get("comm_no").getAsInt();
		String comment = jo.get("comment").getAsString();

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		int res = 0;

		try {
			CommentDto before = cBiz.read(comm_no, 1);

			if (before.getUser_no() != loginUser.getUser_no()) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return false;
			}

			CommentDto after = new CommentDto();
			after.setComm_no(comm_no);
			after.setContent(comment);

			res = cBiz.update(after, 1);

		} catch (Exception e) {
			logger.error("ERROR - LOGIN OR COMMENT DATA IS NOT FOUND");
			return false;
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/mcommdelete.do")
	@ResponseBody
	public boolean delete(HttpSession session, @RequestBody int comm_no) {
		logger.info("INFO - DELETE A COMMENT [MEAL]");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		int res = 0;

		try {
			CommentDto before = cBiz.read(comm_no, 1);
			if (before.getUser_no() != loginUser.getUser_no()) {
				logger.info("ERROR - UNAUTHORIZED USER");
				return false;
			}

			res = cBiz.delete(comm_no, 1);

		} catch (Exception e) {
			logger.error("ERROR - DELETE ERROR");
			return false;
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("prefer/meallist.do")
	public String preferMeal(HttpSession session, Model model) {
		logger.info("INFO - GET PREFER LIST [MEAL]");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		int user_no = 0;

		try {
			user_no = loginUser.getUser_no();
			List<Integer> prefer = biz.selectPreferCat(user_no);
			model.addAttribute("prefer", prefer);
			model.addAttribute("random", biz.selectRandom(user_no));
			model.addAttribute("comment", biz.selectByComment());
			try {
				model.addAttribute("meal", biz.selectMeal(prefer.get(0)));
			} catch (Exception e) {
				logger.error("ERROR - PRFERENCE IS NOT SET");
				model.addAttribute("msg", "선호도를 체크한 후에 이용이 가능합니다!");

				return "msg/alert";
			}
		} catch (Exception e) {
			logger.info("ERROR - LOGIN DATA IS NOT FOUND");
			return "redirect: ../loginform.do";
		}

		return "mealprefer";
	}

	@RequestMapping("prefer/mealreq.do")
	@ResponseBody
	public Map<String, Object> requestMeal(@RequestBody int subcat_id) {
		logger.info("INFO - AJAX REQUEST [MEAL]");

		Map<String, Object> res = new HashMap<String, Object>();
		List<MealDto> meal = biz.selectMeal(subcat_id);
		res.put("meal", meal);

		return res;
	}

}