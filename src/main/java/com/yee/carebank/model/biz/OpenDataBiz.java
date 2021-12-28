package com.yee.carebank.model.biz;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.api.OpenDataAPI;
import com.yee.carebank.model.dto.HospitalDto;

@Service
public class OpenDataBiz {

	@Autowired
	OpenDataAPI api;

	public int getTotalCount(String sgguCd) {
		return OpenDataAPI.TOTAL_COUNT;
	}

	public JSONArray getHospitalList(String sgguCd) throws MalformedURLException, IOException {
		return api.getHospitalList(sgguCd);
	}

	public HospitalDto getHospitalInfo(String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		JSONObject res = api.getHospitalInfo(yadmNm, sgguCd);
		HospitalDto dto = new HospitalDto();

		dto.setYadmNm(res.getString("yadmNm"));
		dto.setAddr(res.getString("addr"));
		try {
			dto.setTelno(res.getString("telno"));
		} catch (Exception e) {
			dto.setTelno(null);
		}
		try {
			String url = URLEncoder.encode(res.getString("hospUrl"), "UTF-8");
			dto.setHospUrl(URLDecoder.decode(url));
		} catch (Exception e) {
			dto.setHospUrl(null);
		}

		try {
			dto.setxPos(res.getDouble("XPos"));
			dto.setyPos(res.getDouble("YPos"));
		} catch (Exception e) {
			dto.setxPos(null);
			dto.setyPos(null);
		}

		return dto;

	}

	public JSONArray getPharmacyList(String sgguCd) throws MalformedURLException, IOException {
		return api.getPharmacyList(sgguCd);
	}

	public HospitalDto getPharmacyInfo(String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		JSONObject res = api.getPharmacyInfo(yadmNm, sgguCd);
		HospitalDto dto = new HospitalDto();

		dto.setYadmNm(res.getString("yadmNm"));
		dto.setAddr(res.getString("addr"));
		try {
			dto.setTelno(res.getString("telno"));
		} catch (Exception e) {
			dto.setTelno(null);
		}
		try {
			String url = URLEncoder.encode(res.getString("hospUrl"), "UTF-8");
			dto.setHospUrl(URLDecoder.decode(url));
		} catch (Exception e) {
			dto.setHospUrl(null);
		}

		try {
			dto.setxPos(res.getDouble("XPos"));
			dto.setyPos(res.getDouble("YPos"));
		} catch (Exception e) {
			dto.setxPos(null);
			dto.setyPos(null);
		}

		return dto;

	}
}
