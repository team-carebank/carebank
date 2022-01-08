package com.yee.carebank.model.dto;
 
public class MyExerciseDto {

	public int exer_id;
	public Integer user_no;
	public String regdate;
	public String exer_count;
	public MyExerciseDto() {
		super(); 
	}
	public MyExerciseDto(int exer_id, Integer user_no, String regdate, String exer_count) {
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
	public Integer getUser_no() {
		return user_no;
	}
	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getExer_count() {
		return exer_count;
	}
	public void setExer_count(String exer_count) {
		this.exer_count = exer_count;
	} 
	
	
	
	
}
