<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path }/resources/manager/login/adminlogin.css">

<Style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
</Style>

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
		}
    %>
</script>

</head>
<body>
<div class="wrap">
   	<!-- header 시작 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header 끝 -->
	
<!-- 로그인 컨텐츠 시작 -->
	<div id = "contatiner">
		<div id = "contents">
			<!-- 상단 중앙 시작 -->
			<div id = "section1">
				<h1 align = "center"> 관리자 로그인 </h1>
			</div>
			
			
			
			<!-- 상단 중앙2 시작 -->
			<div id = "section2">
				<div id = "se_inner">
					<div class = "join">
						<form name="loginform" action="${path }/adminLoginAction.ad" onsubmit="return loginCheck();">
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
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 로그인 컨텐츠 끝 -->
</div>
	
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>