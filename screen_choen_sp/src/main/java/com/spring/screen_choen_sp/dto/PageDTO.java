package com.spring.screen_choen_sp.dto;

public class PageDTO {
	
	private int startPage;		// 게시글 목록의 첫번째 페이지 번호
	private int endPage;		// 게시글 목록의 마지막 페이지 번호
	private boolean prev, next;	// 이번버튼, 다음버튼 활성화여부
	private int pageNum;		// 현재 페이지 번호
	private int amount = 10;	// 한페이지당 게시글수
	private int total;			// 전체 게시글수
	
	public PageDTO() {
		
	}
	
	public PageDTO(int pageNum, int amount, int total) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.total = total;
	}

	public PageDTO(int startPage, int endPage, boolean prev, boolean next, int pageNum, int amount, int total) {

		// endPage
		/*
		 * 조회페이지 1 ~ 10	: 1페이지
		 * 조회페이지 11 ~ 20	: 2페이지
		 * 조회페이지 21 ~ 30	: 3페이지
		 * 공식 : 끝페이지- 페이지네비게이션 갯수 + 1
		 *  예) 조회페이지 1 ~ 10	: 1페이지
		 *  	this.endPage = this.endPage - 10 + 1;
		 */
		
		
		// startPage
//		this.startPage = startPage;
		this.startPage = this.endPage - 10 + 1;
		
		// endPage
//		this.endPage = endPage;
		this.endPage = (int)Math.ceil(this.pageNum * 0.1) + 10;
		
		// 3. int readEnd = (int)Math.ceil(전체 게시글수 / 한 화면당 갯수);
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
//		this.prev = prev;
		// startPage의 번호는 1, 11, 21 ...
		this.prev = this.startPage > 1;
		
//		this.next = next;
		this.next = this.endPage < realEnd;
		
//		this.pageNum = pageNum;
		
//		this.amount = amount;
		
//		this.total = total;
		
		
	}
	
	
}
