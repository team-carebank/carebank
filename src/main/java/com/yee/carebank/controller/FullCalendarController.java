package com.yee.carebank.controller;

import java.util.HashMap;
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
import com.yee.carebank.model.biz.ScheduleBiz;
import com.yee.carebank.model.dto.MoodDto;
import com.yee.carebank.model.dto.ScheduleDto;

@Controller
public class FullCalendarController {

	@Autowired
	private ScheduleBiz sBiz;
	
	@Autowired
	private MoodBiz mBiz;
	
	
	private Logger logger = LoggerFactory.getLogger(FullCalendarController.class);
	
	
	@RequestMapping("/diary.do")
	public String diary(Model model, HttpSession session) {
		logger.info("mypage_diary");
		
		session.getAttribute("insert");
		
		model.addAttribute("dto", sBiz.selectList());
		
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
		model.addAttribute("dto",sBiz.selectOne(hospital_no));
		return "updatePopup";
	}
	
	@ResponseBody
	@RequestMapping(value="/scheduleupdate.do", method=RequestMethod.POST)
	public String updateSchedule(@RequestBody ScheduleDto dto) {
		logger.info("update schedule");
		
		int res = sBiz.update(dto);

		  String st = Integer.toString(res);
		  
		  return st;
		 
	}
	
	@ResponseBody
	@RequestMapping(value="/addschedule.do", method=RequestMethod.POST) 
	public Map<Object, Object> insert(HttpSession session, @RequestBody ScheduleDto dto) {
		logger.info("insert");
		
		session.setAttribute("insert", dto.getUser_no());
		
		Map<Object, Object>map = new HashMap<Object, Object>();

		int res = sBiz.insert(dto);

		
		map.put("res", res);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/moodschedule.do", method= RequestMethod.POST)
	public Map<Object, Object> insert(@RequestBody MoodDto dto, HttpSession session) {
		logger.info("MOOD INSERT");
		Map<Object, Object>map = new HashMap<Object, Object>();
		
		int res = mBiz.insert(dto);
		
		map.put("res", res);
		
		return map;
	}	
	
	@ResponseBody
	@RequestMapping(value="/scheduledelete.do", method=RequestMethod.POST)
	public String delete(@RequestBody ScheduleDto dto) {
		logger.info("schedule delete");
		
		int res = sBiz.delete(dto);
		
		String hosp = Integer.toString(res);
		
		return hosp;
	}
	
}
