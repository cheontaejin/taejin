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

import com.spring.screen_choen_sp.dto.ProductDTO;


public class ProductDAOImpl implements ProductDAO {
	
	// 싱글톤 방식 : 객체를 1번만 생성 
		static ProductDAOImpl instance = new ProductDAOImpl();
		public static ProductDAOImpl getInstance() {
			if(instance == null) {
				instance = new ProductDAOImpl();
			}
			return instance;
		}
		
		// 생성자 
		private ProductDAOImpl() {
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
		
		// 상품 추가 처리
		   @Override
		   public int productInsert(ProductDTO dto) {
		      System.out.println("DAO - boardInsert");
		      
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      int insertCnt = 0;
		      
		      try {
		         conn = dataSource.getConnection();
		         String sql =  "INSERT INTO ad_product(PD_CODE, AC_CODE, PD_CATEGORY, PD_MAKE, PD_NAME, PD_IMG, PD_DETAIL_IMG, PD_SALARY, PD_STOCK, PD_STATUS, PD_DATE) "
		                  + "VALUES(ADD_PD_CODE.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, dto.getAc_code());
		         pstmt.setString(2, dto.getPd_category());
		         pstmt.setString(3, dto.getPd_make());
		         pstmt.setString(4, dto.getPd_name());
		         pstmt.setString(5,  dto.getPd_img());
		         pstmt.setString(6, dto.getPd_detail_img());
		         pstmt.setInt(7, dto.getPd_salary());
		         pstmt.setInt(8, dto.getPd_stock());
		         pstmt.setString(9, dto.getPd_status());
		         
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
		
		
		// 상품 수정 처리
		@Override
		public int productUpdate(ProductDTO dto) {
			System.out.println("DAO - productUpdate");
	         
	         int updateCnt = 0;
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         
	         try {
	            
	            conn = dataSource.getConnection();
	            String sql = "UPDATE ad_product "
	                  + " SET pd_name = ?, pd_make = ?, pd_img = ?, pd_category = ?, pd_detail_img = ?, pd_salary = ?, pd_stock = ?, pd_status = ? "
	                  + "WHERE pd_code = ? ";
	                  
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1,dto.getPd_name());
	            pstmt.setString(2,dto.getPd_make());
	            pstmt.setString(3,dto.getPd_img());
	            pstmt.setString(4,dto.getPd_category());
	            pstmt.setString(5,dto.getPd_detail_img());
	            pstmt.setInt(6,dto.getPd_salary());
	            pstmt.setInt(7,dto.getPd_stock());
	            pstmt.setString(8,dto.getPd_status());
	            pstmt.setInt(9,dto.getPd_code());
	            
	            updateCnt = pstmt.executeUpdate();
	            System.out.println("DAO - productUpdate - updateCnt" + updateCnt);
	            
	         } catch(SQLException e) {
	            e.printStackTrace();
	         } finally {
	            // 사용한 자원 해제
	            try {
	               if(pstmt!=null)pstmt.close();
	               if(conn!=null)conn.close();
	            } catch(SQLException e) {
	               e.printStackTrace();
	            }
	         }
	         return updateCnt;
	      }

		// 상품 상세페이지
		@Override
		public ProductDTO getProductDetail(int pdNo) {
			System.out.println("DAO - getProductDetail");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ProductDTO dto = new ProductDTO();
			
			try {
				conn = dataSource.getConnection();
				String sql = "SELECT PD_CODE, AC_CODE, PD_CATEGORY, PD_MAKE, PD_NAME, PD_IMG, PD_DETAIL_IMG, PD_SALARY, PD_STOCK, PD_STATUS, PD_DATE "
							 + "FROM ad_product "
							 + "WHERE PD_CODE=?";
				System.out.println("sql : " + sql);
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, pdNo);
				rs = pstmt.executeQuery();
				
				// dto에 게시글 정보를 담는다.
				if(rs.next()) {
					dto.setPd_code(rs.getInt("PD_CODE"));
					dto.setPd_category(rs.getString("PD_CATEGORY"));
					dto.setAc_code(rs.getInt("AC_CODE"));
					dto.setPd_make(rs.getString("PD_MAKE"));
					dto.setPd_img(rs.getString("PD_IMG"));
					dto.setPd_name(rs.getString("PD_NAME"));
					dto.setPd_status(rs.getString("PD_STATUS"));
					dto.setPd_salary(rs.getInt("PD_SALARY"));
					dto.setPd_stock(rs.getInt("PD_STOCK"));
					dto.setPd_date(rs.getDate("PD_DATE"));
					dto.setPd_detail_img(rs.getString("PD_DETAIL_IMG"));
				}
				// list에 dto를 추가한다.
				
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
			return dto;
		}

		// 상품 삭제 처리
		@Override
		public int productDelete(int pd_code) {
			System.out.println("DAO - productDelete");
	         
	         int updateCnt = 0;
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         
	         try {
	            
	            conn = dataSource.getConnection();
	            String sql = "DELETE FROM ad_product WHERE pd_code=?";
	                  
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, pd_code);
	            
	            updateCnt = pstmt.executeUpdate();
	            System.out.println("DAO - productDelete - updateCnt" + updateCnt);
	            
	         } catch(SQLException e) {
	            e.printStackTrace();
	         } finally {
	            // 사용한 자원 해제
	            try {
	               if(pstmt!=null)pstmt.close();
	               if(conn!=null)conn.close();
	            } catch(SQLException e) {
	               e.printStackTrace();
	            }
	         }
	         return updateCnt;
		}
		

		// 상품 목록
		@Override
		public List<ProductDTO> productList(int start, int end) {
			System.out.println("DAO - productList");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<ProductDTO> list = null;
			
			try {
				conn = dataSource.getConnection();
				String sql = "SELECT * "
							 + 	"FROM ("
							 +	    "SELECT A.*, ROWNUM AS rn "		// 일련번호 매기기
							 +	      "FROM ("
							 +	        	"SELECT PD_CODE, AC_CODE, PD_CATEGORY, PD_MAKE, PD_NAME, PD_IMG, PD_DETAIL_IMG, PD_SALARY, PD_STOCK, PD_STATUS, PD_DATE "
							 +	        	  "FROM ad_product "
							 +	             "ORDER BY PD_CODE DESC"
							 +	        ") A "
							 +	")"
							 +	"WHERE rn BETWEEN ? AND ? ";
				
				System.out.println("sql : " + sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// list 생성
					list = new ArrayList<ProductDTO>();
					do {
						// dto 생성
						ProductDTO dto = new ProductDTO();
						
						// dto에 게시글 정보를 담는다.
						dto.setPd_rownum(rs.getInt("rn"));
						dto.setPd_code(rs.getInt("PD_CODE"));
						dto.setPd_category(rs.getString("PD_CATEGORY"));
						dto.setAc_code(rs.getInt("AC_CODE"));
						dto.setPd_make(rs.getString("PD_MAKE"));
						dto.setPd_img(rs.getString("PD_IMG"));
						dto.setPd_name(rs.getString("PD_NAME"));
						dto.setPd_status(rs.getString("PD_STATUS"));
						dto.setPd_salary(rs.getInt("PD_SALARY"));
						dto.setPd_stock(rs.getInt("PD_STOCK"));
						dto.setPd_date(rs.getDate("PD_DATE"));
						dto.setPd_detail_img(rs.getString("PD_DETAIL_IMG"));
						
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

		
		// 상품 갯수 구하기
		@Override
		public int productCnt() {
			System.out.println("DAO - count");
		      
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    int selectCnt = 0;
			
		    try {
		         conn = dataSource.getConnection();
		         String sql =  "SELECT COUNT(*) as cnt FROM ad_product";
		         pstmt = conn.prepareStatement(sql);
		         
		         rs = pstmt.executeQuery();
		         
		         if(rs.next()) {
		            selectCnt = rs.getInt("cnt");
		         }
		         
		      } catch(SQLException e) {
		         e.printStackTrace();
		      } finally {
		         // 사용한 자원해제
		         try {
		            if(rs != null) rs.close();
		            if(pstmt != null) pstmt.close();
		            if(conn != null) conn.close();
		         } catch(SQLException e) {
		            e.printStackTrace();
		         }
		      }
		      
		      return selectCnt;
		}
		
		
		// 검색
		@Override
		public List<ProductDTO> search(String keyword){
			System.out.println("DAO - search");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<ProductDTO> list = null;
			
			try {
				conn = dataSource.getConnection();
				String sql =  "SELECT * "
							+   "FROM ad_product "
							+  "WHERE PD_NAME LIKE '%' || ? || '%' "
							+  "ORDER BY PD_CODE DESC";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, keyword);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// list 생성
					list = new ArrayList<ProductDTO>();
					do {
						// dto 생성
						ProductDTO dto = new ProductDTO();
						
						// dto에 게시글 정보를 담는다.
						dto.setPd_code(rs.getInt("PD_CODE"));
						dto.setPd_category(rs.getString("PD_CATEGORY"));
						dto.setAc_code(rs.getInt("AC_CODE"));
						dto.setPd_make(rs.getString("PD_MAKE"));
						dto.setPd_img(rs.getString("PD_IMG"));
						dto.setPd_name(rs.getString("PD_NAME"));
						dto.setPd_status(rs.getString("PD_STATUS"));
						dto.setPd_salary(rs.getInt("PD_SALARY"));
						dto.setPd_stock(rs.getInt("PD_STOCK"));
						dto.setPd_date(rs.getDate("PD_DATE"));
						dto.setPd_detail_img(rs.getString("PD_DETAIL_IMG"));
						
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
		
		// 카테고리
		@Override
		public List<ProductDTO> category(String category){
			System.out.println("DAO - search");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<ProductDTO> list = null;
			
			try {
				conn = dataSource.getConnection();
				String sql =  "SELECT * "
							+   "FROM ad_product "
							+  "WHERE PD_CATEGORY LIKE ? "
							+  "ORDER BY PD_CODE DESC";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// list 생성
					list = new ArrayList<ProductDTO>();
					do {
						// dto 생성
						ProductDTO dto = new ProductDTO();
						
						// dto에 게시글 정보를 담는다.
						dto.setPd_code(rs.getInt("PD_CODE"));
						dto.setPd_category(rs.getString("PD_CATEGORY"));
						dto.setAc_code(rs.getInt("AC_CODE"));
						dto.setPd_make(rs.getString("PD_MAKE"));
						dto.setPd_img(rs.getString("PD_IMG"));
						dto.setPd_name(rs.getString("PD_NAME"));
						dto.setPd_status(rs.getString("PD_STATUS"));
						dto.setPd_salary(rs.getInt("PD_SALARY"));
						dto.setPd_stock(rs.getInt("PD_STOCK"));
						dto.setPd_date(rs.getDate("PD_DATE"));
						dto.setPd_detail_img(rs.getString("PD_DETAIL_IMG"));
						
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
}
