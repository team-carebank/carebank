package com.yee.carebank.model.dto;

public class FaqDto {
	private int faqno;
	private String faqtitle;
	private String faqcontent;
	
	public FaqDto() {
	}
	
	public FaqDto(int faqno, String faqtitle, String faqcontent) {
		super();
		this.faqno = faqno;
		this.faqtitle = faqtitle;
		this.faqcontent = faqcontent;
	}

	public int getFaqno() {
		return faqno;
	}

	public void setFaqno(int faqno) {
		this.faqno = faqno;
	}

	public String getFaqtitle() {
		return faqtitle;
	}

	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}

	public String getFaqcontent() {
		return faqcontent;
	}

	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}
	
	
	

}
