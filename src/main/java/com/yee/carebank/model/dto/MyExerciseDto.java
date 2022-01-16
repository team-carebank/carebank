package com.yee.carebank.model.dto;

public class MyExerciseDto {
	private int exer_id;
	private String exer_name;
	private int user_no;
	public String regdate;
	public Integer exer_count;

	public MyExerciseDto() {
		super();
	}

	public MyExerciseDto(int exer_id, String exer_name, int user_no, String regdate, Integer exer_count) {
		super();
		this.exer_id = exer_id;
		this.exer_name = exer_name;
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

	public String getExer_name() {
		return exer_name;
	}

	public void setExer_name(String exer_name) {
		this.exer_name = exer_name;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
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

	public void setExer_count(Integer exer_count) {
		this.exer_count = exer_count;
	}

}
