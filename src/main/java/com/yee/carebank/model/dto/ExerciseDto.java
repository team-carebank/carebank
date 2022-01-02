package com.yee.carebank.model.dto;

import java.util.Date;
 
 

public class ExerciseDto {

	private Integer exer_id;
	private String exer_name;
	private String exer_type;
	private String exer_description;
	private int subcat_id;
	private int type_id;
	private String exer_thum;
	private String exer_title;
	private int exer_timer;
	private int exer_count;
	private int exer_kcal;
	private String exer_notice;
	private String exer_video_url;
	private Date exer_date;
	private String exer_tm_url;
	
	
	public ExerciseDto() {
		super();
	}
	
	public ExerciseDto(Integer exer_id, String exer_name, String exer_type, String exer_description, int subcat_id,
			int type_id, String exer_thum, String exer_title, int exer_timer, int exer_count, int exer_kcal,
			String exer_notice, String exer_video_url, Date exer_date, String exer_tm_url) {
		super();
		this.exer_id = exer_id;
		this.exer_name = exer_name;
		this.exer_type = exer_type;
		this.exer_description = exer_description;
		this.subcat_id = subcat_id;
		this.type_id = type_id;
		this.exer_thum = exer_thum;
		this.exer_title = exer_title;
		this.exer_timer = exer_timer;
		this.exer_count = exer_count;
		this.exer_kcal = exer_kcal;
		this.exer_notice = exer_notice;
		this.exer_video_url = exer_video_url;
		this.exer_date = exer_date;
		this.exer_tm_url = exer_tm_url;
	}
	public Integer getExer_id() {
		return exer_id;
	}
	public void setExer_id(Integer exer_id) {
		this.exer_id = exer_id;
	}
	public String getExer_name() {
		return exer_name;
	}
	public void setExer_name(String exer_name) {
		this.exer_name = exer_name;
	}
	public String getExer_type() {
		return exer_type;
	}
	public void setExer_type(String exer_type) {
		this.exer_type = exer_type;
	}
	public String getExer_description() {
		return exer_description;
	}
	public void setExer_description(String exer_description) {
		this.exer_description = exer_description;
	}
	public int getSubcat_id() {
		return subcat_id;
	}
	public void setSubcat_id(int subcat_id) {
		this.subcat_id = subcat_id;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getExer_thum() {
		return exer_thum;
	}
	public void setExer_thum(String exer_thum) {
		this.exer_thum = exer_thum;
	}
	public String getExer_title() {
		return exer_title;
	}
	public void setExer_title(String exer_title) {
		this.exer_title = exer_title;
	}
	public int getExer_timer() {
		return exer_timer;
	}
	public void setExer_timer(int exer_timer) {
		this.exer_timer = exer_timer;
	}
	public int getExer_count() {
		return exer_count;
	}
	public void setExer_count(int exer_count) {
		this.exer_count = exer_count;
	}
	public int getExer_kcal() {
		return exer_kcal;
	}
	public void setExer_kcal(int exer_kcal) {
		this.exer_kcal = exer_kcal;
	}
	public String getExer_notice() {
		return exer_notice;
	}
	public void setExer_notice(String exer_notice) {
		this.exer_notice = exer_notice;
	}
	public String getExer_video_url() {
		return exer_video_url;
	}
	public void setExer_video_url(String exer_video_url) {
		this.exer_video_url = exer_video_url;
	}
	public Date getExer_date() {
		return exer_date;
	}
	public void setExer_date(Date exer_date) {
		this.exer_date = exer_date;
	}
	public String getExer_tm_url() {
		return exer_tm_url;
	}
	public void setExer_tm_url(String exer_tm_url) {
		this.exer_tm_url = exer_tm_url;
	}
 
	
}
