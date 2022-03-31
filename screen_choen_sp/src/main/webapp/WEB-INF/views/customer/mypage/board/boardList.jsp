<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>관리자 - 게시판</title>

<link rel = "stylesheet" href = "${path }/resources/manager/productList.css">
<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>

<script>

	$(function() {
		$("#btnInsert").click(function() {
			location.href="${path}/customer/mypage/board/board_insert.jsp";
		});
	});

</script>

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
				게시판
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
							<th style = "width : 10%">번호</th>
							<th style = "width : 10%">게시물코드</th>
							<th style = "width : 50%">제목</th>
							<th style = "width : 10%">작성자</th>
							<th style = "width : 10%">조회수</th>
							<th style = "width : 10%">작성날짜</th>
						</tr>
						
						<!-- 게시글이 있으면 -->
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.bd_rownum }</td>
								<td>${dto.bd_code }</td>
								<td>	<!-- header.css : a 링크가 white로 되어있어 타이틀이 안보임 => black으로 변경 -->
									<a href="${path }/board_detailAction.do?bd_code=${dto.bd_code }">${dto.bd_name }&nbsp</a>
									<!-- 댓글 갯수 -->
									<c:if test="${dto.comment_count > 0}">
									[ ${dto.comment_count } ]
									</c:if>
								</td>
								<td>${dto.ac_id }</td>
								<td>${dto.readCnt }</td>
								<td>${dto.bd_date }</td>
							</tr>
						</c:forEach>
						 <tr>
		                     <td colspan="6" align="center">
		                        <!-- 페이징 처리 -->
		                        <!-- 이전 버튼 활성화 여부 -->
		                        <c:if test="${paging.startPage > 10}">
		                           <a href="${path}/boardList.ad?pageNum=${paging.prev}">[이전]</a>
		                        </c:if> 
		                        
		                        <!-- 페이지번호 처리 -->
		                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
		                           <a href="${path}/boardList.ad?pageNum=${num}">${num}</a>
		                        </c:forEach>
		                        
		                        <!-- 다음 버튼 활성화 여부 -->
		                        <c:if test="${paging.endPage < paging.pageCount}">
		                           <a href="${path}/boardList.ad?pageNum=${paging.next}">[다음]</a>
		                        </c:if>
		                     </td>
		                  </tr>
                     
						<tr>
							<td colspan = "6" style = "text-align : right; border-bottom : none">
								<!-- <input type = "button" id = "btnWrite" value = "글쓰기" onclick='boardInsert.do'> -->
								<input type = "button" id = "btnInsert" value = "글쓰기">
							</td>
						</tr>
						
					</table>
				</div>
			</div>
			
		</div>
	</div>
</div>

<!-- 컨텐츠 종료 -->

	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->

</body>
</html>