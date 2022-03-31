package com.spring.screen_choen_sp.dto;

import java.sql.Date;

public class ProductDTO {
	private int pd_code;
	private int ac_code;
	private String pd_category;
	private String pd_make;
	private String pd_name;
	private String pd_img;
	private String pd_detail_img;
	private int pd_salary;
	private int pd_stock;
	private String pd_status;
	private Date pd_date;
	private int pd_rownum;
	
	public ProductDTO() {
		
	}

	public int getPd_code() {
		return pd_code;
	}

	public void setPd_code(int pd_code) {
		this.pd_code = pd_code;
	}

	public int getAc_code() {
		return ac_code;
	}

	public void setAc_code(int ac_code) {
		this.ac_code = ac_code;
	}

	public String getPd_category() {
		return pd_category;
	}

	public void setPd_category(String pd_category) {
		this.pd_category = pd_category;
	}

	public String getPd_make() {
		return pd_make;
	}

	public void setPd_make(String pd_make) {
		this.pd_make = pd_make;
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public String getPd_img() {
		return pd_img;
	}

	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}

	public String getPd_detail_img() {
		return pd_detail_img;
	}

	public void setPd_detail_img(String pd_detail_img) {
		this.pd_detail_img = pd_detail_img;
	}

	public int getPd_salary() {
		return pd_salary;
	}

	public void setPd_salary(int pd_salary) {
		this.pd_salary = pd_salary;
	}

	public int getPd_stock() {
		return pd_stock;
	}

	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}

	public String getPd_status() {
		return pd_status;
	}

	public void setPd_status(String pd_status) {
		this.pd_status = pd_status;
	}

	public Date getPd_date() {
		return pd_date;
	}

	public void setPd_date(Date pd_date) {
		this.pd_date = pd_date;
	}

	public int getPd_rownum() {
		return pd_rownum;
	}

	public void setPd_rownum(int pd_rownum) {
		this.pd_rownum = pd_rownum;
	}

	
	
}

/*
CREATE TABLE mvc_product_tbl(
    pdNo        VARCHAR2(20)    PRIMARY KEY,
    pdName      VARCHAR2(50)    NOT NULL UNIQUE,
    pdImg       VARCHAR2(100)   NOT NULL,
    category    VARCHAR2(20)    NOT NULL,
    brand       VARCHAR2(50)    NOT NULL,
    content     CLOB,
    price       NUMBER          DEFAULT 0,
    quantity    NUMBER          DEFAULT 0,
    status      VARCHAR2(20)    NOT NULL,
    indate      DATE            DEFAULT sysdate
    
);
*/