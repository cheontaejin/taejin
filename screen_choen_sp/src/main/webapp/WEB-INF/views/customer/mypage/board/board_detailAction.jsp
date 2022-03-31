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
		comment_list();
		
		// 댓글쓰기 버튼
		$("#btnSave").click(function(){
			comment_add();
		});
		// 수정/삭제화면으로 이동
		$("#btnList").click(function(){
			location.href="${path}/boardList.do";
		});
		// 수정/삭제화면으로 이동
		$("#btnEdit").click(function(){
			document.form1.action="${path }/password_chk.do";
			document.form1.submit();
		});
	});
		
	// 댓글쓰기
	function comment_add(){
		// 게시글번호, 작성자, 글내용을 파라미터로 넘김
		var param = {
				"board_num": ${dto.bd_code},
				"writer": $('#writer').val(),
				"content": $('#content').val()
		}
		$.ajax({
			type: "post",
			url: "${path}/commentAdd.do",
			data: param,	// commentAdd.ad?board_num=1&writer=홍길동&content=댓글테스트
			success: function(){	// 서버에서 댓글쓰기가 완료되면 서버에서 콜백함수 호출
				$('#content').val("");	// 입력한 내용을 지움
				comment_list();	// 댓글목록 새로고침
			}
		});
	}
	
	// 댓글목록
	function comment_list(){
		$.ajax({
			type: "post",
			url: "${path}/commentList.do",
			data: "num=${dto.bd_code}",
			success: function(result){
				$('#commentList').html(result);
			},
			error: function(){
				alert('오류');
			}
		});
	}
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
				상세페이지
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
							<input type="hidden" name="num" value="${dto.bd_code}">
							<tr>
								<th style="width:150px">작성자</th>
								<td style="width:150px; text-align:center;">
									${dto.ac_id}
								</td>
								
								<th style="width:150px">작성일</th>
								<td style="width:150px; text-align:center;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.bd_date}"/>
								</td>
								
							</tr>
							<tr>
								<th style="width:150px">비밀번호</th>
								<td style="width:150px; text-align:center;">
									<input type = "password" class = "input" name = "password" id = "password" size = "20" placeholder = "비밀번호 입력" required>
									<c:if test="${param.message =='error' }">
										<br><span style="color:red">비밀번호가 일치하지 않습니다.</span>
									</c:if>
								</td>
								<th style="width:150px">조회수</th>
								<td style="width:150px; text-align:center;">
									${dto.readCnt }
								</td>
							</tr>
							<tr>
								<th>글 제목</th>
								<td colspan="3" style="width:150px; text-align:center;">
									${dto.bd_name }
								</td>
							</tr>
							<tr>
								<th>글 내용</th>
								<td colspan="3" style="text-align:left">
									<!-- <textarea rows="5" cols="60" name="content" id="content"> -->
										${dto.bd_content}
									<!-- </textarea> -->
								</td>
							</tr>
							<tr>
								<th colspan = "4">
									<input type="hidden" name="num" value="${dto.bd_code }">
									<input type = "button" class = "inputButton" value = "수정/삭제" id = "btnEdit">	<!-- 반드시 type=button => Click 동작을 위해 -->
									<input type = "button" class = "inputButton" value = "목록" id = "btnList">
								</th>
							</tr>
							
						</table>
					</form>
					
					<!-- 댓글 입력 코드 -->
					<table width="700px">
						<tr>
							<td>
								<input id = "writer" placeholder="이름" value="${dto.ac_id}" readonly>
							</td>
							<td rowspan="2">
								<button id="btnSave" type="button">확인</button>
							</td>
						</tr>
						<tr>
							<td><textarea rows="5" cols="80" id="content" placeholder="내용을 입력하세요"></textarea></td>
						</tr>
					</table>
					
					<!-- 댓글 목록을 출력할 영역 -->
					<div id="commentList">
						<%-- <table>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.comment_num }</td>
									<td>${dto.board_num }</td>
									<td>${dto.writer }</td>
									<td>${dto.content }</td>
									<td>${dto.reg_date }</td>
								</tr>
							</c:forEach>
						</table> --%>
					</div>
					
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