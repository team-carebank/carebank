package com.yee.carebank.model.dto;

import java.util.Date;

public class MyExerciseDto {

	public int exer_id;
	public int user_no;
	public Date regdate;
	
	public MyExerciseDto() {
		super(); 
	}
	public MyExerciseDto(int exer_id, int user_no, Date regdate) {
		super();
		this.exer_id = exer_id;
		this.user_no = user_no;
		this.regdate = regdate;
	}
	public int getExer_id() {
		return exer_id;
	}
	public void setExer_id(int exer_id) {
		this.exer_id = exer_id;
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
