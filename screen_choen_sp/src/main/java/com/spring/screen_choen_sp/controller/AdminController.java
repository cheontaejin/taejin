package com.spring.screen_choen_sp.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.screen_choen_sp.service.AdminServiceImpl;
import com.spring.screen_choen_sp.service.CustomerServiceImpl;
import com.spring.screen_choen_sp.service.OrderServiceImpl;


@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		
//	@Autowired
//	BoardServiceImpl boardService;
	@Autowired
	AdminServiceImpl adminService;
	@Autowired
	CustomerServiceImpl customerService;
	@Autowired
	OrderServiceImpl odService;
	 
	// -----------------------[로그인]-----------------------------
	// 관리자 - 로그인 화면
	@RequestMapping("adminLogin.ad")
	public String login(Model model) {
		logger.info("[url ==> adminLogin.ad]");
		
		model.addAttribute("selectCnt", 2);
		return "manager/login/login";
	}
	
	// 관리자 - 로그인 처리
	@RequestMapping("adminLoginAction.ad")
	public String adminLoginAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> adminLoginAction.ad]");
		
		int selectCnt = adminService.AdminloginAction(req, model);
		
		if(selectCnt == 1) {
			return "productList.st";
		} else {
			return "manager/login/login";
		}
	}
	
	// ----------------------------[회원관리]----------------------------
	// 관리자 - 회원정보 리스트
	@RequestMapping("accountList.ad")
	public String accountList(HttpServletRequest req, Model model) {
		logger.info("[url ==> accountList.ad]");
		
		adminService.accountList(req, model);
		return "manager/account/accountList";
	}
	
	// 회원수정 - 상세페이지
	@RequestMapping("accountModifyDetailAction.ad")
	public String accountModifyDetailAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> accountModifyDetailAction.ad]");
		
		customerService.accountModifyDetailAction(req, model);
		return "manager/account/accountModifyDetailAction";
	}
			
		/*
		// 회원수정 - 상세페이지 
		} else if(url.equals("/accountModifyDetailAction.ad")) {
			System.out.println("[url ==> accountModifyDetailAction.ad]_controller 122행");
			
			customerService.accountModifyDetailAction(req, res);
			
			viewPage = "manager/account/accountModifyDetailAction.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);

		// 회원수정 처리
		} else if(url.equals("/accountModifyCustomerAction.do")) {
			System.out.println("[url ==> accountModifyCustomerAction.do]_controller 131행");
			customerService.modifyCustomerAction(req, res);
			
			viewPage = "manager/account/accountModifyCustomerAction.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		
		
		// ---------------------- board -----------------------
		// 게시글 목록
		} else if(url.equals("/boardList.ad")) {
			System.out.println("[url ==> boardList.ad]");
			
			boardService.boardList(req, res);
			viewPage = "manager/csCenter/boardList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
			
		// 글쓰기
		} else if(url.equals("/board_insertAction.ad")) {
			System.out.println("[url ==> board_insertAction.ad]");
			
			boardService.boardInsert(req, res);
			viewPage = req.getContextPath() + "/boardList.ad";
			res.sendRedirect(viewPage);
		
		// 상세페이지
		} else if(url.equals("/board_detailAction.ad")) {
			System.out.println("[url ==> board_detailAction.ad]");
			
			boardService.boardDetail(req, res);
			
			viewPage = "manager/csCenter/board_detailAction.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
			
		// 수정 삭제시 비밀번호 인증
		} else if(url.equals("/password_chk.ad")) {
			System.out.println("[url ==> /password_chk.ad]");
			
			boardService.password_chk(req, res);
			
			//viewPage = "manager/csCenter/board_edit.jsp";
			
		// 게시글 수정
		} else if(url.equals("/board_updateAction.ad")) {
			System.out.println("[url ==> /board_updateAction.ad]");
			
			boardService.boardUpdate(req, res);
			
			//viewPage = "manager/csCenter/board_edit.jsp";
		
		// 게시글 삭제
		} else if(url.equals("/board_deleteAction.ad")) {
			System.out.println("[url ==> /board_deleteAction.ad]");
			
			boardService.boardDelete(req, res);
			
			
			viewPage = req.getContextPath() + "/boardList.ad";
			res.sendRedirect(viewPage);
			
		// ---------------------------- 댓글 ---------------------------
		// 댓글 작성
		} else if(url.equals("/commentAdd.ad")) {
			System.out.println("[url ==> commentAdd.ad]");
			
			boardService.commentAdd(req, res);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
			
		// 댓글 목록
		} else if(url.equals("/commentList.ad")) {
			System.out.println("[url ==> commentList.ad]");
			
			boardService.commentList(req, res);
			
			viewPage = "manager/csCenter/commentList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
			
		} else if(url.equals("/logout.ad")) {
			System.out.println("[url ==> logout.ad]");
			
			viewPage = "common/main.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
			
		// ---------------------------- 주문 ---------------------------
		} else if(url.equals("/orderList.ad")) {
			System.out.println("[url ==> orderList.ad]");
			odService.orderList(req, res);
			
			viewPage = "manager/order/orderList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
			
		} else if(url.equals("/orderApproval.ad")) {
			System.out.println("[url ==> orderApproval.ad]");
			odService.orderApproval(req, res);
			odService.orderList(req, res);
			
			viewPage = "manager/order/orderList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
			
		} else if(url.equals("/orderCancel.ad")) {
			System.out.println("[url ==> orderCancel.ad]");
			odService.orderCancel(req, res);
			odService.orderList(req, res);
			
			viewPage = "manager/order/orderList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
			
		} 
		*/
}