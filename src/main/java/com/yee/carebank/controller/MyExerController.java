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
	
 
	//data:cc 카운트 값이 넘어왔음 
	@RequestMapping(value = "/test", method = { RequestMethod.POST,RequestMethod.GET })	
	@ResponseBody
	public String test(@RequestParam("exer_count") String exer_count) {
		
		System.out.println(exer_count);
		return exer_count; 
	}
	
	
	@RequestMapping(value = "/inserttest", method = { RequestMethod.POST,RequestMethod.GET })	
	@ResponseBody
	public int inserttest(@RequestParam("exer_count") Integer exer_count) {
		
		MyExerciseDto dto=new MyExerciseDto();
		dto.setExer_count(exer_count);
		System.out.println("count"+exer_count); 
		int res=biz.insert(exer_count);
		if(res>0) {
			System.out.println("insert성공!!!!!!!");
		}else {
			System.out.println("실");
		} 
		return res; 
	}
	
	 
//	@RequestMapping(value="/inserttest", method= { RequestMethod.POST,RequestMethod.GET })
//	@ResponseBody
//	public int insert(@RequestParam("count") String count, MyExerciseDto dto) throws Exception{
//		logger.info("insert");
//		//MyExerciseDto dto=new MyExerciseDto();
//		 
//		dto.setExer_count(count);
//		
//		int res=biz.insert(dto);
//		
//		if(res>0) {
//			System.out.println("ㅎㅎ"); 
//			return res; 
//		 
//		}else {
//			System.out.println("ㅜㅜ"); 
//		}
//		return res;
//	}
//	
//	
//	@RequestMapping(value="/inserttest", method= { RequestMethod.POST,RequestMethod.GET })
//	@ResponseBody
//	public int insert(@RequestParam("count") Integer count, MyExerciseDto dto,@RequestParam Map<String, Object> param) throws Exception{
//		  
//		Map<String, Object> result = new HashMap<String, Object>();
//		
//		logger.info("insert");			
//		
//			Integer cresult=dto.setExer_count(count);
//			
//			int res=biz.insert(cresult);
//			if(res>0) {
//				System.out.println("예쓰");
//			}else {
//				System.out.println("ㅡㅡ");
//			}
//			return res; 
//			
//		} 
		 
	
	
	
	
	
	
	
	
	
	
	
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
//	 

//	@RequestMapping(value = "/testtest", method = { RequestMethod.POST,RequestMethod.GET })	
//	public void test(@RequestParam("count") String count) {
//		System.out.println(count); 
//	}
// 
}

