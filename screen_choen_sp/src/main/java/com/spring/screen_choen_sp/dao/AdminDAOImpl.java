package com.spring.screen_choen_sp.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("adminDAOImpl - idPasswordChk");
		
		int selectCnt = sqlSession.selectOne("com.spring.cheon.dao.AdminDAO.idPasswordChk", map);
		
		return selectCnt;
	}

	@Override
	public int acCode(String strID) {
		System.out.println("adminDAOImpl - acCode");
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.acCode(strID);
	}

}
