package com.yee.carebank.model.biz;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Type;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.yee.carebank.api.OpenDataAPI;
import com.yee.carebank.model.dto.HospitalDto;

@Service
public class OpenDataBiz {

	@Autowired
	OpenDataAPI api;

	public int getTotalCount(String sgguCd) {
		return OpenDataAPI.TOTAL_COUNT;
	}

	public List<HospitalDto> getHospitalList(String sgguCd, String pageno) throws MalformedURLException, IOException {
		String jArr = api.getHospitalList(sgguCd, pageno).toString();

		return api.parse(jArr);
	}

	public HospitalDto getHospitalInfo(String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		JsonObject res = api.getHospitalInfo(yadmNm, sgguCd);
		HospitalDto dto = new HospitalDto();

		dto.setYadmNm(res.get("yadmNm").getAsString());
		dto.setAddr(res.get("addr").getAsString());
		try {
			dto.setTelno(res.get("telno").getAsString());
		} catch (Exception e) {
			dto.setTelno(null);
		}
		try {
			String url = URLEncoder.encode(res.get("hospUrl").getAsString(), "UTF-8");
			dto.setHospUrl(URLDecoder.decode(url));
		} catch (Exception e) {
			dto.setHospUrl(null);
		}

		try {
			dto.setxPos(res.get("XPos").getAsDouble());
			dto.setyPos(res.get("YPos").getAsDouble());
		} catch (Exception e) {
			dto.setxPos(null);
			dto.setyPos(null);
		}

		return dto;

	}

	public List<HospitalDto> getPharmacyList(String sgguCd, String pageno) throws MalformedURLException, IOException {
		String jArr = api.getPharmacyList(sgguCd, pageno).toString();

		return api.parse(jArr);
	}

	public HospitalDto getPharmacyInfo(String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		JsonObject res = api.getPharmacyInfo(yadmNm, sgguCd);
		HospitalDto dto = new HospitalDto();

		dto.setYadmNm(res.get("yadmNm").getAsString());
		dto.setAddr(res.get("addr").getAsString());
		try {
			dto.setTelno(res.get("telno").getAsString());
		} catch (Exception e) {
			dto.setTelno(null);
		}
		try {
			String url = URLEncoder.encode(res.get("hospUrl").getAsString(), "UTF-8");
			dto.setHospUrl(URLDecoder.decode(url));
		} catch (Exception e) {
			dto.setHospUrl(null);
		}

		try {
			dto.setxPos(res.get("XPos").getAsDouble());
			dto.setyPos(res.get("YPos").getAsDouble());
		} catch (Exception e) {
			dto.setxPos(null);
			dto.setyPos(null);
		}

		return dto;
	}
}
