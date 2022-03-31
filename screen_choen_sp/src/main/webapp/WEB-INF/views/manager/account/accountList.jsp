<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel = "stylesheet" href = "${path }/resources/manager/productList.css">
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
				회원관리
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
							<th style = "width : 10%">아이디</th>
							<th style = "width : 5%">이름</th>
							<th style = "width : 20%">주소</th>
							<th style = "width : 15%">핸드폰</th>
							<th style = "width : 25%">이메일</th>
							<th style = "width : 10%">가입일</th>
							<th style = "width : 5%">수정</th>
							<th style = "width : 5%">삭제</th>
						</tr>
						
						<!-- 게시글이 있으면 -->
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.ac_rownum }</td>
								<td>${dto.ac_id }</td>
								<td>${dto.ac_name }</td>
								<td>${dto.ac_add }</td>
								<td>${dto.ac_tel }</td>
								<td>${dto.ac_email }</td>
								<td>${dto.ac_date }</td>
							<td><input type = "button" value = "수정" onclick="window.location='accountModifyDetailAction.ad?ac_code=${dto.ac_code}&pageNum=${paging.pageNum}'"></td>
							<td><input type = "button" value = "삭제" onclick="window.location='productDeleteAction.st?ac_code=${dto.ac_code}&pageNum=${paging.pageNum}'"></td>
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