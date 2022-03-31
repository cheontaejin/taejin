<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>관리자 - 글작성</title>
<link rel = "stylesheet" href = "${path }/resources/manager/productAdd.css">

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>

<script>
	$(function() {
		$("#btnSave").click(function() {	/* 등록 버튼 클릭시 작동, 주의사항 : button input type = "button" */
			document.boardInsert.submit();	/* action에서 지정한 페이지로 이동 */
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
				글쓰기
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
					<form action = "${path }/board_insertAction.ad" method = "post" name = "boardInsert">
						<table style = "width : 800px" align = "center">
							<tr>
								<th>작성자</th>
								<td>
									<input type="text" class="input" name="writer" id = "writer" size="15" value="${sessionScope.customerID }" readonly style="color: red"/>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type = "password" class = "input" name = "password" id = "password" size = "15" placeholder = "비밀번호 입력" required></td>
							</tr>
							<tr>
								<th>글 제목</th>
								<td>
									<input type = "text" class = "input" name = "title" id = "title" size = "80" placeholder = "글 제목 입력" required>
								</td>
							</tr>
							<tr>
								<th>글 내용</th>
								<td>
									<textarea style="margin-left:10px"  rows="5" cols="80" name="content" id="content"></textarea>
								</td>
							</tr>
							<tr>
								<th colspan = "2">
									<input type = "button" class = "inputButton" value = "등록" id = "btnSave">
									<input type = "submit" class = "inputButton" value = "초기화">
								</th>
							</tr>
							
						</table>
					</form>
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