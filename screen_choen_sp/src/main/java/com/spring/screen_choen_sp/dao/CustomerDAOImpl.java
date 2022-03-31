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

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.screen_choen_sp.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 중복확인 처리
	@Override
	public int idCheck(String strId) {
		System.out.println("dao - idCheck");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.idCheck(strId);
	}
	
	
	// 회원가입 처리 
	@Override
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("dao_daoImpl 84행 - 회원가입처리");
		
		int insertCnt = 0;
		Connection conn = null;	// 오라클 연결
		PreparedStatement pstmt = null;	// SQL 문장 
		
		try {
			conn = dataSource.getConnection();
			String sql = "INSERT INTO ACCOUNT_TBL(AC_CODE, AC_ID, AC_NAME, AC_PW, AC_BIRTH, AC_TEL, AC_ADD, AC_EMAIL, AC_DATE, AC_POINT)" 
	 				+ "VALUES(ADD_AC_CODE.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, sysdate, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAc_id());
			pstmt.setString(2, dto.getAc_name());
			pstmt.setString(3, dto.getAc_pw());
			pstmt.setString(4, dto.getAc_birth());
			pstmt.setString(5, dto.getAc_tel());
			pstmt.setString(6, dto.getAc_add());
			pstmt.setString(7, dto.getAc_email());
			/* pstmt.setTimestamp(8, dto.getRegDate()); */
			// 이메일 인증키
			
			insertCnt = pstmt.executeUpdate();	// 입력성공:1 입력실패:0
			System.out.println("insertCnt_daoImpl 106행 : " + insertCnt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원 해제 
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return insertCnt;
	}
	
	// 로그인 처리, 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(String strID, String strPassword) {
		System.out.println("dao_daoImpl 125행 - 로그인처리, 회원정보 인증(수정, 탈퇴)");
		
		int selectCnt = 0;
		Connection conn = null;	// 오라클 연결
		PreparedStatement pstmt = null;	// SQL 문장
		ResultSet rs = null; 	// 결과 
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM ACCOUNT_TBL WHERE ac_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strID);
			
			rs = pstmt.executeQuery();
			// 로그인한 id와 일치하고
			if(rs.next()) {
				// 패스워드가 일치하면 selectCnt = 1
				if(strPassword.equals(rs.getString("ac_pw"))) {
					selectCnt = 1;
				} else {
					// 패스워드가 불일치하면 selectCnt = -1
					selectCnt = -1;
				}
			// id와 불일치하면 비가입 selectCnt = 0
			} else {
				selectCnt = 0;
			}
			System.out.println("selectCnt_daoImpl 152행 : " + selectCnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원 해제 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}
	
	// 회원정보 인증 및 탈퇴처리 
	@Override
	public int deleteCustomer(String strId) {
		System.out.println("dao_daoImpl 171행 - 회원정보 탈퇴 처리 ");
		
		int deleteCnt = 0;
		Connection conn = null;	// 오라클 연결
		PreparedStatement pstmt = null;	// SQL 문장 
		
		try {
			conn = dataSource.getConnection();
			String sql = "DELETE FROM ACCOUNT_TBL WHERE ac_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			
			deleteCnt = pstmt.executeUpdate();	// 삭제성공:1 삭제실패:0
			System.out.println("deleteCnt_daoImpl 185행 : " + deleteCnt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원 해제 
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return deleteCnt;
	}
	
	// 회원정보 인증 및 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("dao_daoImpl 178행 - 회원정보 인증 및 상세페이지");
		
		Connection conn = null;	// 오라클 연결
		PreparedStatement pstmt = null;	// SQL 문장
		ResultSet rs = null;
		
		// 바구니 생성 
		CustomerDTO dto = new CustomerDTO();
		
		try {
			conn = dataSource.getConnection();
			
			// 2. strId(로그인 화면에서 입력받은 세션id)와 일치하는 데이터가 있는 조회
			String sql = "SELECT * FROM ACCOUNT_TBL WHERE ac_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			rs = pstmt.executeQuery();
			
			// 3. ResultSet에 id와 일치하는 한사람의 회원정보가 존재하면 
			if(rs.next()) {
				// ResultSet을 읽어서 DTO에 setter로 담는다. 
				dto.setAc_id(rs.getString("ac_id")); // rs.getString("컬럼명")
				dto.setAc_pw(rs.getString("ac_pw"));
				dto.setAc_name(rs.getString("ac_name"));
				dto.setAc_birth(rs.getString("ac_birth"));
				dto.setAc_add(rs.getString("ac_add"));
				dto.setAc_tel(rs.getString("ac_tel"));
				dto.setAc_email(rs.getString("ac_email"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원 해제 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// 5. CustomerDTO를 리턴한다. 
		return dto;
	}
	
	// 관리자 - 회원정보 인증 및 상세페이지
		@Override
		public CustomerDTO accountGetCustomerDetail(String strId) {
			System.out.println("dao_daoImpl 178행 - 회원정보 인증 및 상세페이지");
			
			Connection conn = null;	// 오라클 연결
			PreparedStatement pstmt = null;	// SQL 문장
			ResultSet rs = null;
			
			// 바구니 생성 
			CustomerDTO dto = new CustomerDTO();
			
			try {
				conn = dataSource.getConnection();
				
				// 2. strId(로그인 화면에서 입력받은 세션id)와 일치하는 데이터가 있는 조회
				String sql = "SELECT * FROM ACCOUNT_TBL WHERE ac_code=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, strId);
				
				rs = pstmt.executeQuery();
				
				// 3. ResultSet에 id와 일치하는 한사람의 회원정보가 존재하면 
				if(rs.next()) {
					// ResultSet을 읽어서 DTO에 setter로 담는다. 
					dto.setAc_id(rs.getString("ac_id")); // rs.getString("컬럼명")
					dto.setAc_pw(rs.getString("ac_pw"));
					dto.setAc_name(rs.getString("ac_name"));
					dto.setAc_birth(rs.getString("ac_birth"));
					dto.setAc_add(rs.getString("ac_add"));
					dto.setAc_tel(rs.getString("ac_tel"));
					dto.setAc_email(rs.getString("ac_email"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// 사용한 자원 해제 
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			// 5. CustomerDTO를 리턴한다. 
			return dto;
		}
	
	// 회원정보 수정 처리 
	@Override
	public int updateCustomer(CustomerDTO dto) {
		System.out.println("dao_daoImpl 230행 - 회원정보 수정 처리 ");
		
		int updateCnt = 0;
		Connection conn = null;	// 오라클 연결
		PreparedStatement pstmt = null;	// SQL 문장 
		
		try {
			conn = dataSource.getConnection();
			String sql = "UPDATE ACCOUNT_TBL SET AC_PW=?, AC_NAME=?, AC_BIRTH=?, AC_ADD=?, AC_TEL=?, AC_EMAIL=? WHERE AC_ID=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAc_pw());
			pstmt.setString(2, dto.getAc_name());
			pstmt.setString(3, dto.getAc_birth());
			pstmt.setString(4, dto.getAc_add());
			pstmt.setString(5, dto.getAc_tel());
			pstmt.setString(6, dto.getAc_email());
			pstmt.setString(7, dto.getAc_id());
			
			updateCnt = pstmt.executeUpdate();	// 수정성공:1 수정실패:0
			System.out.println("updateCnt_daoImpl 249행 : " + updateCnt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원 해제 
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return updateCnt;
	}
	
	// 회원 갯수 구하기
	@Override
	public int accountCnt() {
		System.out.println("DAO - count");
	      
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int selectCnt = 0;
		
	    try {
	         conn = dataSource.getConnection();
	         String sql =  "SELECT COUNT(*) as cnt FROM ACCOUNT_TBL";
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
	
	// 회원 목록
	@Override
	public List<CustomerDTO> accountList(int start, int end) {
		System.out.println("DAO - productList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CustomerDTO> list = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * "
						 + 	"FROM ("
						 +	    "SELECT A.*, ROWNUM AS rn "		// 일련번호 매기기
						 +	      "FROM ("
						 +	        	"SELECT AC_CODE, AC_ID, AC_NAME, AC_PW, AC_BIRTH, AC_TEL, AC_ADD, AC_EMAIL, AC_DATE, AC_POINT "
						 +	        	  "FROM ACCOUNT_TBL "
						 +	             "ORDER BY AC_CODE DESC"
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
				list = new ArrayList<CustomerDTO>();
				do {
					// dto 생성
					CustomerDTO dto = new CustomerDTO();
					
					// dto에 게시글 정보를 담는다.
					dto.setAc_rownum(rs.getInt("rn"));
					dto.setAc_code(rs.getInt("AC_CODE"));
					dto.setAc_name(rs.getString("AC_NAME"));
					dto.setAc_id(rs.getString("AC_ID"));
					dto.setAc_pw(rs.getString("AC_PW"));
					dto.setAc_tel(rs.getString("AC_TEL"));
					dto.setAc_add(rs.getString("AC_ADD"));
					dto.setAc_email(rs.getString("AC_EMAIL"));
					dto.setAc_date(rs.getDate("AC_DATE"));
					dto.setAc_point(rs.getInt("AC_POINT"));
					
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
