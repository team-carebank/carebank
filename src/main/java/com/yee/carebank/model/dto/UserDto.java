package com.yee.carebank.model.dto;

import java.sql.Date;

public class UserDto {
	private int user_no;
	private String user_name;
	private String user_id;
	private String user_pw;
	private Date birth;
	private String phone;
	private String email;
	private String enabled_yn;
	private String user_type;
	
	public UserDto() {
		
	}

	public UserDto(int user_no, String user_name, String user_id, String user_pw, Date birth, String phone,
			String email, String enabled_yn, String user_type) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.enabled_yn = enabled_yn;
		this.user_type = user_type;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
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

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEnabled_yn() {
		return enabled_yn;
	}

	public void setEnabled_yn(String enabled_yn) {
		this.enabled_yn = enabled_yn;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	
	
	
	

}
