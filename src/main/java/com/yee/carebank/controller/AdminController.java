package com.yee.carebank.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yee.carebank.model.biz.AdminBiz;
import com.yee.carebank.model.biz.MealBiz;
import com.yee.carebank.model.dto.FoodDto;
import com.yee.carebank.model.dto.MealDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	AdminBiz biz;

	@Autowired
	MealBiz mBiz;

	@RequestMapping("admin/main.do")
	public String main(HttpSession session, Model model) {
		logger.info("INFO - ADMIN MAIN");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		List<MealDto> res = biz.selectMList(1);

		try {
			String userType = loginUser.getUser_type();
			if (!(userType).equals("ADMIN")) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return "redirect: ../main.do";
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN NOT FOUND");
			return "redirect: ../main.do";
		}

		model.addAttribute("res", res);
		model.addAttribute("cnt", biz.getMTotalCnt());
		model.addAttribute("page", 1);
		return "admin/mlist";
	}

	@RequestMapping("admin/meal.do")
	public String selectList(HttpSession session, Model model, @RequestParam("page") int page) {
		logger.info("INFO - GET LIST [MEAL]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		List<MealDto> res = null;

		try {
			String userType = loginUser.getUser_type();
			if (!(userType).equals("ADMIN")) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return "redirect: ../main.do";
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN NOT FOUND");
			return "redirect: ../main.do";
		}

		res = biz.selectMList(page);

		model.addAttribute("res", res);
		model.addAttribute("cnt", biz.getMTotalCnt());
		model.addAttribute("page", page);

		return "admin/mlist";
	}

	@RequestMapping("admin/minfo.do")
	public String selectMeal(HttpSession session, Model model, @RequestParam("id") int meal_id) {
		logger.info("INFO - GET DETAILS [MEAL]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			String userType = loginUser.getUser_type();
			if (!(userType).equals("ADMIN")) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return "redirect: ../main.do";
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN NOT FOUND");
			return "redirect: ../main.do";
		}

		model.addAttribute("meal", mBiz.selectOne(meal_id));
		model.addAttribute("food", mBiz.selectIngredient(meal_id));

		return "admin/minfo";
	}

	@RequestMapping("admin/mwrite.do")
	public String writeMeal(HttpSession session, Model model) {
		logger.info("INFO - INSERT PAGE [MEAL]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			String userType = loginUser.getUser_type();
			if (!(userType.equals("ADMIN"))) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return "redirect: ../main.do";
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN DATA NOT FOUND");
			return "redirect: ../main.do";
		}

		model.addAttribute("category", biz.selectCList());
		return "admin/mwrite";
	}

	@RequestMapping("admin/minsert.do")
	public String insertM(HttpSession session, Model model, MealDto meal, @RequestParam List<String> food,
			@RequestParam List<String> description, @RequestParam List<Double> carbo,
			@RequestParam List<Double> protein, @RequestParam List<Double> fat, @RequestParam List<Double> calories) {
		logger.info("INFO - INSERT DATA [MEAL]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			String userType = loginUser.getUser_type();
			if (!(userType.equals("ADMIN"))) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return "redirect: ../main.do";
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN DATA NOT FOUND");
			return "redirect: ../main.do";
		}

		List<FoodDto> foods = new ArrayList<FoodDto>();

		for (int i = 0; i < food.size(); i++) {
			FoodDto f = new FoodDto(food.get(i), description.get(i), carbo.get(i), protein.get(i), fat.get(i),
					calories.get(i));
			foods.add(f);
		}

		int res = biz.insertM(meal, foods);

		if (res > 0) {
			model.addAttribute("msg", "게시글이 작성되었습니다.");
		} else {
			model.addAttribute("msg", "게시글이 작성되지 않았습니다.");
		}

		return "redirect: meal.do";
	}

	@RequestMapping("admin/mmodi.do")
	public String updateMeal(HttpSession session, Model model, @RequestParam int meal_id) {
		logger.info("INFO - UPDATE PAGE [MEAL]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			String userType = loginUser.getUser_type();
			if (!(userType.equals("ADMIN"))) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return "redirect: ../main.do";
			} else {
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN DATA NOT FOUND");
			return "redirect: ../main.do";
		}

		model.addAttribute("meal", mBiz.selectOne(meal_id));
		model.addAttribute("food", mBiz.selectIngredient(meal_id));
		model.addAttribute("category", biz.selectCList());

		return "admin/mmodify";

	}

	@RequestMapping("admin/mmodify.do")
	public String updateM(HttpSession session, Model model, MealDto meal, @RequestParam List<String> food,
			@RequestParam List<String> description, @RequestParam List<Double> carbo,
			@RequestParam List<Double> protein, @RequestParam List<Double> fat, @RequestParam List<Double> calories) {
		logger.info("INFO - MODIFY DATA [MEAL]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			String userType = loginUser.getUser_type();
			if (!(userType.equals("ADMIN"))) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return "redirect: ../main.do";
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN DATA NOT FOUND");
			return "redirect: ../main.do";
		}

		List<FoodDto> foods = new ArrayList<FoodDto>();

		for (int i = 0; i < food.size(); i++) {
			FoodDto f = new FoodDto(food.get(i), description.get(i), carbo.get(i), protein.get(i), fat.get(i),
					calories.get(i));
			foods.add(f);
		}

		int res = biz.updateM(meal, foods);

		if (res > 0) {
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "게시글이 삭제되지 못하였습니다.");
		}

		return "redirect: meal.do";
	}

	@RequestMapping("admin/mdel.do")
	public String deleteMeal(HttpSession session, Model model, @RequestParam int meal_id) {
		logger.info("INFO - DELETE DATA [MEAL]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			String userType = loginUser.getUser_type();
			if (!(userType.equals("ADMIN"))) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return "redirect: ../main.do";
			} else {
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN DATA NOT FOUND");
			return "redirect: ../main.do";
		}

		int res = biz.deleteMeal(meal_id);

		if (res > 0) {
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "게시글이 삭제되지 못하였습니다.");
		}

		return "redirect: meal.do";
	}

	/*
	 * Exception Handler - Missing Parameter Exception
	 */
	@ExceptionHandler(MissingServletRequestParameterException.class)
	public void handleMissingParams(MissingServletRequestParameterException e, HttpServletResponse response,
			HttpServletRequest request) {
		logger.error("ERROR - MISSING PARAMETER");
		String url = request.getRequestURL().toString();
		String redirectURL = null;
		if (url.contains("meal.do")) {
			redirectURL = "/carebank/admin/meal.do?page=1";
		} else if (url.contains("admin/m")) {
			redirectURL = "/carebank/admin/meal.do?page=1";
		}
		try {
			response.sendRedirect(redirectURL);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}