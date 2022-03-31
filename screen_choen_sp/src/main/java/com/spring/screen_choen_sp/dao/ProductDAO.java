package com.spring.screen_choen_sp.dao;

import java.util.List;

import com.spring.screen_choen_sp.dto.ProductDTO;


public interface ProductDAO {

	// 상품 추가 처리
	public int productInsert(ProductDTO dto);
	
	
	// 상품 수정 처리
	public int productUpdate(ProductDTO dto);
	
	// 상품 상세페이지
	public ProductDTO getProductDetail(int pdNo);
	
	// 상품 삭제 처리
	public int productDelete(int pdNo);
	
	// 상품 목록
	public List<ProductDTO> productList(int start, int end);
	
	// 상품 갯수 구하기
	public int productCnt();
	
	// 검색
	public List<ProductDTO> search(String keyword);
	
	public List<ProductDTO> category(String category);
	
}
