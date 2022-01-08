package com.yee.carebank.model.biz;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.yee.carebank.api.OpenDataAPI;
import com.yee.carebank.model.dto.HospitalDto;

@Service
public class OpenDataBiz {

	@Autowired
	OpenDataAPI api;

	public int getTotalCount(String sgguCd) {
		return OpenDataAPI.TOTAL_COUNT;
	}

	public JsonArray getHospitalList(String sgguCd, String pageno) throws MalformedURLException, IOException {
		return api.getHospitalList(sgguCd, pageno);
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

	public JsonArray getPharmacyList(String sgguCd, String pageno) throws MalformedURLException, IOException {
		return api.getPharmacyList(sgguCd, pageno);
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
