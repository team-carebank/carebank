package com.yee.carebank.api;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Repository;

@Repository
public class OpenDataAPI {
	private static final String HOSPITAL_KEY = "26ng9VOSOIPbi%2F9x6FJY3l1CWQICmsw0KMaKSRCXNt0FGG6sLsDkAjhYc44qf9mkGEeP5%2BmuPptEGpIDmMvK6A%3D%3D";
	private static final String PHARMACY_KEY = "26ng9VOSOIPbi%2F9x6FJY3l1CWQICmsw0KMaKSRCXNt0FGG6sLsDkAjhYc44qf9mkGEeP5%2BmuPptEGpIDmMvK6A%3D%3D";
	private static final String HOSPITAL_URL = "http://apis.data.go.kr/B551182/hospInfoService1/getHospBasisList1?ServiceKey="
			+ HOSPITAL_KEY + "&numOfRows=30";
	private static final String PHARMACY_URL = "http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList?ServiceKey="
			+ PHARMACY_KEY + "&numOfRows=30";

	public static int TOTAL_COUNT = 0;

	public JSONArray getHospitalList(String sgguCd) throws MalformedURLException, IOException {
		String url = HOSPITAL_URL + "&sgguCd=" + sgguCd;

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}

		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		JSONArray item = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
				.getJSONArray("item");
		TOTAL_COUNT = xmlJSONObj.getJSONObject("response").getJSONObject("body").getInt("totalCount");
		return item;

	}

	public JSONArray getHospitalList(String sgguCd, String pageno) throws MalformedURLException, IOException {
		String url = HOSPITAL_URL + "&sgguCd=" + sgguCd + "&pageNo=" + pageno;

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}

		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		JSONArray item = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
				.getJSONArray("item");
		TOTAL_COUNT = xmlJSONObj.getJSONObject("response").getJSONObject("body").getInt("totalCount");
		return item;

	}

	public JSONObject getHospitalInfo(String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		String url = HOSPITAL_URL + "&yadmNm=" + URLEncoder.encode(yadmNm, "UTF-8") + "&sgguCd" + sgguCd;

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}

		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		JSONObject item = null;
		try {
			item = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONObject("item");
		} catch (Exception e) {
			item = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONArray("item").getJSONObject(0);
		}
		return item;
	}

	public JSONArray getPharmacyList(String sgguCd) throws MalformedURLException, IOException {
		String url = PHARMACY_URL + "&sgguCd=" + sgguCd; // + "&numOfRows=1000";

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}

		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		JSONArray item = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
				.getJSONArray("item");
		TOTAL_COUNT = xmlJSONObj.getJSONObject("response").getJSONObject("body").getInt("totalCount");
		return item;

	}

	public JSONObject getPharmacyInfo(String yadmNm, String sgguCd) throws MalformedURLException, IOException {
		String url = PHARMACY_URL + "&yadmNm=" + URLEncoder.encode(yadmNm, "UTF-8") + "&sgguCd" + sgguCd;

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}

		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		JSONObject item = null;

		try {
			item = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONObject("item");
		} catch (Exception e) {
			item = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONArray("item").getJSONObject(0);
		}
		return item;
	}
}