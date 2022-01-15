package com.yee.carebank.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.AMemberBiz;
import com.yee.carebank.model.biz.UserBiz;
import com.yee.carebank.model.dto.UserDto;

import static com.yee.carebank.controller.Admin1stController.*;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AMemberController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	AMemberBiz biz;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("admin/user.do")
	public String selectList(HttpSession session, Model model, @RequestParam("page") int page) {
		logger.info("SELECT LIST [MEMBER]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		List<UserDto> res = biz.selectList(page);

		model.addAttribute("res", res);
		model.addAttribute("cnt", biz.getCnt());
		model.addAttribute("page", page);

		return "admin/user/list";
	}

	@RequestMapping("admin/ustate.do")
	@ResponseBody
	public boolean updateStatus(HttpSession session, int user_no) {
		logger.info("AJAX REQUEST [MEMBER]");

		if (check((UserDto) session.getAttribute("login_info"))) {
			return false;
		}

		UserDto user = biz.selectByNo(user_no);

		int res = 0;
		if (user.getEnabled_yn().equals("Y")) {
			res = biz.updateEnabled(user_no, "disable");
		} else {
			res = biz.updateEnabled(user_no, "enable");
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("admin/upwd.do")
	public String updatePage(HttpSession session, Model model, @RequestParam("no") int user_no) {
		logger.info("LOAD UPDATE PAGE [MEMBER]");

		if (check((UserDto) session.getAttribute("login_info"))) {
			return "redirect: ../main.do";
		}

		UserDto user = biz.selectByNo(user_no);
		model.addAttribute("user_no", user_no);
		model.addAttribute("user_id", user.getUser_id());
		model.addAttribute("user_name", user.getUser_name());

		return "admin/user/pwd";
	}

	@RequestMapping("admin/updatepwd.do")
	@ResponseBody
	public boolean updatePasswrod(HttpSession session, @RequestParam("no") int user_no,
			@RequestParam("pw") String user_pw) {
		logger.info("AJAX REQUEST [MEMBER]");

		if (check((UserDto) session.getAttribute("login_info"))) {
			return false;
		}

		UserDto dto = new UserDto();
		dto.setUser_no(user_no);
		dto.setUser_pw(passwordEncoder.encode(user_pw));

		int res = biz.updatePassword(dto);

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("admin/usearch.do")
	public String search(HttpSession session, Model model, @RequestParam("keyword") String keyword,
			@RequestParam("search") String searchType, @RequestParam("page") int page) {
		logger.info("SEARCH KEYWORD [MEMBER] : KEYWORD = " + keyword + ", SEARCH TYPE = " + searchType);
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		if (keyword.equals("all") & searchType.equals("type")) {
			return "redirect: user.do";
		}

		model.addAttribute("res", biz.search(searchType, keyword, page));
		model.addAttribute("cnt", biz.getCnt(searchType, keyword));
		model.addAttribute("keyword", keyword);
		model.addAttribute("search", searchType);
		model.addAttribute("page", page);

		return "admin/user/search";
	}

	@RequestMapping("admin/ustat.do")
	public String getStat(HttpSession session, Model model) {
		logger.info("GET STATISTICS DATA");

		if (check((UserDto) session.getAttribute("login_info"))) {
			return "redirect: ../main.do";
		}

		model.addAttribute("mymeal", biz.getStat("MY_MEAL"));
		model.addAttribute("myexer", biz.getStat("MY_EXERCISE"));
		model.addAttribute("myvisit", biz.getStat("MY_VISIT"));
		model.addAttribute("mypills", biz.getStat("MY_PILLS"));
		model.addAttribute("mcomment", biz.getStat("MEAL_COMMENT"));
		model.addAttribute("scomment", biz.getStat("SUPPLE_COMMENT"));

		return "admin/user/stat";
	}

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public void exceptionHandler(MissingServletRequestParameterException e, HttpServletResponse response,
			HttpServletRequest request) {
		handleMissingParams(e, response, request);
	}
}
