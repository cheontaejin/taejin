<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path }/resources/customer/customerlogin.css">

<script type="text/javascript">
	<%
		int selectCnt = (Integer)request.getAttribute("selectCnt");
		if(selectCnt == 0){
	%>
		alert("아이디가 존재하지 않습니다.");
	<%
		} else if(selectCnt == -1) {
	%>
        alert("비밀번호가 틀립니다.");
    <%
		} else if(selectCnt == 1) {
    %>
    	alert("회원가입 되었습니다. 로그인 해주세요.");
    <%
		}
    %>
</script>

</head>
<body>
	<div class="wrap">
	   <!-- header 시작 -->
	   <%@ include file="/WEB-INF/views/common/header.jsp" %>
	   <!-- header 끝 -->
	</div>
	
<!-- 로그인 컨텐츠 시작 -->
	<div id = "contatiner">
		<div id = "contents">
			<!-- 상단 중앙 시작 -->
			<div id = "section1">
				<h1 align = "center"> 로그인 </h1>
			</div>
			
			
			
			<!-- 상단 중앙2 시작 -->
			<div id = "section2">
				<div id = "se_inner">
				
<!-- 					<div class = "login_type">
						<div class = "radio_check">
							<input type = "radio" checked = "checked">일반회원
						</div>
						<div class = "radio_check2">
							<input type = "radio">사업자회원
						</div>
					</div> -->
				
					<div class = "join">
						<form name="loginform" action="${path }/loginAction.do" onsubmit="return loginCheck();">
							<table>
								<colgroup>
									<col style = "width : 80px;">
									<col style = "width : 80px;">
								</colgroup>
								<tr>
									<td colspan = "2">
										<div class = "input_box">
											<input type = "text" name = "id" class = "input" size = "15" maxlength="15" placeholder = "아이디">
										</div>
									</td>
								</tr>
								<tr>
									<td colspan = "2">
										<div class = "input_box">
											<input type = "password" name = "password" class = "input" size = "15" maxlength="15" placeholder = "비밀번호">
										</div>
									</td>
								</tr>
								<tr>
									<td colspan = "2">
										<div class = "input_box_login">
											 <button class = btn_login>로그인</button>
										</div>
									</td>
								</tr>
								
								<tr>
									<td colspan = "2" style = "border-bottom : none">
										<br>
										<div align = "center">
											<a href = "">아이디 찾기</a>&nbsp&nbsp&nbsp   |   &nbsp&nbsp&nbsp<a href = "">비밀번호 찾기</a>&nbsp&nbsp&nbsp   |   &nbsp&nbsp&nbsp<a href = "${path }/join.do">회원가입</a>
										</div>
									</td>
								</tr>
							</table>
						</form>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 로그인 컨텐츠 끝 -->

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->

</body>
</html>