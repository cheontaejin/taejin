package com.spring.screen_choen_sp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.screen_choen_sp.dao.OrderDAO;
import com.spring.screen_choen_sp.dao.OrderDAOImpl;
import com.spring.screen_choen_sp.dto.OrderDTO;


public class OrderServiceImpl implements OrderService{

	@Override
	public void orderAddAction(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 - orderAddAction");
	      
       // 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
       OrderDTO oddto = new OrderDTO();
       
       
       oddto.setPd_code(req.getParameter("pd_code"));
       oddto.setOrder_quan(Integer.parseInt(req.getParameter("quan")));
       oddto.setAc_id((String)req.getSession().getAttribute("customerID"));
       
       // 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
       OrderDAO oddao = OrderDAOImpl.getInstance();
      
       // 5단계. 상품정보 insert
       int insertCnt = oddao.orderInsert(oddto);
      
       System.out.println("insertCnt : " + insertCnt);  // 정상 : 1
      
       // 1   비스포크   /jsp_pj_105/resources/upload/비스포크냉장고.jpg   주방가전   삼성   비스포크 디자인, 성능 최신형   890000   5   판매중   22/02/28
       // upload폴더를 새로고침하면 등록한 이미지가 들어온다.
      
       // 6단계. jsp로 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
       req.setAttribute("insertCnt : ", insertCnt);
		
	}
	
	@Override
	public void orderListCustomer(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 - orderList");
 		// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
 		
 		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		OrderDAO oddao = OrderDAOImpl.getInstance();
		String customerID = (String)req.getSession().getAttribute("customerID");
 	    
 	    // 5-1단계. 전체 게시글 갯수 카운트
 	    
 	    // 5-2 단계. 게시글 목록
 	    List<OrderDTO> list = oddao.orderListCustomer(customerID);
 	    
 	    // 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
 	 	req.setAttribute("list", list);
		
	}

	@Override
	public void orderList(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 - orderList");
 		// 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
 		
 		// 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
		OrderDAO oddao = OrderDAOImpl.getInstance();
 	    
 	    // 5-1단계. 전체 게시글 갯수 카운트
 	    
 	    // 5-2 단계. 게시글 목록
 	    List<OrderDTO> list = oddao.orderList();
 	    req.setAttribute("total", list.get(list.size()-1).getSettle());
 	    
 	    // 6단계. JSP결과 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
 	 	req.setAttribute("list", list);
		
	}

	@Override
	public void orderBuy(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderDelete(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderAllDelete(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderAllBuy(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderApproval(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 - orderAddAction");
	      
        // 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
        OrderDTO oddto = new OrderDTO();
       
       
        oddto.setOrder_code(Integer.parseInt(req.getParameter("order_code")));
        oddto.setOrder_quan(Integer.parseInt(req.getParameter("order_quan")));
        oddto.setPd_code(req.getParameter("pd_code"));
        oddto.setAc_id((String)req.getSession().getAttribute("customerID"));
       
        // 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
        OrderDAO oddao = OrderDAOImpl.getInstance();
      
        // 5단계. 상품정보 insert
        int updateCnt = oddao.orderApproval(oddto);
      
        System.out.println("insertCnt : " + updateCnt);  // 정상 : 1
      
        // 1   비스포크   /jsp_pj_105/resources/upload/비스포크냉장고.jpg   주방가전   삼성   비스포크 디자인, 성능 최신형   890000   5   판매중   22/02/28
        // upload폴더를 새로고침하면 등록한 이미지가 들어온다.
      
        // 6단계. jsp로 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
        req.setAttribute("insertCnt : ", updateCnt);
		
	}

	@Override
	public void orderCancel(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 - orderAddAction");
	      
        // 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
        OrderDTO oddto = new OrderDTO();
       
       
        oddto.setOrder_code(Integer.parseInt(req.getParameter("order_code")));
        oddto.setOrder_quan(Integer.parseInt(req.getParameter("order_quan")));
        oddto.setAc_id((String)req.getSession().getAttribute("customerID"));
       
        // 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
        OrderDAO oddao = OrderDAOImpl.getInstance();
      
        // 5단계. 상품정보 insert
        int updateCnt = oddao.orderCancel(oddto);
      
        System.out.println("insertCnt : " + updateCnt);  // 정상 : 1
      
        // 1   비스포크   /jsp_pj_105/resources/upload/비스포크냉장고.jpg   주방가전   삼성   비스포크 디자인, 성능 최신형   890000   5   판매중   22/02/28
        // upload폴더를 새로고침하면 등록한 이미지가 들어온다.
      
        // 6단계. jsp로 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
        req.setAttribute("insertCnt : ", updateCnt);
		
	}
	
}
