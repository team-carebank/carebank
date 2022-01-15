package com.yee.carebank.controller;

import static com.yee.carebank.controller.Admin1stController.check;
import static com.yee.carebank.controller.Admin1stController.handleMissingParams;
import static com.yee.carebank.controller.Admin1stController.redirectPath;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yee.carebank.model.biz.Admin1stBiz;
import com.yee.carebank.model.biz.Admin3rdBiz;
import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class Admin3rdController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	Admin3rdBiz a3;

	@Autowired
	Admin1stBiz a1;

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public void exceptionHandler(MissingServletRequestParameterException e, HttpServletResponse response,
			HttpServletRequest request) {
		handleMissingParams(e, response, request);
	}

	@RequestMapping("admin/exer.do")
	public String selectExerList(HttpSession session, Model model, @RequestParam("page") int page) {
		logger.info("GET LIST [EXERCISE]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		List<ExerciseDto> res = a3.selectExerList(page);

		model.addAttribute("res", res);
		model.addAttribute("cnt", a3.getExerCnt());
		model.addAttribute("page", page);
		model.addAttribute("category", a1.selectCList());

		return "admin/exer/list";
	}

	@RequestMapping("admin/einfo.do")
	public String selectExer(HttpSession session, Model model, @RequestParam("id") int exer_id) {
		logger.info("GET DATA [EXERCISE]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		ExerciseDto exer = a3.selectExer(exer_id);

		model.addAttribute("exer", exer);

		return "admin/exer/detail";
	}

	@RequestMapping("admin/ewrite.do")
	public String writeExer(HttpSession session, Model model) {
		logger.info("WRITE PAGE [EXERCISE]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		model.addAttribute("category", a1.selectCList());

		return "admin/exer/write";
	}

	@RequestMapping("admin/einsert.do")
	public String insertExer(HttpSession session, Model model, ExerciseDto dto) {
		logger.info("INSERT DATA [EXERCISE]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a3.insertExer(dto);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 추가되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 추가되지 않았습니다. 이미 데이터가 존재합니다.");
		}

		model.addAttribute("url", "exer.do");

		return redirectPath;
	}

	@RequestMapping("admin/emodi.do")
	public String modifyExer(HttpSession session, Model model, @RequestParam("id") int exer_id) {
		logger.info("MODIFY PAGE [EXERCISE]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		ExerciseDto res = a3.selectExer(exer_id);
		model.addAttribute("res", res);
		model.addAttribute("category", a1.selectCList());

		return "admin/exer/modify";
	}

	@RequestMapping("admin/eupdate.do")
	public String updateExer(HttpSession session, Model model, ExerciseDto dto) {
		logger.info("UPDATE DATA [EXERCISE]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a3.updateExer(dto);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 수정되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 수정되지 않았습니다.");
		}

		model.addAttribute("url", "exer.do");

		return redirectPath;
	}

	@RequestMapping("admin/edel.do")
	public String deleteExer(HttpSession session, Model model, @RequestParam("id") int exer_id) {
		logger.info("DELETE DATA [EXERCISE]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a3.deleteExer(exer_id);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 삭제되지 않았습니다.");
		}

		model.addAttribute("url", "exer.do");

		return redirectPath;
	}

	@RequestMapping("admin/esearch.do")
	public String searchExer(HttpSession session, Model model, @RequestParam("keyword") String keyword,
			@RequestParam("search") String searchType, @RequestParam("page") int page) {
		logger.info("SEARCH DATA [EXERCISE]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		model.addAttribute("res", a3.searchExer(searchType, keyword, page));
		model.addAttribute("cnt", a3.getExerCntBySearch(searchType, keyword));
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", page);
		model.addAttribute("category", a1.selectCList());

		return "admin/exer/search";

	}
}
