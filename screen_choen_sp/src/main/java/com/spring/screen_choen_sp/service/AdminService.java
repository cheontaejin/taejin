package com.spring.screen_choen_sp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface AdminService {

	// 로그인 처리 
	public int AdminloginAction(HttpServletRequest req, Model model);
	
	// 
	public void accountList(HttpServletRequest req, Model model);
	
}
