package com.yee.carebank.model.dto;

import java.util.Date;

public class ScheduleDto {

	private int user_no;
	private String hospital_name;
	private Date regdate;
	private Date resdate;
	private String meno;
	
	public ScheduleDto() {
		super();
	}

	public ScheduleDto(int user_no, String hospital_name, Date regdate, Date resdate, String meno) {
		super();
		this.user_no = user_no;
		this.hospital_name = hospital_name;
		this.regdate = regdate;
		this.resdate = resdate;
		this.meno = meno;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getResdate() {
		return resdate;
	}

	public void setResdate(Date resdate) {
		this.resdate = resdate;
	}

	public String getMeno() {
		return meno;
	}

	public void setMeno(String meno) {
		this.meno = meno;
	}

	
	
	
	
}
