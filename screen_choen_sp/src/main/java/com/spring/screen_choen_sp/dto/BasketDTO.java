package com.spring.screen_choen_sp.dto;

import java.sql.Date;

public class BasketDTO {
	
	private int bk_code;
	private int pd_code;
	private String ac_id;
	private String pd_category;
	private String pd_make;
	private String pd_name;
	private int pd_salary;
	private int pd_stock;
	private String pd_status;
	private Date pd_date;
	private int pd_rownum;
	private int basket_quan;
	
	public BasketDTO() {
		
	}
	
	public int getBk_code() {
		return bk_code;
	}

	public void setBk_code(int bk_code) {
		this.bk_code = bk_code;
	}

	public int getPd_code() {
		return pd_code;
	}
	public void setPd_code(int pd_code) {
		this.pd_code = pd_code;
	}
	public String getAc_id() {
		return ac_id;
	}

	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
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
	public int getBasket_quan() {
		return basket_quan;
	}
	public void setBasket_quan(int basket_quan) {
		this.basket_quan = basket_quan;
	}

}
