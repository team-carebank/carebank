package com.yee.carebank.controller;

import static com.yee.carebank.controller.Admin1stController.check;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.MyInfoBiz;
import com.yee.carebank.model.biz.PreferenceBiz;
import com.yee.carebank.model.biz.UserBiz;
import com.yee.carebank.model.dto.UserDto;


@Controller
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);

@Autowired
private MyInfoBiz infobiz;

@Autowired
private PreferenceBiz preferbiz;

@Autowired
private UserBiz userbiz;

@Autowired
private BCryptPasswordEncoder passwordEncoder;


	//기본정보 조회
	@RequestMapping("/myinfo.do")
	public String myinfo(HttpSession session, Model model) {
		logger.info("MYPAGE");
		
		if(session == null) {
			return "redirect:loginform.do";
		}
		
		UserDto login_info = (UserDto)session.getAttribute("login_info");
		
		int user_no = login_info.getUser_no();
		model.addAttribute("preferlist", preferbiz.selectAll(user_no));
		return "mypage_myinfo";
	}
	
	//기본정보 수정
	@RequestMapping("/myinfoUpdate.do")
	@ResponseBody
	public boolean myinfoUpdate(HttpSession session, @RequestBody UserDto newdto) {
		logger.info("MYPAGE INFO UPDATE");
		
		int res = infobiz.myinfoUpdate(newdto);
		
		if(res > 0) {
			session.setAttribute("login_info", newdto);
			return true;
		}
		else {
			return false;
		}
	}
	
	//회원탈퇴 
	@RequestMapping("/disable.do")
	//@ResponseBody
	public String disable(HttpSession session, @RequestParam int user_no) {
		logger.info("MYPAGE USER DISABLE");
	
		int res = infobiz.disable(user_no);
		
		if (res > 0) {
			
			return "redirect:logout.do";
		}
		else {
			return "redirect:myinfo.do";
		
		}
	}
	
	
	//관심사 설정페이지
	@RequestMapping("/regis_prefer.do")
	public String regisPrefer() {
		return "regis_prefer";
	}


	//관심사 조회
//	@RequestMapping("/preferlist.do")
//	public String selectAll(Model model) {
//		logger.info("PREFER LIST");
//		model.addAttribute("preferlist", preferbiz.selectAll());
//	
//		return "redirect:myinfo.do";
//	}
	
	//관심사 설정
	@RequestMapping("/setprefer.do")
	@ResponseBody
	public boolean setprefer(@RequestParam(value="subcat_id[]") List<Integer> subcat_id, @RequestParam(value="user_no") int user_no)
	{
		
		logger.info("SET PREFER");
		
		int res = preferbiz.setprefer(subcat_id, user_no);
		
		if(res > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@RequestMapping("/changePop.do")
	public String changePop() {
		logger.info("CHANGE PW POPUP");
		
		return "changepw_Popup";
	}
	
	@RequestMapping("/pwchk.do")
	@ResponseBody
	public boolean chkpw(HttpSession session, @RequestParam("old_pw") String user_pw) {
		logger.info("PASSWORD CHECK");
		
		UserDto login_info = (UserDto) session.getAttribute("login_info");
		
		if (passwordEncoder.matches(user_pw,login_info.getUser_pw())) {
		
			return true;
		}
		else {
			return false;
		}
	}
	
	@RequestMapping("/changepw.do")
	@ResponseBody
	public boolean changepw(HttpSession session, @RequestParam String new_pw) {
		
		UserDto login_info = (UserDto)session.getAttribute("login_info");
		login_info.setUser_pw(passwordEncoder.encode(new_pw));

		int res = userbiz.updatePassword(login_info);

		if (res > 0) {
			return true;
			
		} 
		else {
			return false;
		}
	}
}
