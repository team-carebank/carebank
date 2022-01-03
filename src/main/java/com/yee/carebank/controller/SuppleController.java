package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.SuppleBiz;
import com.yee.carebank.model.dto.ShoppingDto;
import com.yee.carebank.model.dto.SuppleDto;

public class SuppleController {

	@Autowired
	SuppleBiz sBiz;

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

		model.addAttribute("supple", supple);
		model.addAttribute("description", description);
		model.addAttribute("shopping", shopping);

		return "suppleinfo";
	}
}
