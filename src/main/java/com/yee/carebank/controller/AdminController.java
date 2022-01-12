package com.yee.carebank.controller;

import java.io.IOException;
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
import org.springframework.web.servlet.resource.HttpResource;

import com.yee.carebank.model.biz.AdminBiz;
import com.yee.carebank.model.biz.MealBiz;
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
				logger.error("ERROR - NOT AUTHORIZED USER");
				return "redirect: ../main.do";
			} else {
				model.addAttribute("res", res);
				model.addAttribute("cnt", biz.getMTotalCnt());
				model.addAttribute("page", 1);
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN NOT FOUND");
			return "redirect: ../main.do";
		}

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
				logger.error("ERROR - NOT AUTHORIZED USER");
				return "redirect: ../main.do";
			} else {
				res = biz.selectMList(page);

				model.addAttribute("res", res);
				model.addAttribute("cnt", biz.getMTotalCnt());
				model.addAttribute("page", page);
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN NOT FOUND");
			return "redirect: ../main.do";
		}

		return "admin/mlist";
	}

	@RequestMapping("admin/minfo.do")
	public String selectMeal(HttpSession session, Model model, @RequestParam("id") int meal_id) {
		logger.info("INFO - GET DETAILS [MEAL]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			String userType = loginUser.getUser_type();
			if (!(userType).equals("ADMIN")) {
				logger.error("ERROR - NOT AUTHORIZED USER");
				return "redirect: ../main.do";
			} else {
				model.addAttribute("meal", mBiz.selectOne(meal_id));
				model.addAttribute("food", mBiz.selectIngredient(meal_id));
			}
		} catch (Exception e) {
			logger.error("ERROR - LOGIN NOT FOUND");
			return "redirect: ../main.do";
		}

		return "admin/minfo";
	}

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public void handleMissingParams(MissingServletRequestParameterException e, HttpServletResponse response,
			HttpServletRequest request) {
		logger.error("ERROR - MISSING PARAMETER");
		String url = request.getRequestURL().toString();
		String redirectURL = null;
		if (url.contains("meal.do")) {
			redirectURL = "/carebank/admin/meal.do?page=1";
		}
		try {
			response.sendRedirect(redirectURL);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}