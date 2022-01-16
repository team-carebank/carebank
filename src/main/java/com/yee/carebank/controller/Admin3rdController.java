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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.Admin1stBiz;
import com.yee.carebank.model.biz.Admin3rdBiz;
import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.MeditationDto;
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

	/*
	 * 운동 CRUD + SEARCH
	 */

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
		model.addAttribute("url", "einfo.do?id=" + dto.getExer_id());

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
	/*
	 * <!-- 운동 끝 --> <!-- 명상 시작 -->
	 */

	@RequestMapping("admin/medi.do")
	public String selectMList(HttpSession session, Model model, @RequestParam("page") int page) {
		logger.info("GET LIST [MEDITATION]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		List<MeditationDto> res = a3.selectMediList(page);

		model.addAttribute("res", res);
		model.addAttribute("cnt", a3.getMediCnt());
		model.addAttribute("page", page);
		model.addAttribute("category", a1.selectCList());

		return "admin/medi/list";
	}

	@RequestMapping("admin/mtinfo.do")
	public String selectMOne(HttpSession session, Model model, @RequestParam("id") int exer_id) {
		logger.info("GET DATA [MEDITATION]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		MeditationDto res = a3.selectMedi(exer_id);

		model.addAttribute("res", res);

		return "admin/medi/detail";
	}

	@RequestMapping("admin/mtwrite.do")
	public String writeMedi(HttpSession session, Model model) {
		logger.info("WRITE PAGE [MEDITATION]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		model.addAttribute("category", a1.selectCList());

		return "admin/medi/write";
	}

	@RequestMapping("admin/mtinsert.do")
	public String insertMedi(HttpSession session, Model model, MeditationDto dto) {
		logger.info("INSERT DATA [MEDITATION]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a3.insertMedi(dto);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 추가되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 추가되지 않았습니다. 이미 데이터가 존재합니다.");
		}

		model.addAttribute("url", "medi.do");

		return redirectPath;
	}

	@RequestMapping("admin/mtmodi.do")
	public String modiMedi(HttpSession session, Model model, @RequestParam("id") int meditate_id) {
		logger.info("MODIFY PAGE [MEDITATION]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		MeditationDto res = a3.selectMedi(meditate_id);
		model.addAttribute("res", res);
		model.addAttribute("category", a1.selectCList());

		return "admin/medi/modify";
	}

	@RequestMapping("admin/mtupdate.do")
	public String updateMedi(HttpSession session, Model model, MeditationDto dto) {
		logger.info("UPDATE DATA [MEDITATION]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a3.updateMedi(dto);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 수정되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 수정되지 않았습니다.");
		}
		model.addAttribute("url", "mtinfo.do?id=" + dto.getMeditate_id());

		return redirectPath;
	}

	@RequestMapping("admin/mtdel.do")
	public String deleteMedi(HttpSession session, Model model, @RequestParam("id") int meditate_id) {
		logger.info("DELETE DATA [MEDITATION]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		int res = a3.deleteMedi(meditate_id);

		if (res > 0) {
			model.addAttribute("msg", "데이터가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "데이터가 삭제되지 않았습니다.");
		}

		model.addAttribute("url", "medi.do");

		return redirectPath;
	}

	@RequestMapping("admin/mtsearch.do")
	public String searchMedi(HttpSession session, Model model, @RequestParam("keyword") String keyword,
			@RequestParam("search") String searchType, @RequestParam("page") int page) {
		logger.info("SEARCH DATA [MEDITATION]");
		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (check(loginUser)) {
			return "redirect: ../main.do";
		}

		model.addAttribute("res", a3.searchMedi(searchType, keyword, page));
		model.addAttribute("cnt", a3.getMediCnt(searchType, keyword));
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", page);
		model.addAttribute("category", a1.selectCList());

		return "admin/medi/search";
	}

	@RequestMapping("admin/mtplay.do")
	public String selectPlaylist(HttpSession session, Model model, @RequestParam("id") int meditate_id) {
		logger.info("GET PLAYLIST DATA [MEDITATION]");

		if (check((UserDto) session.getAttribute("login_info"))) {
			return "redirect: ../main.do";
		}

		model.addAttribute("res", a3.selectPlaylist(meditate_id));

		return "admin/medi/api";
	}

	@RequestMapping("admin/mtapi.do")
	@ResponseBody
	public boolean updatePlaylist(HttpSession session, MeditationDto dto) {
		logger.info("UPDATE PLAYLIST DATA [MEDITATION]");

		if (check((UserDto) session.getAttribute("login_info"))) {
			return false;
		}

		int res = a3.updatePlaylist(dto);

		if (res > 0)
			return true;
		else
			return false;
	}
}
