package com.spring.screen_choen_sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.spring.screen_choen_sp.dto.OrderDTO;



public class OrderDAOImpl implements OrderDAO {
	
	// 싱글톤 방식 : 객체를 1번만 생성 
	static OrderDAOImpl instance = new OrderDAOImpl();
	public static OrderDAOImpl getInstance() {
		if(instance == null) {
			instance = new OrderDAOImpl();
		}
		return instance;
	}
	
	// 생성자 
	private OrderDAOImpl() {
		/*
		 * [커넥션풀] : 매번 connection을 만들지 말고 커넥션풀 이용(context.xml 이용) 
		 * DBCP(Data Base Connection Pool) 설정을 읽어서 컨넥션을 발급받겠다.
		 * 1. Context : Servers > context.xml 파일의 Resource 객체에 추가 
		 * 2. lookup("java:comp/env/[커넥션풀 name]");
		 * 주의사항 : 톰캣 재설치시 resource 정보가 날라가므로 재추가할 것 
		 */
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/modeling");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	};
	
	// 커넥션 풀 객체를 보관 
	DataSource dataSource;
	@Override
	public int orderInsert(OrderDTO dto) {
		 System.out.println("DAO - orderInsert");
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int insertCnt = 0;
	      
	      try {
	         conn = dataSource.getConnection();
	         String sql =  "INSERT INTO order_tbl(order_code, pd_code, ac_id, order_quan, order_status, order_date) "
	                  + "VALUES(add_od_code.nextval, ?, ?, ?, '대기', sysdate)";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getPd_code());
	         pstmt.setString(2, dto.getAc_id());
	         pstmt.setInt(3, dto.getOrder_quan());
	         
	         insertCnt = pstmt.executeUpdate();
	         
	      } catch(SQLException e) {
	         e.printStackTrace();
	      } finally {
	         // 사용한 자원해제
	         try {
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	         } catch(SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return insertCnt;
	}

	@Override
	public List<OrderDTO> orderList() {
		System.out.println("DAO - orderList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDTO> list = null;
		int settle = 0;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT A.*, ROWNUM AS rn "		// 일련번호 매기기
						 +	 "FROM ("
						 +		"SELECT pd_name, order_code, order_quan, order_status, ac_id, order_date, pd_salary, order_approve_date "
						 + 		"FROM view_order "
						 +	             "ORDER BY order_code DESC"
						 +	        ") A ";
			
			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			
			if(rs.next()) {
				// list 생성
				list = new ArrayList<OrderDTO>();
				do {
					// dto 생성
					
					OrderDTO dto = new OrderDTO();
					// dto에 게시글 정보를 담는다.
					dto.setOrder_rownum(rs.getInt("rn"));
					dto.setPd_name(rs.getString("pd_name"));
					dto.setOrder_code(rs.getInt("order_code"));
					dto.setOrder_quan(rs.getInt("order_quan"));
					dto.setOrder_status(rs.getString("order_status"));
					dto.setAc_id(rs.getString("ac_id"));
					dto.setOrder_date(rs.getDate("order_date"));
					dto.setPd_salary(rs.getInt("pd_salary"));
					dto.setOrder_approve_date(rs.getDate("order_approve_date"));
					
					if(rs.getString("order_status").equals("승인")) {
						settle += rs.getInt("order_quan") * rs.getInt("pd_salary");
					}
					
					dto.setSettle(settle);
					// list에 dto를 추가한다.
					list.add(dto);
					
				} while(rs.next());
				
			}
			
			System.out.println("settle : " + list.get(list.size()-1).getSettle());
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원해제 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	@Override
	public List<OrderDTO> orderListCustomer(String customerID) {
		System.out.println("DAO - orderList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDTO> list = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT A.*, ROWNUM AS rn "		// 일련번호 매기기
						 +	 "FROM ("
						 +		"SELECT pd_name, order_code, order_quan, order_status, ac_id, order_date, pd_salary, order_approve_date "
						 + 		"FROM view_order "
						 +		"WHERE ac_id=? "
						 +	             "ORDER BY order_code DESC"
						 +	        ") A ";
			
			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customerID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// list 생성
				list = new ArrayList<OrderDTO>();
				do {
					// dto 생성
					OrderDTO dto = new OrderDTO();
					
					// dto에 게시글 정보를 담는다.
					dto.setOrder_rownum(rs.getInt("rn"));
					dto.setPd_name(rs.getString("pd_name"));
					dto.setOrder_code(rs.getInt("order_code"));
					dto.setOrder_quan(rs.getInt("order_quan"));
					dto.setOrder_status(rs.getString("order_status"));
					dto.setAc_id(rs.getString("ac_id"));
					dto.setOrder_date(rs.getDate("order_date"));
					dto.setPd_salary(rs.getInt("pd_salary"));
					dto.setOrder_approve_date(rs.getDate("order_approve_date"));
					
					// list에 dto를 추가한다.
					list.add(dto);
				} while(rs.next());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원해제 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public int orderApproval(OrderDTO oddto) {
		 System.out.println("DAO - orderApproval");
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int insertCnt = 0;
	      
	      try {
	         conn = dataSource.getConnection();
	         String sql =  "UPDATE order_tbl SET order_status='승인', order_approve_date=sysdate WHERE order_code=?";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, oddto.getOrder_code());
	         
	         insertCnt = pstmt.executeUpdate();
	         
	      } catch(SQLException e) {
	         e.printStackTrace();
	      } finally {
	         // 사용한 자원해제
	         try {
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	         } catch(SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      
	      try {
		         conn = dataSource.getConnection();
		         String sql =  "UPDATE ad_product "
	         				+ "SET PD_STOCK = PD_STOCK - (SELECT order_quan "
	         				+ 							 "FROM order_tbl "
	         				+ 							"WHERE order_code=?) "
	         				+ "WHERE pd_code = (SELECT pd_code "
	         				+ 					 "FROM order_tbl "
	         				+ 					"WHERE order_code=?)";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, oddto.getOrder_code());
		         pstmt.setInt(2, oddto.getOrder_code());
		         insertCnt = pstmt.executeUpdate();
		         
		      } catch(SQLException e) {
		         e.printStackTrace();
		      } finally {
		         // 사용한 자원해제
		         try {
		            if(pstmt != null) pstmt.close();
		            if(conn != null) conn.close();
		         } catch(SQLException e) {
		            e.printStackTrace();
		         }
		      }
	      
	      return insertCnt;
	}

	@Override
	public int orderCancel(OrderDTO oddto) {
		System.out.println("DAO - orderApproval");
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int insertCnt = 0;
	      int insertCnt2 = 0;
	      try {
	         conn = dataSource.getConnection();
	         String sql =  "UPDATE order_tbl SET order_status='취소' WHERE order_code=?";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, oddto.getOrder_code());
	         
	         insertCnt2 = pstmt.executeUpdate();
	         
	         
	      } catch(SQLException e) {
	         e.printStackTrace();
	      } finally {
	         // 사용한 자원해제
	         try {
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	         } catch(SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      
	      try {
		         conn = dataSource.getConnection();
		         String sql =  "UPDATE ad_product "
	         				+ "SET PD_STOCK = PD_STOCK + (SELECT order_quan "
	         				+ 							 "FROM order_tbl "
	         				+ 							"WHERE order_code=?) "
	         				+ "WHERE pd_code = (SELECT pd_code "
	         				+ 					 "FROM order_tbl "
	         				+ 					"WHERE order_code=?)";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, oddto.getOrder_code());
		         pstmt.setInt(2, oddto.getOrder_code());
		         insertCnt = pstmt.executeUpdate();
		         
		      } catch(SQLException e) {
		         e.printStackTrace();
		      } finally {
		         // 사용한 자원해제
		         try {
		            if(pstmt != null) pstmt.close();
		            if(conn != null) conn.close();
		         } catch(SQLException e) {
		            e.printStackTrace();
		         }
		      }
	      
	      return insertCnt;
	}
	
	

}
