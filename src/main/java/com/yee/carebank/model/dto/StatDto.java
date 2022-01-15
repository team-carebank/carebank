package com.yee.carebank.model.dto;

public class StatDto {
	private int cnt;
	private String user_name;
	private String user_id;

	public StatDto() {
		super();
	}

	public StatDto(int cnt, String user_name, String user_id) {
		super();
		this.cnt = cnt;
		this.user_name = user_name;
		this.user_id = user_id;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
