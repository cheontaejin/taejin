package com.spring.screen_choen_sp.dto;

import java.sql.Date;

public class OrderDTO {
	
	private int order_code;
	private String pd_code;
	private String ac_id;
	private int order_quan;
	private String order_status;
	private Date order_date;
	private int order_rownum;
	private String pd_name;
	private int pd_salary;
	private Date order_approve_date;
	private int settle;
	
	public int getOrder_code() {
		return order_code;
	}
	public void setOrder_code(int order_code) {
		this.order_code = order_code;
	}
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public String getAc_id() {
		return ac_id;
	}
	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
	}
	public int getOrder_quan() {
		return order_quan;
	}
	public void setOrder_quan(int order_quan) {
		this.order_quan = order_quan;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getOrder_rownum() {
		return order_rownum;
	}
	public void setOrder_rownum(int order_rownum) {
		this.order_rownum = order_rownum;
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
	public Date getOrder_approve_date() {
		return order_approve_date;
	}
	public void setOrder_approve_date(Date order_approve_date) {
		this.order_approve_date = order_approve_date;
	}
	public int getSettle() {
		return settle;
	}
	public void setSettle(int settle) {
		this.settle = settle;
	}
	
	
	
}