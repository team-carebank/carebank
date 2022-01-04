package com.yee.carebank.model.dto;

public class HospitalDto {
	private String yadmNm;
	private String addr;
	private String hospUrl;
	private String telno;
	private Double xPos;
	private Double yPos;

	public HospitalDto() {
		super();
	}

	public HospitalDto(String yadmNm, String addr, String hospUrl, String telno, Double xPos, Double yPos) {
		super();
		this.yadmNm = yadmNm;
		this.addr = addr;
		this.hospUrl = hospUrl;
		this.telno = telno;
		this.xPos = xPos;
		this.yPos = yPos;
	}

	public Double getxPos() {
		return xPos;
	}

	public void setxPos(Double xPos) {
		this.xPos = xPos;
	}

	public Double getyPos() {
		return yPos;
	}

	public void setyPos(Double yPos) {
		this.yPos = yPos;
	}

	public String getYadmNm() {
		return yadmNm;
	}

	public void setYadmNm(String yadmNm) {
		this.yadmNm = yadmNm;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getHospUrl() {
		return hospUrl;
	}

	public void setHospUrl(String hospUrl) {
		this.hospUrl = hospUrl;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

}
