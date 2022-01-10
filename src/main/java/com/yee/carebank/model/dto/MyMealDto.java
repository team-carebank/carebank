package com.yee.carebank.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MyMealDto {
	private int record_id;
	private int user_no;
	private String meal_name;
	private String meal_time;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;

	public MyMealDto() {
		super();
	}

	public MyMealDto(int record_id, int user_no, String meal_name, String meal_time, Date regdate) {
		super();
		this.record_id = record_id;
		this.user_no = user_no;
		this.meal_name = meal_name;
		this.meal_time = meal_time;
		this.regdate = regdate;
	}

	public int getRecord_id() {
		return record_id;
	}

	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getMeal_name() {
		return meal_name;
	}

	public void setMeal_name(String meal_name) {
		this.meal_name = meal_name;
	}

	public String getMeal_time() {
		return meal_time;
	}

	public void setMeal_time(String meal_time) {
		this.meal_time = meal_time;
	}

	public String getRegdate() {
		int year = 1900 + regdate.getYear();
		int month = 1 + regdate.getMonth();
		int date = regdate.getDate();

		return year + "-" + (month >= 10 ? month : ("0" + month)) + "-" + (date >= 10 ? date : ("0" + date));
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
