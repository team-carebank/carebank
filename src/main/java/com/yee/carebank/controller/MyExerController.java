package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yee.carebank.model.biz.MyExerciseBiz;
import com.yee.carebank.model.dto.MyExerciseDto;
 
@Controller
public class MyExerController {
private static Logger logger=LoggerFactory.getLogger(ExerciseController.class);
	
	
	@Autowired
	private MyExerciseBiz biz;
	
	@RequestMapping("/myexerciselist.do")
	public String myexerciselist(Model model) {
		logger.info("myexerciselist");
		
		model.addAttribute("mylist", biz.selectList());
		
		return "chart";
	}
	
	
	
	@RequestMapping("/myexerdetail.do")
	public String detail(Model model, Integer user_no) {
		logger.info("SELECT ONE");
		model.addAttribute("mydto", biz.selectOne(user_no)); 
		return null;
	}
	

//	@RequestMapping("/insertform.do")
//	public String insertForm() {
//		logger.info("INSERT FORM");
//		return "mvcinsert";
//	}
//	
//	@RequestMapping("/insertres.do")
//	public String insertRes(MyExerciseDto dto) {
//		logger.info("INSERT RES");
//		
//		int res=biz.insert(dto);
//		if(res>0) { 
//			return "redirect:myexerciselist.do"; 
//		}else { 
//			return "redirect:main.do";
//		} 
//	}
//	//////////////////// 
	
	
//	@RequestMapping(value="/inserttest", method= {RequestMethod.GET, RequestMethod.POST})
//		
//	public String inserttest(@RequestParam Map<String, Object> param) {
//		String cc=(String) param.get("cc");
//		
//		int res=biz.insert(param);
//		if(res>0) {
//			System.out.println(c); 
//		}else {
//			System.out.println("ㅜㅜ"); 
//		}
//		 
//	} 

//	@RequestMapping(value = "/testtest", method = { RequestMethod.POST,RequestMethod.GET })	
//	public void test(@RequestParam("count") String count) {
//		System.out.println(count); 
//	}
// 
	//data:cc 카운트 값이 넘어왔음 
	@RequestMapping(value = "/test", method = { RequestMethod.POST,RequestMethod.GET })	
	@ResponseBody
	public String test(@RequestParam("count") String count) {
		System.out.println(count);
		return count; 
	}
	 
	@RequestMapping(value="/inserttest", method= { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public void insert(@RequestParam("count") String count) throws Exception{
		
		MyExerciseDto dto=new MyExerciseDto();
		
		dto.setExer_count(count);
		
		int res=biz.insert(dto);
		if(res>0) {
			System.out.println("ㅎㅎ"); 
		}else {
			System.out.println("ㅜㅜ"); 
		} 
	}
	
	
	
	
	
//	
//	
//	@RequestMapping("/inserttest")
//	public @ResponseBody int method(@RequestParam Map<String, Object> param, 
//			HttpServletRequest request, MyExerciseDto dto) {
//		System.out.println("here");
//		//biz.method(param);
//			
//		int res=biz.method(param);
//		if(res>0) {
//			System.out.println("insert성공");
//		}else {
//			System.out.println("실패");
//		}
//		return res;
//		
//	} 
	 
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login(Locale locale, Model model) {
//		
//		return "login";
//	}
//	 
	
}

