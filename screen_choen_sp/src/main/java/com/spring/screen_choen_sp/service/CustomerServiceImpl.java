package com.spring.screen_choen_sp.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.spring.screen_choen_sp.dao.CustomerDAO;
import com.spring.screen_choen_sp.dao.CustomerDAOImpl;
import com.spring.screen_choen_sp.dao.ProductDAO;
import com.spring.screen_choen_sp.dao.ProductDAOImpl;
import com.spring.screen_choen_sp.dto.CustomerDTO;
import com.spring.screen_choen_sp.dto.ProductDTO;


public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	CustomerDAOImpl customerDao;
	
	// 중복확인 처리
	@Override
	public void confirmIdAction(HttpServletRequest req, HttpServletResponse res) {
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String strId = req.getParameter("id");
				
		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		
		// 5단계. 중복확인 처리 
		int selectCnt = customerDao.idCheck(strId);
		
		// 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("id", strId);
	}
	
	// 회원가입 처리
	@Override
	public void signInAction(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 => 회원가입처리_serviceImpl 34행");
		
		// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		// dto 생성
		CustomerDTO dto = new CustomerDTO();
		dto.setAc_id(req.getParameter("id"));
		dto.setAc_pw(req.getParameter("password"));
		dto.setAc_name(req.getParameter("name"));
		dto.setAc_birth(req.getParameter("birth"));
		//Date date = Date.valueOf(strDate);
		//dto.setAc_birth(date);
		dto.setAc_add(req.getParameter("address"));
		
		// regDate는 입력값이 없느면 default가 SYSDATE로 설정했기에,
        // 아래 행을 통해 직접 SYSDATE값을 넣어줄 수 있고, 아니면 값을 넣지 않아도 좋다
		/* dto.setRegDate(new Timestamp(System.currentTimeMillis())); */
		
		// hp는 필수가 아니므로 null값이 들어올 수 있으므로 값이 존재할 때만 처리
		String hp = "";
		String strHp1 = req.getParameter("hp1");
		String strHp2 = req.getParameter("hp2");
		String strHp3 = req.getParameter("hp3");
		
		if(!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
			hp = strHp1 + "-" + strHp2 + "-" + strHp3;
		}
		dto.setAc_tel(hp);
		
		String email = "";
		String strEmail1 = req.getParameter("email1");
		String strEmail2 = req.getParameter("email2");
		email = strEmail1 + "@" + strEmail2;
		dto.setAc_email(email);
		
		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		
		// 5단계. 회원가입 처리
		int insertCnt = customerDao.insertCustomer(dto);
		System.out.println("서비스 insertCnt_serviceImpl 69행 : " + insertCnt);
		
		// 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		req.setAttribute("insertCnt", insertCnt);
		
	}
	
	// 로그인 처리
	@Override
	public int loginAction(HttpServletRequest req, HttpServletResponse res) {
		// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		String strId = req.getParameter("id");
		String strPassword = req.getParameter("password");
		
		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		
		// 5단계. 로그인 처리
		int selectCnt = customerDao.idPasswordChk(strId, strPassword);
		
		// 로그인 성공 
		if(selectCnt == 1) {	
			// 로그인 성공시 세션 ID를 설정 
			req.getSession().setAttribute("customerID", strId);
		}
		
		// 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		req.setAttribute("selectCnt", selectCnt);
		
		return selectCnt;
	}

	// 회원정보 인증 및 탈퇴처리
	@Override
	public void deleteCustomerAction(HttpServletRequest req, HttpServletResponse res) {
		// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		String strId = (String)req.getSession().getAttribute("customerID");	// 세션ID
		String strPassword = req.getParameter("password");
		int deleteCnt = 0;
		
		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		
		// 5-1단계. 회원수정을 위한 처리
		
		// 5-2단계. 인증성공시 상세정보 조회
		deleteCnt = customerDao.deleteCustomer(strId);
		System.out.println("updateCnt_serImpl 167행 : " + deleteCnt);
		
		// 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		req.setAttribute("deleteCnt", deleteCnt);
	}
	
	// 회원정보 인증 및 상세페이지 
	@Override
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res) {
		// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		String strId = (String)req.getSession().getAttribute("customerID");	// 세션ID
		String strPassword = req.getParameter("password");
		
		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		
		// 5-1단계. 회원수정을 위한 처리
		int selectCnt = customerDao.idPasswordChk(strId, strPassword);
		System.out.println("수정서비스 selectCnt_serImpl 134행 : " + selectCnt);
		
		CustomerDTO dto = null;
		// 5-2단계. 인증성공시 상세정보 조회
		if(selectCnt == 1) {
			dto = customerDao.getCustomerDetail(strId);
			System.out.println("dto_serImpl 140행 : " + dto);
		}
		
		// 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("dto", dto);
	}
	
	// 회원수정 - 상세페이지
	@Override
	public void accountModifyDetailAction(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		String strId = req.getParameter("ac_code");	// 세션ID
		
		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		
		// 5-1단계. 회원수정을 위한 처리
		CustomerDTO dto = null;
		// 5-2단계. 인증성공시 상세정보 조회
		dto = customerDao.getCustomerDetail(strId);
		
		// 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		req.setAttribute("dto", dto);
	}
	
	// 회원정보 수정 처리
	@Override
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res) {
		// 3-1단계. dto 생성후, 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		CustomerDTO dto = new CustomerDTO();
		// 3-2단계. 화면이나 세션으로부터 입력받은 값을 받아서 dto에 담는다.
		dto.setAc_id((String)req.getSession().getAttribute("customerID"));
		dto.setAc_pw(req.getParameter("password"));
		dto.setAc_name(req.getParameter("name"));
		dto.setAc_birth(req.getParameter("birthday"));
		dto.setAc_add(req.getParameter("address"));
		
		String hp = "";
		String strHp1 = req.getParameter("hp1");
		String strHp2 = req.getParameter("hp2");
		String strHp3 = req.getParameter("hp3");
		
		if(!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
			hp = strHp1 + "-" + strHp2 + "-" + strHp3;
		}
		dto.setAc_tel(hp);
		
		String email = "";
		String strEmail1 = req.getParameter("email1");
		String strEmail2 = req.getParameter("email2");
		email = strEmail1 + "@" + strEmail2;
		dto.setAc_email(email);
		
		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		
		// 5단계. 회원수정 처리
		int updateCnt = customerDao.updateCustomer(dto);
		System.out.println("updateCnt_serImpl 167행 : " + updateCnt);
		
		// 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		req.setAttribute("updateCnt", updateCnt);
	}
	
	// 검색
	@Override
	public void search(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 - search");
		
		String keyword = req.getParameter("keyword");
		
		ProductDAO dao = ProductDAOImpl.getInstance();
		
		List<ProductDTO> list = dao.search(keyword);
		
		req.setAttribute("list", list);
		
	}
	
	// 카테고리
	@Override
	public void category(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 - search");
		
		String category = req.getParameter("PD_CATEGORY");
		
		ProductDAO dao = ProductDAOImpl.getInstance();
		
		List<ProductDTO> list = dao.category(category);
		
		req.setAttribute("list", list);
		
	}

}
