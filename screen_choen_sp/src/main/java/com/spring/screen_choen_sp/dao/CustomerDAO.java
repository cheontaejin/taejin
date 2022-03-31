package com.spring.screen_choen_sp.dao;

import java.util.List;

import com.spring.screen_choen_sp.dto.CustomerDTO;



public interface CustomerDAO {
	
	// ID 중복확인 처리 
	public int idCheck(String strId);
	
//	// 회원가입 처리 
//	public int insertCustomer(CustomerDTO dto);
//	
//	// 로그인 처리  / 회원정보 인증(수정, 탈퇴)
//	public int idPasswordChk(String strID, String strPassword);
//	
//	// 회원정보 인증 및 탈퇴처리 
//	public int deleteCustomer(String strId);
//	
//	// 회원정보 인증 및 상세페이지 
//	public CustomerDTO getCustomerDetail(String strId);
//	
//	// 회원정보 수정 처리 
//	public int updateCustomer(CustomerDTO dto);
//	
//	// 회원 갯수 구하기
//	public int accountCnt();
//	
//	// 회원 리스트
//	public List<CustomerDTO> accountList(int start, int end);
//	
//	// 관리자 - 회원정보 인증
//	public CustomerDTO accountGetCustomerDetail(String strId);
}
