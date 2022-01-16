package com.yee.carebank.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.MoodBiz;
import com.yee.carebank.model.biz.PillsBiz;
import com.yee.carebank.model.biz.ScheduleBiz;
import com.yee.carebank.model.dto.MoodDto;
import com.yee.carebank.model.dto.PillsDto;
import com.yee.carebank.model.dto.ScheduleDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class FullCalendarController {

	@Autowired
	private ScheduleBiz sBiz;

	@Autowired
	private MoodBiz mBiz;

	@Autowired
	private PillsBiz pBiz;

	private Logger logger = LoggerFactory.getLogger(FullCalendarController.class);

	@RequestMapping("/diary.do")
	public String diary(Model model, HttpSession session) {
		logger.info("mypage_diary");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		List<ScheduleDto> list = null;
		List<PillsDto> Pills = null;

		if (loginUser != null) {
			list = sBiz.selectList(loginUser.getUser_no());
			Pills = pBiz.selectList(loginUser.getUser_no());
		} else {
			return "redirect: main.do";
		}

		model.addAttribute("dto", list); // list
		model.addAttribute("pills", Pills);
		return "mypage_diary";
	}

	@RequestMapping("/schedulePopup.do")
	public String schedule() {
		logger.info("mypage_schedulePopup");
		return "schedulePopup";
	}

	@RequestMapping("/moodPopup.do")
	public String mood() {
		logger.info("mood");
		return "moodPopup";
	}

	@RequestMapping("/schedule.do")
	public String update(Model model, int hospital_no) {
		logger.info("schedule");

		System.out.println(hospital_no);
		model.addAttribute("dto", sBiz.selectOne(hospital_no));
		return "updatePopup";
	}

	@ResponseBody
	@RequestMapping(value = "/scheduleupdate.do", method = RequestMethod.POST)
	public String updateSchedule(HttpSession session, @RequestBody Map<String, String> data) {
		logger.info("update schedule");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		ScheduleDto dto = new ScheduleDto(Integer.parseInt(data.get("hospital_no")), 0, data.get("hospital_name"), null,
				null, data.get("memo"));

		Date new_regdate = new Date(data.get("regdate").replace('T', ' ').replace('-', '/'));
		dto.setRegdate(new_regdate);
		Date new_resdate = new Date(data.get("resdate").replace('T', ' ').replace('-', '/'));
		dto.setResdate(new_resdate);

		int res = 0;
		try {
			dto.setUser_no(loginUser.getUser_no());
			res = sBiz.update(dto);
		} catch (Exception e) {
			return "-1";
		}

		String st = Integer.toString(res);

		return st;

	}

	@ResponseBody
	@RequestMapping(value = "/addschedule.do", method = RequestMethod.POST)
	public Map<Object, Object> insert(HttpSession session, @RequestBody Map<String, String> data) {
		logger.info("insert");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		ScheduleDto dto = new ScheduleDto(0, 0, data.get("hospital_name"), null, null, data.get("memo"));

		Date new_regdate = new Date(data.get("regdate").replace('T', ' ').replace('-', '/'));
		dto.setRegdate(new_regdate);
		Date new_resdate = new Date(data.get("resdate").replace('T', ' ').replace('-', '/'));
		dto.setResdate(new_resdate);

		Map<Object, Object> map = new HashMap<Object, Object>();

		int res = 0;
		try {
			dto.setUser_no(loginUser.getUser_no());
			res = sBiz.insert(dto);
		} catch (Exception e) {
			res = -1;
		}

		map.put("res", res);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/moodschedule.do", method = RequestMethod.POST)
	public Map<Object, Object> insert(@RequestBody MoodDto dto, HttpSession session) {
		logger.info("MOOD INSERT");
		Map<Object, Object> map = new HashMap<Object, Object>();

		int res = mBiz.insert(dto);

		map.put("res", res);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/scheduledelete.do", method = RequestMethod.POST)
	public String delete(@RequestBody ScheduleDto dto) {
		logger.info("schedule delete");

		int res = sBiz.delete(dto);

		String hosp = Integer.toString(res);

		return hosp;
	}

	@RequestMapping("/pillsPopup.do")
	public String pills() {
		logger.info("pills schedule");
		return "pillsPopup";
	}

	@ResponseBody
	@RequestMapping(value = "/pillschedule.do", method = RequestMethod.POST)
	public String pillsinsert(@RequestBody PillsDto dto, HttpSession session) {
		logger.info("insert pills");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		if (loginUser != null) {
			dto.setUser_no(loginUser.getUser_no());
		} else {
			dto.setUser_no(1011);
		}

		int res = pBiz.insert(dto);

		String pills = Integer.toString(res);

		return pills;
	}

	@RequestMapping("/pillsDelete.do")
	public String pillsdelete(int pills_no) {
		logger.info("PillsInfo delete");

		int res = pBiz.delete(pills_no);

		if (res > 0) {
			return "redirect:diary.do";
		} else {
			return "redirect:diary.do";
		}
	}
}
