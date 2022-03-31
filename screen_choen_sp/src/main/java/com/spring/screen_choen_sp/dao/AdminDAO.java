package com.spring.screen_choen_sp.dao;

import java.util.Map;

public interface AdminDAO {
	
	// 로그인 처리  / 회원정보 인증(수정, 탈퇴)
	public int idPasswordChk(Map<String, Object> map);
	
	// 계정 코드 읽어오기
	public int acCode(String strID);
	
}
