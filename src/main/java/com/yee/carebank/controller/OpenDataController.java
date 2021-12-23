package com.yee.carebank.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yee.carebank.model.biz.OpenDataBiz;
import com.yee.carebank.model.dto.HospitalDto;

@Controller
public class OpenDataController {

	@Autowired
	OpenDataBiz biz;

	@RequestMapping("/hospitalmain.do")
	public String hopitalMain() {
		return "hospitallist";
	}

	@RequestMapping("/hospitallist.do")
	@ResponseBody
	public Map<String, JSONArray> hospitalList(@RequestBody String sgguCd) throws MalformedURLException, IOException {
		JSONArray res = biz.getHospitalList(sgguCd);

		Map<String, JSONArray> map = new HashMap<String, JSONArray>();
		map.put("res", res);

		return map;
	}

	@RequestMapping("/hospitalinfo.do")
	public String hopitalinfo(Model model, String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		HospitalDto dto = biz.getHospitalInfo(yadmNm, sgguCd);

		model.addAttribute("dto", dto);

		return "hospitalinfo";
	}

}
