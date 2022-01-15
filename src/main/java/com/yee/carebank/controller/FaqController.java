package com.yee.carebank.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.FaqBiz;
import com.yee.carebank.model.dto.FaqDto;
import com.yee.carebank.model.dto.UserDto;



@Controller
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqBiz faqbiz;
	
	//조회
	@RequestMapping("/faqlist.do")
	public String list(Model model) {
		logger.info("FAQ LIST");
		
		model.addAttribute("list", faqbiz.selectList());
		return "faq";
	}
	
	//디테일
	@RequestMapping("/faqDetail.do")
	public String faqdetail(Model model, int faqno) {
		logger.info("FAQ DETAIL");
		
		model.addAttribute("faqdetail", faqbiz.selectOne(faqno));
		return "faqdetail";
	}
	
	//작성 form
	@RequestMapping("/faqform.do")
	public String faqform() {
		logger.info("FAQ INSERT FORM");
		
		return "faqinsert";
	}
	
	//작성 
	@RequestMapping("/faqPopup.do")
	public String faqPopup() {
		return "faqPopup";
	}
	
	
	@RequestMapping("/faqinsert.do")

	@ResponseBody
	public int faqinsert(@RequestBody FaqDto newfaq) {
		logger.info("FAQ INSERT");
		
		int res = faqbiz.insert(newfaq);
		
		if(res > 0) {			
			return res;
		}
		else {
			return 0;
		}
	}
	
	//수정 form
	@RequestMapping("/faqupdateform.do")
	public String faqupdateform(Model model, int faqno) {
		logger.info("FAQ UPDATE FORM");
		
		return "faqupdate";
	}
	
	//수정
	@RequestMapping("faqupdate.do")
	@ResponseBody
	public int faqupdate(@RequestBody FaqDto faqdto) {
		logger.info("FAQ UPDATE");
		
		//String title = faqdto.getFaqtitle();
		//System.out.println(title);
		int res = faqbiz.update(faqdto);
		if(res > 0) {
			return res;
		}
		else {
			return 0;
		}

	}
	
	//삭제 
	@RequestMapping("faqdelete.do")
	@ResponseBody
	public int faqdelete(HttpSession session, Integer faqno) {
		logger.info("FAQ DELETE");
		
		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		String usertype = loginUser.getUser_type();
		
		System.out.println(usertype);
		
		if(usertype.equals("USER")) {
			return -1;
		} 
		else {
			int res = faqbiz.delete(faqno);
			if(res > 0) {
				return res;
			}
			else {
				return 0;
			}
		}
	}	
	
	//검색
	
}
