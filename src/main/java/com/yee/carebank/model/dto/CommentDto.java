package com.yee.carebank.model.dto;

import java.util.Date;

public class CommentDto {
	private int comm_no; // 댓글 번호
	private int user_no; // 댓글 작성자 번호
	private String user_name; // 댓글 작성자 이름
	private String content; // 댓글 내용
	private int info_id; // 게시글 번호
	private Date regdate;

	public CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentDto(int comm_no, int user_no, String user_name, String content, int info_id, int type_id,
			Date regdate) {
		super();
		this.comm_no = comm_no;
		this.user_no = user_no;
		this.user_name = user_name;
		this.content = content;
		this.info_id = info_id;
		this.regdate = regdate;
	}

	public int getComm_no() {
		return comm_no;
	}

	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
