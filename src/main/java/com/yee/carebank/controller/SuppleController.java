package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yee.carebank.model.biz.CommentBiz;
import com.yee.carebank.model.biz.SuppleBiz;
import com.yee.carebank.model.dto.CommentDto;
import com.yee.carebank.model.dto.ShoppingDto;
import com.yee.carebank.model.dto.SuppleDto;

@Controller
public class SuppleController {

	@Autowired
	SuppleBiz sBiz;
	@Autowired
	CommentBiz cBiz;

	@RequestMapping("/supplemain.do")
	public String sMain(Model model) {
		model.addAttribute("category", sBiz.selectCatList());

		return "supplelist";
	}

	@RequestMapping("/supplelist.do")
	@ResponseBody
	public Map<String, Object> selectSList(@RequestBody int subcat_id) {
		Map<String, Object> res = new HashMap<String, Object>();

		res.put("supple", sBiz.selectList(subcat_id));

		return res;
	}

	@RequestMapping("/suppleinfo.do")
	public String selectSupple(Model model, int id) {
		SuppleDto supple = sBiz.selectOne(id);
		List<String> description = sBiz.selectInfo(id);
		List<ShoppingDto> shopping = sBiz.getShopping(supple.getSupple_name());
		List<CommentDto> comment = cBiz.selectList(id, 3);

		model.addAttribute("supple", supple);
		model.addAttribute("description", description);
		model.addAttribute("shopping", shopping);
		model.addAttribute("comment", comment);

		return "suppleinfo";
	}
	
	@RequestMapping("/supplecomm.do")
	@ResponseBody
	public boolean write(HttpServletRequest request, @RequestBody String data) {
		// MemberDto user = request.getSession().getAttribute("loginUser");
		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();
		int info_id = jo.get("info_id").getAsInt();
		String comment = jo.get("comment").getAsString();

		CommentDto dto = new CommentDto();
		dto.setInfo_id(info_id);
		dto.setContent(comment);
		dto.setUser_no(1001);

		int res = cBiz.write(dto, 3);

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/scommupdate.do")
	@ResponseBody
	public boolean modify(HttpServletRequest request, @RequestBody String data) {
		// MemberDto user = request.getSession().getAttribute("loginUser");
		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();
		int comm_no = jo.get("comm_no").getAsInt();
		String comment = jo.get("comment").getAsString();

		CommentDto dto = new CommentDto();
		dto.setComm_no(comm_no);
		dto.setContent(comment);

		int res = cBiz.update(dto, 3);

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/scommdelete.do")
	@ResponseBody
	public boolean delete(HttpServletRequest request, @RequestBody int comm_no) {
		// MemberDto user = request.getSession().getAttribute("loginUser");

		int res = cBiz.delete(comm_no, 3);

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

}
