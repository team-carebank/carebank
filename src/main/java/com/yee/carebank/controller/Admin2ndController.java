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

	@RequestMapping("admin/swrite.do")
	public String write(HttpSession session, Model model) {
		logger.info("MODIFY PAGE [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		model.addAttribute("category", biz.selectCList());

		return "admin/supple/write";
	}

	@RequestMapping("admin/sinsert.do")
	public String insert(HttpSession session, Model model, EfficacyDto dto) {
		logger.info("INSERT DATA [SUPPLEMENT])");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = biz.updateS(dto);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 추가되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 추가되지 않았습니다.");
		}
		model.addAttribute("url", "supple.do");

		return redirectPath;
	}

	@RequestMapping("admin/smodi.do")
	public String modify(HttpSession session, Model model, @RequestParam("id") int supple_id) {
		logger.info("MODIFY PAGE [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		EfficacyDto res = biz.selectEffi(supple_id);
		model.addAttribute("res", res);
		model.addAttribute("category", biz.selectCList());

		return "admin/supple/modify";

	}

	@RequestMapping("admin/supdate.do")
	public String update(HttpSession session, Model model, EfficacyDto dto) {
		logger.info("UPDATE DATA [SUPPLEMENT])");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = biz.updateS(dto);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 수정되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 수정되지 않았습니다.");
		}
		model.addAttribute("url", "supple.do");

		return redirectPath;
	}

	@RequestMapping("admin/sdel.do")
	public String delete(HttpSession session, Model model, @RequestParam("id") int supple_id) {
		logger.info("DELETE DATA [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = biz.deleteSupple(supple_id);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 삭제되지 않았습니다.");
		}
		model.addAttribute("url", "supple.do");

		return redirectPath;

	}

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public void exceptionHandler(MissingServletRequestParameterException e, HttpServletResponse response,
			HttpServletRequest request) {
		handleMissingParams(e, response, request);
	}

}
