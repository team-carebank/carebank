package com.yee.carebank.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.MyMealBiz;
import com.yee.carebank.model.dto.MyMealDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class MyMealController {
	@Autowired
	MyMealBiz biz;

	@RequestMapping("/mealPopup.do")
	public String goPopup() {
		return "mealPopup";
	}

	@RequestMapping("/mymeallist.do")
	@ResponseBody
	public Map<String, List<MyMealDto>> selectList(HttpServletRequest request) {
		Map<String, List<MyMealDto>> map = new HashMap<String, List<MyMealDto>>();

		/*
		 * 로그인 기능 연결시 수정
		 */
		UserDto loginUser = (UserDto) request.getSession().getAttribute("login_info");
		if (loginUser != null) {
			map.put("res", biz.selectList(loginUser.getUser_no()));
		} else {
			map.put("res", biz.selectList(1011));
		}

		return map;
	}

	@RequestMapping("/mymealdetail.do")
	@ResponseBody
	public Map<String, MyMealDto> selectOne(HttpServletRequest request, int record_id) {
		Map<String, MyMealDto> map = new HashMap<String, MyMealDto>();

		/*
		 * 로그인 기능 연결시 수정
		 */
		UserDto loginUser = (UserDto) request.getSession().getAttribute("login_info");

		MyMealDto res = biz.selectOne(record_id);

		/*
		 * if loginUser.user_no equals res.user_no인 경우에만 가져오도록 수정
		 */

		map.put("res", res);

		return map;
	}

	@RequestMapping("/submitmeal.do")
	@ResponseBody
	public Map<String, Boolean> record(HttpServletRequest request, @RequestBody Map<String, String> param) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();

		String meal_name = param.get("meal_name");
		String meal_time = param.get("meal_time");
		Date regdate = null;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			regdate = (Date) transFormat.parse(param.get("regdate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		MyMealDto dto = new MyMealDto();
		dto.setMeal_name(meal_name);
		dto.setMeal_time(meal_time);
		dto.setRegdate(regdate);
		/*
		 * 로그인 기능 연결시 수정
		 */
		UserDto loginUser = (UserDto) request.getSession().getAttribute("login");
		if (loginUser != null) {
			dto.setUser_no(loginUser.getUser_no());
		} else {
			dto.setUser_no(1011);
		}

		int res = biz.insert(dto);

		if (res > 0) {
			map.put("res", true);
		} else {
			map.put("res", false);
		}
		return map;
	}
}