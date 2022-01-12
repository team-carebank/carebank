package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yee.carebank.model.biz.MyExerciseBiz;
import com.yee.carebank.model.dto.MyExerciseDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class MyExerController {
	private static Logger logger = LoggerFactory.getLogger(ExerciseController.class);

	@Autowired
	private MyExerciseBiz biz; 

	@RequestMapping(value = "/")
	public String selectList(Model model,HttpSession session,@RequestBody MyExerciseDto dto,int user_no) {
		logger.info("myexerciselist");
		 
		System.out.println("user넘버두번째:"+dto.getUser_no());
		
		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		dto.setUser_no(loginUser.getUser_no());
		
		model.addAttribute("mylist", biz.selectList(user_no));

		return "myexerlist.do/selectList";

	}
 
 

	@RequestMapping(value = "/inserttest", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public int inserttest(HttpSession session, @RequestBody MyExerciseDto dto) {
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		try {
			dto.setUser_no(loginUser.getUser_no());
		} catch (Exception e) {
			return -1;
		}
		int res = biz.insert(dto);
		if (res > 0) {
			System.out.println("insert성공!!!!!!!");
		} else {
			System.out.println("실");
		}
		return res;
	}
 
}
