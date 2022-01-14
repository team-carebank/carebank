package com.yee.carebank.controller;

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

import com.yee.carebank.model.biz.AdminBiz;
import com.yee.carebank.model.dto.EfficacyDto;
import com.yee.carebank.model.dto.SuppleDto;
import com.yee.carebank.model.dto.UserDto;

import static com.yee.carebank.controller.AdminController.check;
import static com.yee.carebank.controller.AdminController.redirectPath;

import java.util.List;

import static com.yee.carebank.controller.AdminController.handleMissingParams;

@Controller
public class Admin2ndController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	AdminBiz biz;

	@RequestMapping("admin/supple.do")
	public String selectList(HttpSession session, Model model, @RequestParam("page") int page) {
		logger.info("GET LIST [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		List<SuppleDto> res = biz.selectSupple(page);

		model.addAttribute("res", res);
		model.addAttribute("maps", biz.selectCatBySId(res));
		model.addAttribute("cnt", biz.getSuppleCnt());
		model.addAttribute("page", page);
		model.addAttribute("category", biz.selectCList());

		return "admin/supple/list";
	}

	@RequestMapping("admin/sinfo.do")
	public String selectOne(HttpSession session, Model model, @RequestParam("id") int supple_id) {
		logger.info("GET ITEM [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		EfficacyDto res = biz.selectEffi(supple_id);
		model.addAttribute("res", res);

		return "admin/supple/detail";
	}

	@RequestMapping("admin/smodi.do")
	public String modify(HttpSession session, Model model, @RequestParam("id") int supple_id) {
		logger.info("MODIFY PAGE [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirec: ../main.do";
		}

		EfficacyDto res = biz.selectEffi(supple_id);
		model.addAttribute("res", res);
		model.addAttribute("category", biz.selectCList());

		return "admin/supple/modify";

	}

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public void exceptionHandler(MissingServletRequestParameterException e, HttpServletResponse response,
			HttpServletRequest request) {
		handleMissingParams(e, response, request);
	}

}
