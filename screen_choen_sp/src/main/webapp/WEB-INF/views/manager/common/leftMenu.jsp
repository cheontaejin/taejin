<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


					<!-- 좌측메뉴 -->
					<ul class = "menubarL">
						<li><h3>관리자 메뉴</h3></li>
						<li>
							<h4>재고관리</h4>
							<ul class = "order_menu">
								<li><a href = "productList.st">상품목록</a></li>
								<li><a href = "productAdd.st">상품등록</a></li>
							</ul>
						</li>
						
						<li>
							<h4>주문관리</h4>
							<ul class = "order_menu">
								<li><a href = "orderList.ad">주문목록</a></li>
							</ul>
						</li>
						
						<li><h4><a href = "accountList.ad">회원정보</a></h4></li>
						<li><h4><a href = "boardList.ad">게시판</a></h4></li>
					</ul>
					<!-- 좌측 메뉴바 -->

</body>
</html>