package com.spring.screen_choen_sp.dao;

import java.util.List;

import com.spring.screen_choen_sp.dto.OrderDTO;


public interface OrderDAO {
	
	public int orderInsert(OrderDTO dto);
	
	public List<OrderDTO> orderList();
	
	public int orderApproval(OrderDTO oddto);
	
	public int orderCancel(OrderDTO oddto);
	
	public List<OrderDTO> orderListCustomer(String customerID);
	
}
