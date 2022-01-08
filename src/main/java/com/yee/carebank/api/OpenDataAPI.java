package com.yee.carebank.api;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Repository
public class OpenDataAPI {
	private static final String HOSPITAL_KEY = "26ng9VOSOIPbi%2F9x6FJY3l1CWQICmsw0KMaKSRCXNt0FGG6sLsDkAjhYc44qf9mkGEeP5%2BmuPptEGpIDmMvK6A%3D%3D";
	private static final String PHARMACY_KEY = "26ng9VOSOIPbi%2F9x6FJY3l1CWQICmsw0KMaKSRCXNt0FGG6sLsDkAjhYc44qf9mkGEeP5%2BmuPptEGpIDmMvK6A%3D%3D";
	private static final String HOSPITAL_URL = "http://apis.data.go.kr/B551182/hospInfoService1/getHospBasisList1?ServiceKey="
			+ HOSPITAL_KEY + "&numOfRows=30&_type=json";
	private static final String PHARMACY_URL = "http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList?ServiceKey="
			+ PHARMACY_KEY + "&numOfRows=30&_type=json";

	public static int TOTAL_COUNT = 0;

	/*
	 * API 공통 메소드
	 */
	private static String get(String apiURL) {
		HttpURLConnection con = connect(apiURL);
		try {
			con.setRequestMethod("GET");

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	/*
	 * 병원 정보 메소드
	 */
	public JsonArray getHospitalList(String sgguCd, String pageno) {
		String apiURL = HOSPITAL_URL + "&sgguCd=" + sgguCd + "&pageNo=" + pageno;

		String responseBody = get(apiURL);

		JsonObject result = new JsonParser().parse(responseBody).getAsJsonObject();
		JsonArray item = result.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items")
				.getAsJsonObject().get("item").getAsJsonArray();

		TOTAL_COUNT = result.get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount")
				.getAsInt();

		return item;
	}

	public JsonObject getHospitalInfo(String yadmNm, String sgguCd) {
		String apiURL = null;

		try {
			apiURL = HOSPITAL_URL + "&yadmNm=" + URLEncoder.encode(yadmNm, "UTF-8") + "&sgguCd=" + sgguCd;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String responseBody = get(apiURL);

		JsonObject result = new JsonParser().parse(responseBody).getAsJsonObject();
		JsonObject item = result.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items")
				.getAsJsonObject().get("item").getAsJsonObject();

		return item;
	}

	/*
	 * 약국 정보 메소드
	 */

	public JsonArray getPharmacyList(String sgguCd, String pageno) {
		String apiURL = PHARMACY_URL + "&sgguCd=" + sgguCd + "&pageNo=" + pageno;

		String responseBody = get(apiURL);

		JsonObject result = new JsonParser().parse(responseBody).getAsJsonObject();
		JsonArray item = result.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items")
				.getAsJsonObject().get("item").getAsJsonArray();

		TOTAL_COUNT = result.get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount")
				.getAsInt();

		return item;
	}

	public JsonObject getPharmacyInfo(String yadmNm, String sgguCd) {
		String apiURL = null;

		try {
			apiURL = PHARMACY_URL + "&yadmNm=" + URLEncoder.encode(yadmNm, "UTF-8") + "&sgguCd=" + sgguCd;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String responseBody = get(apiURL);

		JsonObject result = new JsonParser().parse(responseBody).getAsJsonObject();
		JsonObject item = result.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items")
				.getAsJsonObject().get("item").getAsJsonObject();

		return item;
	}
}