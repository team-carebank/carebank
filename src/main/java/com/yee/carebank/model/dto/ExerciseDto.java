package com.yee.carebank.model.dto;

public class ExerciseDto {
	private Integer exer_id;
	private String exer_name;
	private String exer_type;
	private String exer_description;
	private int subcat_id;
	private String subcat_name;
	private String exer_thum;
	private String exer_title;
	private int exer_kcal;
	private String exer_notice;
	private String exer_video_url;
	private String exer_tm_url;

	public ExerciseDto() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getExer_tm_url() {
		return exer_tm_url;
	}

	public void setExer_tm_url(String exer_tm_url) {
		this.exer_tm_url = exer_tm_url;
	}

	public String getSubcat_name() {
		return subcat_name;
	}

	public void setSubcat_name(String subcat_name) {
		this.subcat_name = subcat_name;
	}

	public ExerciseDto(Integer exer_id, String exer_name, String exer_type, String exer_description, int subcat_id,
			String subcat_name, String exer_thum, String exer_title, int exer_kcal, String exer_notice,
			String exer_video_url, String exer_tm_url) {
		super();
		this.exer_id = exer_id;
		this.exer_name = exer_name;
		this.exer_type = exer_type;
		this.exer_description = exer_description;
		this.subcat_id = subcat_id;
		this.subcat_name = subcat_name;
		this.exer_thum = exer_thum;
		this.exer_title = exer_title;
		this.exer_kcal = exer_kcal;
		this.exer_notice = exer_notice;
		this.exer_video_url = exer_video_url;
		this.exer_tm_url = exer_tm_url;
	}

}
