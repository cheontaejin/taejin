package com.spring.screen_choen_sp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface CustomerService {
	
	// 중복확인 처리
	public void confirmIdAction(HttpServletRequest req, HttpServletResponse res);
	
	// 회원가입 처리 
	public void signInAction(HttpServletRequest req, HttpServletResponse res);
	
	// 로그인 처리 
	public int loginAction(HttpServletRequest req, HttpServletResponse res);
	
	// 회원정보 인증 및 탈퇴처리 
	public void deleteCustomerAction(HttpServletRequest req, HttpServletResponse res);
	
	// 회원정보 인증 및 상세페이지 
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res);
	
	// 회원정보 수정 처리 
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res);
	
	// 이메일 인증 
	public void search(HttpServletRequest req, HttpServletResponse res);
	
	// 회원수정 - 상세페이지
	public void accountModifyDetailAction(HttpServletRequest req, Model model);
	
	public void category(HttpServletRequest req, HttpServletResponse res);
}
