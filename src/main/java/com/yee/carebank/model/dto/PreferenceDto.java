package com.yee.carebank.model.dto;

public class PreferenceDto {
	private int user_no;
	private int subcat_id;
	private int supercat_id;
	
	public PreferenceDto() {
		
	}

	public PreferenceDto(int user_no, int subcat_id, int supercat_id) {
		super();
		this.user_no = user_no;
		this.subcat_id = subcat_id;
		this.supercat_id = supercat_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getSubcat_id() {
		return subcat_id;
	}

	public void setSubcat_id(int subcat_id) {
		this.subcat_id = subcat_id;
	}
	
	public int getSupercat_id() {
		return supercat_id;
	}
	
	public void setSupercat_id(int supercat_id) {
		this.supercat_id = supercat_id;
	}
	
	
}
