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
	private String answer;
	private Date regdate;
	private String status;
	private String user_type;

	public QnaDto() {
		super();
	}

	public QnaDto(int qa_no, int qa_gpno, int qa_gpsq, int user_no, String title, String content, String answer,
			Date regdate, String status, String user_type) {
		super();
		this.qa_no = qa_no;
		this.qa_gpno = qa_gpno;
		this.qa_gpsq = qa_gpsq;
		this.user_no = user_no;
		this.title = title;
		this.content = content;
		this.answer = answer;
		this.regdate = regdate;
		this.status = status;
		this.user_type = user_type;
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

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
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

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	
	
}
