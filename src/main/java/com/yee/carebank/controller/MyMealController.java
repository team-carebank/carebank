package com.yee.carebank.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.MyMealBiz;
import com.yee.carebank.model.dto.MyExerciseDto;
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

	@RequestMapping("/updateMealPopup.do")
	public String goUpdatePopup(HttpSession session, Model model, int record_id) {
		MyMealDto before = biz.selectOne(record_id);

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		try {
			if (before.getUser_no() != loginUser.getUser_no()) {
				return "redirect: main.do";
			}
		} catch (Exception e) {
			return "redirect: loginform.do";
		}
		model.addAttribute("before", before);

		return "updateMealPopup";
	}

	@RequestMapping("/updatemymeal.do")
	@ResponseBody
	public Boolean update(HttpSession session, @RequestBody MyMealDto dto) {
		int res = 0;

		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		MyMealDto before = biz.selectOne(dto.getRecord_id());

		try {
			// 만일 현재 로그인된 유저가 수정하려는 유저의 번호와 다르다면
			if (before.getUser_no() != loginUser.getUser_no()) {
				return false;
			}
		} catch (Exception e) {
			return false;
		}

		dto.setUser_no(loginUser.getUser_no());

		res = biz.update(dto);

		if (res > 0) {
			return true;
		} else {
			System.out.println("이런씨발");
			return false;
		}
	}

	@RequestMapping("/deletemymeal.do")
	@ResponseBody
	public Boolean delete(HttpSession session, @RequestBody MyMealDto dto) {
		int res = 0;
		int record_id = dto.getRecord_id();

		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		MyMealDto before = biz.selectOne(record_id);

		try {
			// 만일 현재 로그인된 유저가 수정하려는 유저의 번호와 다르다면
			if (before.getUser_no() != loginUser.getUser_no()) {
				return false;
			}
		} catch (Exception e) {
			return false;
		}

		res = biz.delete(record_id);

		if (res > 0) {
			return true;
		} else {
			System.out.println("이런씨발");
			return false;
		}
	}

	@RequestMapping("/mymeallist.do")
	@ResponseBody
	public Map<String, List<MyMealDto>> selectList(HttpSession session) {
		Map<String, List<MyMealDto>> map = new HashMap<String, List<MyMealDto>>();

		/*
		 * 로그인 기능 연결시 수정
		 */
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			map.put("res", biz.selectList(loginUser.getUser_no()));
		} catch (Exception e) {
			return null;
		}

		return map;
	}

	@RequestMapping("/submitmeal.do")
	@ResponseBody
	public Map<String, Boolean> record(HttpSession session, @RequestBody Map<String, String> param) {
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

		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		MyMealDto dto = new MyMealDto();
		dto.setMeal_name(meal_name);
		dto.setMeal_time(meal_time);
		dto.setRegdate(regdate);
		/*
		 * 로그인 기능 연결시 수정
		 */
		int res = 0;

		try {
			dto.setUser_no(loginUser.getUser_no());
			res = biz.insert(dto);
		} catch (Exception e) {
			res = -1;
		}

		if (res > 0) {
			map.put("res", true);
		} else {
			map.put("res", false);
		}
		return map;
	}

	@RequestMapping("/myexerlist.do")
	@ResponseBody
	public Map<String, List<MyExerciseDto>> selectExer(HttpSession session) {
		Map<String, List<MyExerciseDto>> map = new HashMap<String, List<MyExerciseDto>>();

		/*
		 * 로그인 기능 연결시 수정
		 */
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			map.put("res", biz.selectList(loginUser.getUser_no(), 1));
		} catch (Exception e) {
			return null;
		}

		return map;
	}

}