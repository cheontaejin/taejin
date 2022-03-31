package com.spring.screen_choen_sp.dto;

import java.util.Date;

import oracle.sql.DATE;

public class BoardDTO {

	private int bd_code;			// 글번호
	private String ac_id;		// 글제목
	private String bd_name;		// 글내용
	private String bd_content;		// 작성자
	private String bd_password;	// 수정, 삭제용 비밀번호
	private int readCnt;		// 조회수
	private Date bd_date;		// 가입일
	private int comment_count;	// 댓글갯수
	private int bd_rownum;
	
	public BoardDTO() {
		
	}

	public int getBd_code() {
		return bd_code;
	}

	public void setBd_code(int bd_code) {
		this.bd_code = bd_code;
	}

	public String getAc_id() {
		return ac_id;
	}

	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
	}

	public String getBd_name() {
		return bd_name;
	}

	public void setBd_name(String bd_name) {
		this.bd_name = bd_name;
	}

	public String getBd_content() {
		return bd_content;
	}

	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}

	public String getBd_password() {
		return bd_password;
	}

	public void setBd_password(String bd_password) {
		this.bd_password = bd_password;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public Date getBd_date() {
		return bd_date;
	}

	public void setBd_date(Date bd_date) {
		this.bd_date = bd_date;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public int getBd_rownum() {
		return bd_rownum;
	}

	public void setBd_rownum(int bd_rownum) {
		this.bd_rownum = bd_rownum;
	}
	
	
}
