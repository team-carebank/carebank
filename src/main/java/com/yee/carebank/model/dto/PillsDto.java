package com.yee.carebank.model.dto;

import java.util.Date;

public class PillsDto {

	private int pills_no;
	private int user_no;
	private Date regdate;
	
	public PillsDto() {
		super();
	}

	public PillsDto(int pills_no, int user_no, Date regdate) {
		super();
		this.pills_no = pills_no;
		this.user_no = user_no;
		this.regdate = regdate;
	}

	public int getPills_no() {
		return pills_no;
	}

	public void setPills_no(int pills_no) {
		this.pills_no = pills_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
	
}
