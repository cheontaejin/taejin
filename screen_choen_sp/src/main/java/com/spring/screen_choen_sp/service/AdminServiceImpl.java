package com.spring.screen_choen_sp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.screen_choen_sp.dao.AdminDAO;
import com.spring.screen_choen_sp.dao.CustomerDAO;
import com.spring.screen_choen_sp.dto.CustomerDTO;
import com.spring.screen_choen_sp.util.Paging;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO admindao;
	@Autowired
	CustomerDAO customerdao;

	// 로그인 처리
	@Override
	public int AdminloginAction(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		String strId = req.getParameter("id");
		String strPassword = req.getParameter("password");
		
		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		
		// 5단계. 로그인 처리
		Map<String, Object> map = new HashMap<>();
		map.put("strId", strId);
		map.put("strPassword", strPassword);
		int selectCnt = admindao.idPasswordChk(map);
		int ac_code = admindao.acCode(strId);
		
		// 로그인 성공 
		if(selectCnt == 1) {	
			// 로그인 성공시 세션 ID를 설정 
			req.getSession().setAttribute("customerID", strId);
			req.getSession().setAttribute("ac_code", ac_code);
		}
		
		// 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		req.setAttribute("selectCnt", selectCnt);
		
		return selectCnt;
		
	}
	
	// 회원리스트
		@Override
		public void accountList(HttpServletRequest req, Model model) {
			System.out.println("서비스 - productList");
			// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
			String pageNum = req.getParameter("pageNum");
			
			// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		    
		    // 5-1단계. 전체 게시글 갯수 카운트
		    Paging paging = new Paging(pageNum);
			
		    int total = customerdao.accountCnt();
		    paging.setTotalCount(total);
		    
		    System.out.println("total => " + total);
		    
		    int start = paging.getStartRow();
		    int end = paging.getEndRow();
		    
		    // 5-2 단계. 게시글 목록
		    List<CustomerDTO> list = customerdao.accountList(start, end);
		    System.out.println("왜 하나만 출력이되는것인가" + list);
		    
		    // 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		 	req.setAttribute("list", list);
		 	req.setAttribute("paging", paging);
			
		}

}
