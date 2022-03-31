package com.spring.screen_choen_sp.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class CustomerDTO {
	
	// 멤버변수 = 컬럼명 = input 태그명 
	private int ac_code;
	private String ac_id;
    private String ac_name;
    private String ac_pw;   
    private String ac_birth;
    private String ac_tel;
    private String ac_add;
    private String ac_email;
    private Date ac_date;
    private int ac_point;
    private int ac_rownum;
    
    // 디폴트 생성자 
    public CustomerDTO() {}

	public int getAc_code() {
		return ac_code;
	}

	public void setAc_code(int ac_code) {
		this.ac_code = ac_code;
	}

	public String getAc_id() {
		return ac_id;
	}

	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
	}

	public String getAc_name() {
		return ac_name;
	}

	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}

	public String getAc_pw() {
		return ac_pw;
	}

	public void setAc_pw(String ac_pw) {
		this.ac_pw = ac_pw;
	}

	public String getAc_birth() {
		return ac_birth;
	}

	public void setAc_birth(String ac_birth) {
		this.ac_birth = ac_birth;
	}

	public String getAc_tel() {
		return ac_tel;
	}

	public void setAc_tel(String ac_tel) {
		this.ac_tel = ac_tel;
	}

	public String getAc_add() {
		return ac_add;
	}

	public void setAc_add(String ac_add) {
		this.ac_add = ac_add;
	}

	public String getAc_email() {
		return ac_email;
	}

	public void setAc_email(String ac_email) {
		this.ac_email = ac_email;
	}

	public Date getAc_date() {
		return ac_date;
	}

	public void setAc_date(Date ac_date) {
		this.ac_date = ac_date;
	}

	public int getAc_point() {
		return ac_point;
	}

	public void setAc_point(int ac_point) {
		this.ac_point = ac_point;
	}

	public int getAc_rownum() {
		return ac_rownum;
	}

	public void setAc_rownum(int ac_rownum) {
		this.ac_rownum = ac_rownum;
	}
    
    // setter, getter 
	
	
}
