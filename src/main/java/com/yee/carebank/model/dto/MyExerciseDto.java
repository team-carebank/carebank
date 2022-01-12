package com.yee.carebank.model.dto;
 
public class MyExerciseDto {

	public int exer_id;
	public int user_no;
	public String regdate;
	public Integer exer_count;
	public MyExerciseDto() {
		super(); 
	}
	public MyExerciseDto(int exer_id, int user_no, String regdate, Integer exer_count) {
		super();
		this.exer_id = exer_id;
		this.user_no = user_no;
		this.regdate = regdate;
		this.exer_count = exer_count;
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
	public int setUser_no(int user_no) {
		return this.user_no = user_no;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public Integer getExer_count() {
		return exer_count;
	}
	public Integer setExer_count(Integer exer_count) {
		return this.exer_count = exer_count;
	}

	
	
}
