package com.yee.carebank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.dto.UserDto;

@Controller
public class AdminController {

	@RequestMapping("admin/main.do")
	public String main(HttpSession session) {
		UserDto loginUser = (UserDto) session.getAttribute("session");

		/*
		 * try { String userType = loginUser.getUser_type(); if
		 * (!(userType).equals("ADMIN")) { return "redirect:main.do"; } } catch
		 * (Exception e) { return "redirect:main.do"; }
		 */

		return "admin/adminmain";
	}
}
