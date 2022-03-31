<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>제품리스트</title>

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
				상품목록
				<hr>
			</h1>
		</div>
		
		<!-- section2 시작 -->
		<div id = "section2">
			<!-- 좌측 내용 시작 -->
			<div id = "left">
				<div class = "left_inside">
					<!-- 좌측메뉴 -->
					
					<%@ include file="/WEB-INF/views/manager/common/leftMenu.jsp" %>
					
					<!-- 좌측 메뉴바 -->
				</div>
			</div>
			
			<!-- 우측 내용 시작 -->
			<div id = "right">
				<div class = "table_div">
					<table style = "width : 1000px" align = "center">
						<tr>
							<th style = "width : 5%">번호</th>
							<th style = "width : 10%">상품코드</th>
							<th style = "width : 7%">이미지</th>
							<th style = "width : 15%">상품명</th>
							<th style = "width : 10%">제조사</th>
							<th style = "width : 10%">상품가격</th>
							<th style = "width : 10%">카테고리</th>
							<th style = "width : 7%">상품재고</th>
							<th style = "width : 7%">상태</th>
							<th style = "width : 11%">등록일</th>
							<th style = "width : 4%">수정</th>
							<th style = "width : 4%">삭제</th>
						</tr>
						
						<!-- 게시글이 있으면 -->
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.pd_rownum }</td>
								<td>${dto.pd_code }</td>
								<td><img src = "${dto.pd_img }" style = "width : 50px; height : 50px;"></td>
								<td>${dto.pd_name }</td>
								<td>${dto.pd_make }</td>
								<td><fmt:formatNumber value="${dto.pd_salary }" pattern="#,### 원" /></td>
								<td>${dto.pd_category }</td>
								<td>${dto.pd_stock }</td>
								<td>${dto.pd_status }</td>
								<td>${dto.pd_date }</td>
								
							<td><input type = "button" value = "수정" onclick="window.location='productDetail.st?pd_code=${dto.pd_code}&pageNum=${paging.pageNum}'"></td>
							<td><input type = "button" value = "삭제" onclick="window.location='productDeleteAction.st?pd_code=${dto.pd_code}&pageNum=${paging.pageNum}'"></td>
						</tr>
						</c:forEach>
						<tr>
		                     <td colspan="12" align="center">
		                        <!-- 페이징 처리 -->
		                        <!-- 이전 버튼 활성화 여부 -->
		                        <c:if test="${paging.startPage > 10}">
		                           <a href="${path}/productList.st?pageNum=${paging.prev}">[이전]</a>
		                        </c:if> 
		                        
		                        <!-- 페이지번호 처리 -->
		                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
		                           <a href="${path}/productList.st?pageNum=${num}">${num}</a>
		                        </c:forEach>
		                        
		                        <!-- 다음 버튼 활성화 여부 -->
		                        <c:if test="${paging.endPage < paging.pageCount}">
		                           <a href="${path}/productList.st?pageNum=${paging.next}">[다음]</a>
		                        </c:if>
		                     </td>
		                  </tr>
						
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