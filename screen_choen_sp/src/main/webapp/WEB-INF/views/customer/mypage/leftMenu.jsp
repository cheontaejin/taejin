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
						<li><h3>마이페이지</h3></li>
						<li><h4><a href = "${path }/modifyCustomer.do">정보수정</a></h4></li>
						<li><h4><a href = "${path }/basketList.do">장바구니</a></h4></li>
						<li><h4><a href = "${path }/orderList.do">주문목록</a></h4></li>
						<li><h4><a href = "${path }/boardList.do">게시판</a></h4></li>
					</ul>
					<!-- 좌측 메뉴바 -->

</body>
</html>