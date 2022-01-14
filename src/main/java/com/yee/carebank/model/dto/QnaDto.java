package com.yee.carebank.model.dto;

import java.util.Date;

public class QnaDto {

	@Override
	public String toString() {
		return "QnaDto [qa_no=" + qa_no + ", qa_gpno=" + qa_gpno + ", qa_gpsq=" + qa_gpsq + ", user_no=" + user_no + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", status=" + status + "]";
	}

	private int qa_no;
	private int qa_gpno;
	private int qa_gpsq;
	private int user_no;
	private String title;
	private String content;
	private Date regdate;
	private String status;

	public QnaDto() {
		super();
	}

	public QnaDto(int qa_no, int qa_gpno, int qa_gpsq, int user_no, String title, String content,
			Date regdate, String status) {
		super();
		this.qa_no = qa_no;
		this.qa_gpno = qa_gpno;
		this.qa_gpsq = qa_gpsq;
		this.user_no = user_no;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.status = status;
	}

	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public int getQa_gpno() {
		return qa_gpno;
	}

	public void setQa_gpno(int qa_gpno) {
		this.qa_gpno = qa_gpno;
	}

	public int getQa_gpsq() {
		return qa_gpsq;
	}

	public void setQa_gpsq(int qa_gpsq) {
		this.qa_gpsq = qa_gpsq;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
