package com.yee.carebank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yee.carebank.model.biz.QnaBiz;
import com.yee.carebank.model.dto.QnaDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class QnaController {

	@Autowired
	private QnaBiz biz;
	
	private Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@RequestMapping("/qna.do")
	public String qna(Model model, HttpSession session) {
		logger.info("qna");
		
		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		
		List<QnaDto> list = null;
		if(loginUser != null) {
			list = biz.selectList(loginUser.getUser_no());
		}else {
			return "redirect:main.do";
		}
		
		model.addAttribute("list",list);
		return "qna";
		
	}
	
	@RequestMapping("/qnainsert.do")
	public String insert(QnaDto dto, HttpSession session) {
		logger.info("QNA INSERTFORM");
		return "qnaInsert";
		
	}
	
	@RequestMapping("/insertQna.do")
	public String insertQna(QnaDto dto, HttpSession session) {
		logger.info("QNA insert");
		
		System.out.println(dto);
		
		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		
		int res = 0;
		
		if(loginUser != null) {
			dto.setUser_no(loginUser.getUser_no());
			res = biz.insert(dto);
			
		}else {
			
		}
		if(res>0){
			return "redirect:qna.do";
		}else {
			
			return "redirect:main.do";
		}
		
	}
	
	@RequestMapping("/qnaupdateform.do")
	public String updateform(Model model, int qa_no) {
		logger.info("QNA updateForm");
		
		model.addAttribute("qna",biz.selectOne(qa_no));
		
		return "qnaupdate";
	}
	
	@RequestMapping("/updateQna.do")
	public String update(QnaDto dto) {
		logger.info("QNA UPDATE");
		
		int res = biz.update(dto);
		
		if(res>0) {
			return "redirect:qna.do?user_no="+dto.getUser_no();
		}else {
			return "redirect:qnaupdateform.do?user_no"+dto.getUser_no();
		}
			
	}
	
	@RequestMapping("/qnadelete.do")
	public String delete(int qa_no) {
		logger.info("QNA DELETE");
		
		int res = biz.delete(qa_no);
		
		if(res>0) {
			return "redirect:qna.do";
		}else {
			return "redirect:qnaupdateform.do";
		}
	}
	
	
	
	
	
	
}
