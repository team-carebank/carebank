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

import com.yee.carebank.model.biz.Admin2ndBiz;
import com.yee.carebank.model.biz.Admin1stBiz;
import com.yee.carebank.model.dto.EfficacyDto;
import com.yee.carebank.model.dto.SuppleDto;
import com.yee.carebank.model.dto.UserDto;

import static com.yee.carebank.controller.Admin1stController.check;
import static com.yee.carebank.controller.Admin1stController.redirectPath;

import java.util.List;

import static com.yee.carebank.controller.Admin1stController.handleMissingParams;

@Controller
public class Admin2ndController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	Admin1stBiz a1;

	@Autowired
	Admin2ndBiz a2;

	@RequestMapping("admin/supple.do")
	public String selectList(HttpSession session, Model model, @RequestParam("page") int page) {
		logger.info("GET LIST [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		List<SuppleDto> res = a2.selectSupple(page);

		model.addAttribute("res", res);
		model.addAttribute("maps", a2.selectCatBySId(res));
		model.addAttribute("cnt", a2.getSuppleCnt());
		model.addAttribute("page", page);
		model.addAttribute("category", a1.selectCList());

		return "admin/supple/list";
	}

	@RequestMapping("admin/sinfo.do")
	public String selectOne(HttpSession session, Model model, @RequestParam("id") int supple_id) {
		logger.info("GET ITEM [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		EfficacyDto res = a2.selectEffi(supple_id);
		model.addAttribute("res", res);

		return "admin/supple/detail";
	}

	@RequestMapping("admin/swrite.do")
	public String write(HttpSession session, Model model) {
		logger.info("WRITE PAGE [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		model.addAttribute("category", a1.selectCList());

		return "admin/supple/write";
	}

	@RequestMapping("admin/sinsert.do")
	public String insert(HttpSession session, Model model, EfficacyDto dto) {
		logger.info("INSERT DATA [SUPPLEMENT])");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a2.updateS(dto);

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

		EfficacyDto res = a2.selectEffi(supple_id);
		model.addAttribute("res", res);
		model.addAttribute("category", a1.selectCList());

		return "admin/supple/modify";

	}

	@RequestMapping("admin/supdate.do")
	public String update(HttpSession session, Model model, EfficacyDto dto) {
		logger.info("UPDATE DATA [SUPPLEMENT])");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a2.updateS(dto);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 수정되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 수정되지 않았습니다.");
		}
		model.addAttribute("url", "sinfo.do?id=" + dto.getSupple().getSupple_id());

		return redirectPath;
	}

	@RequestMapping("admin/sdel.do")
	public String delete(HttpSession session, Model model, @RequestParam("id") int supple_id) {
		logger.info("DELETE DATA [SUPPLEMENT]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a2.deleteSupple(supple_id);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 삭제되지 않았습니다.");
		}
		model.addAttribute("url", "supple.do");

		return redirectPath;

	}

	@RequestMapping("admin/ssearch.do")
	public String search(HttpSession session, Model model, @RequestParam("search") String searchType,
			@RequestParam("keyword") String keyword, @RequestParam("page") int page) {
		logger.info("SEARCH LIST [SUPPLEMENT] KEYWORD=" + keyword + "SEARCH TYPE=" + searchType);
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		List<SuppleDto> res = a2.searchSupple(searchType, keyword, page);

		model.addAttribute("res", res);
		model.addAttribute("maps", a2.selectCatBySId(res));
		model.addAttribute("cnt", a2.getSuppleCount(searchType, keyword));
		model.addAttribute("page", page);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", a1.selectCList());

		return "admin/supple/search";
	}

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public void exceptionHandler(MissingServletRequestParameterException e, HttpServletResponse response,
			HttpServletRequest request) {
		handleMissingParams(e, response, request);
	}

}
