<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>주문목록</title>

<link rel = "stylesheet" href = "${path }/resources/manager/productList.css">

<Style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
</Style>

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>
</head>
<body>

	<!-- header 시작 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header 끝 -->
    
    <!-- 컨텐츠 시작 -->

<div id ="container">
	<div id = "contents">
		<!-- section1 시작 -->
		<div id = "section1">
			<h1 align = "center">
				주문목록
				<hr>
			</h1>
		</div>
		
		<!-- section2 시작 -->
		<div id = "section2">
			<!-- 좌측 내용 시작 -->
			<div id = "left">
				<div class = "left_inside">
					<!-- 좌측메뉴 -->
					
					<%@ include file="/WEB-INF/views/customer/mypage/leftMenu.jsp" %>
					
					<!-- 좌측 메뉴바 -->
				</div>
			</div>
			
			<!-- 우측 내용 시작 -->
			<div id = "right">
				<div class = "table_div">
					<table style = "width : 1000px" align = "center">
						<tr>
							<th style = "width : 5%">번호</th>
							<th style = "width : 15%">상품명</th>
							<th style = "width : 10%">수량</th>
							<th style = "width : 10%">주문아이디</th>
							<th style = "width : 15%">주문일</th>
							<th style = "width : 15%">결제금액</th>
							<th style = "width : 15%">주문승인일</th>
							<th style = "width : 10%">상태</th>
							
						</tr>
						
						<!-- 게시글이 있으면 -->
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.order_rownum }</td>
								<td>${dto.pd_name }</td>
								<td>${dto.order_quan }</td>
								<td>${dto.ac_id }</td>
								<td>${dto.order_date }</td>
								<td>${dto.order_quan * dto.pd_salary }</td>
								<td>${dto.order_approve_date }</td>
								<td>${dto.order_status }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</div>
    
    <!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->

</body>
</html>