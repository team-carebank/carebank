package com.yee.carebank.model.dto;

public class MeditationDto {

	public int meditate_id;
	public int subcat_id;
	public String med_title;
	public String med_thum;
	public String med_url_play;
	public String med_url_playlist1;
	public String med_url_playlist2;
	public String med_url_playlist3;
	public String med_quote;
	
	
	public MeditationDto() {
		super(); 
	}
	
	
	public MeditationDto(int meditate_id, int subcat_id, String med_title, String med_thum, String med_url_play,
			String med_url_playlist1, String med_url_playlist2, String med_url_playlist3, String med_quote) {
		super();
		this.meditate_id = meditate_id;
		this.subcat_id = subcat_id;
		this.med_title = med_title;
		this.med_thum = med_thum;
		this.med_url_play = med_url_play;
		this.med_url_playlist1 = med_url_playlist1;
		this.med_url_playlist2 = med_url_playlist2;
		this.med_url_playlist3 = med_url_playlist3;
		this.med_quote = med_quote;
	}
	
	
	
	public int getMeditate_id() {
		return meditate_id;
	}
	public void setMeditate_id(int meditate_id) {
		this.meditate_id = meditate_id;
	}
	public int getSubcat_id() {
		return subcat_id;
	}
	public void setSubcat_id(int subcat_id) {
		this.subcat_id = subcat_id;
	}
	public String getMed_title() {
		return med_title;
	}
	public void setMed_title(String med_title) {
		this.med_title = med_title;
	}
	public String getMed_thum() {
		return med_thum;
	}
	public void setMed_thum(String med_thum) {
		this.med_thum = med_thum;
	}
	public String getMed_url_play() {
		return med_url_play;
	}
	public void setMed_url_play(String med_url_play) {
		this.med_url_play = med_url_play;
	}
	public String getMed_url_playlist1() {
		return med_url_playlist1;
	}
	public void setMed_url_playlist1(String med_url_playlist1) {
		this.med_url_playlist1 = med_url_playlist1;
	}
	public String getMed_url_playlist2() {
		return med_url_playlist2;
	}
	public void setMed_url_playlist2(String med_url_playlist2) {
		this.med_url_playlist2 = med_url_playlist2;
	}
	public String getMed_url_playlist3() {
		return med_url_playlist3;
	}
	public void setMed_url_playlist3(String med_url_playlist3) {
		this.med_url_playlist3 = med_url_playlist3;
	}
	public String getMed_quote() {
		return med_quote;
	}
	public void setMed_quote(String med_quote) {
		this.med_quote = med_quote;
	} 
	
	
	
	 
	
	
	
}
