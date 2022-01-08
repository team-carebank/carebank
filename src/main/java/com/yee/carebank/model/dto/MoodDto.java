package com.yee.carebank.model.dto;

import java.util.Date;

public class MoodDto {

	private int user_no;
	private String mood;
	private Date regdate;
	
	public MoodDto() {
		super();
	}

	public MoodDto(int user_no, String mood, Date regdate) {
		super();
		this.user_no = user_no;
		this.mood = mood;
		this.regdate = regdate;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getMood() {
		return mood;
	}

	public void setMood(String mood) {
		this.mood = mood;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MoodDto [user_no=" + user_no + ", mood=" + mood + ", regdate=" + regdate + "]";
	}
	

	
}
