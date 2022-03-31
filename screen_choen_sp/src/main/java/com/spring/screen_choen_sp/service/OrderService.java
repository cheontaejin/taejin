package com.spring.screen_choen_sp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface OrderService {

	// 게시글 목록
	
	public void orderAddAction(HttpServletRequest req, HttpServletResponse res);

	public void orderList(HttpServletRequest req, HttpServletResponse res);
	
	public void orderBuy(HttpServletRequest req, HttpServletResponse res);
	
	public void orderDelete(HttpServletRequest req, HttpServletResponse res);
	
	public void orderAllDelete(HttpServletRequest req, HttpServletResponse res);
	
	public void orderAllBuy(HttpServletRequest req, HttpServletResponse res);
	
	public void orderListCustomer(HttpServletRequest req, HttpServletResponse res);
	
	public void orderApproval(HttpServletRequest req, HttpServletResponse res);
	
	public void orderCancel(HttpServletRequest req, HttpServletResponse res);
	
}
