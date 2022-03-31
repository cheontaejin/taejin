<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>관리자 - 게시판 상세페이지</title>

<link rel = "stylesheet" href = "${path }/resources/manager/productAdd.css">

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>
<script>
	$(function(){
		// 수정/삭제화면으로 이동
		$("#btnList").click(function(){
			location.href="${path}/boardList.do";
		});
		// 수정 버튼 클릭
		$("#btnUpdate").click(function(){
			var writer = $("#writer").val();
			var password = $("#password").val();
			var title = $("#title").val();
			var content = $("#content").val();
			
			if(writer == "") {
				alert("작성자를 입력하세요.!!");
				$("#writer").focus();
				return false;
			}
			
			if(password == "") {
				alert("비밀번호를 입력하세요.!!");
				$("#password").focus();
				return false;
			}
			
			if(title == "") {
				alert("제목을 입력하세요.!!");
				$("#title").focus();
				return false;
			}
			
			if(content == "") {
				alert("내용을 입력하세요.!!");
				$("#content").focus();
				return false;
			}
			
			document.form1.action="${path }/board_updateAction.do";
			document.form1.submit();
		});
		// 삭제 버튼 클릭
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="${path }/board_deleteAction.do";
				document.form1.submit();
			}
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
				수정/삭제
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
					<form method = "post" name = "form1">
						<table style = "width : 800px" align = "center">
							<tr>
								<th style="width:150px">작성자</th>
								<td style="width:150px; text-align:center;">
									<input style="height: 40px; margin-left: 10px;" type = "text" name = "writer" id = "writer" size = "20" value = "${dto.ac_id}" readonly>
								</td>
								
								<th style="width:150px">작성일</th>
								<td style="width:150px; text-align:center;">
									<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${dto.bd_date}"/>
								</td>
								
							</tr>
							<tr>
								<th style="width:150px">비밀번호</th>
								<td style="width:150px; text-align:center;">
									<input type = "password" class = "input" name = "password" id = "password" size = "20" placeholder = "비밀번호 입력" required>
									<c:if test="${param.pwd_error == 'y' }">
										<span style="color:red">비밀번호가 일치하지 않습니다.</span>
									</c:if>
								</td>
								<th style="width:150px">조회수</th>
								<td style="width:150px; text-align:center;">
									${dto.readCnt }
								</td>
							</tr>
							<tr>
								<th>글 제목</th>
								<td colspan="3" style="width:150px; text-align:left;">
									<input style="height: 40px;" type = "text" name = "title" id = "title" size = "50" value="${dto.bd_name }">
								</td>
							</tr>
							<tr>
								<th>글 내용</th>
								<td colspan="3" style="text-align:left">
									<textarea rows="5" cols="60" name="content" id="content">
										${dto.bd_content}
									</textarea> 
								</td>
							</tr>
							<tr>
								<th colspan = "4">
									<input type="hidden" name="num" value="${dto.bd_code }">
									<input type = "button" class = "inputButton" value = "수정" id = "btnUpdate">	<!-- 반드시 type=button => Click 동작을 위해 -->
									<input type = "button" class = "inputButton" value = "삭제" id = "btnDelete">
									<input type = "button" class = "inputButton" value = "목록" id = "btnList">
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