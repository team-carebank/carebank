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

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yee.carebank.model.biz.OpenDataBiz;
import com.yee.carebank.model.dto.HospitalDto;

@Controller
public class OpenDataController {

	@Autowired
	OpenDataBiz biz;

	// 병원 정보 및 약국 정보 페이지에서 동일하게 사용되는 컨트롤러
	@RequestMapping("/getpages.do")
	@ResponseBody
	public int getTotalCount(@RequestBody String sgguCd) {
		return biz.getTotalCount(sgguCd);
	}

	// 병원 정보 관련 컨트롤러
	@RequestMapping("/hospitalmain.do")
	public String hopitalMain() {
		return "hospitallist";
	}

	@RequestMapping("/hospitalpage.do")
	@ResponseBody
	public Map<String, JSONArray> listHospitalByPage(@RequestBody String data)
			throws MalformedURLException, IOException {
		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();

		JSONArray res = biz.getHospitalList(jo.get("sgguCd").getAsString(), jo.get("pageno").getAsString());

		Map<String, JSONArray> map = new HashMap<String, JSONArray>();
		map.put("res", res);

		return map;
	}

	@RequestMapping("/hospitalinfo.do")
	public String informHospital(Model model, String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		HospitalDto dto = biz.getHospitalInfo(yadmNm, sgguCd);

		model.addAttribute("dto", dto);

		return "hospitalinfo";
	}

	// 약국 정보 관련 컨트롤러
	@RequestMapping("/pharmacymain.do")
	public String pharmacyMain(Model model) {
		return "pharmacylist";
	}

	@RequestMapping("/pharmacypage.do")
	@ResponseBody
	public Map<String, JSONArray> listPharmacy(@RequestBody String data) throws MalformedURLException, IOException {
		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();

		JSONArray res = biz.getPharmacyList(jo.get("sgguCd").getAsString(), jo.get("pageno").getAsString());

		Map<String, JSONArray> map = new HashMap<String, JSONArray>();
		map.put("res", res);

		return map;
	}

	@RequestMapping("/pharmacyinfo.do")
	public String informPharmacy(Model model, String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		HospitalDto dto = biz.getPharmacyInfo(yadmNm, sgguCd);

		model.addAttribute("dto", dto);

		return "pharmacyinfo";
	}

}
