<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원수정 - 인증화면</title>
<link rel="stylesheet" href="${path }/resources/manager/productList.css">

<script src="https://kit.fontawesome.com/efbbe67799.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 이벤트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지   -->
<script src="${path }/resources/js/customerJS/main.js" defer></script>

</head>
<body>
<div class="wrap">
    <!-- header 시작 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header 끝 -->
    
    <!-- 회원수정 - 비밀번호 인증 컨텐츠 시작 -->
	<div id="container">
		<div id="contents">
			<!-- 상단 중앙 -->
			<div id="section1">
				<h1 align="center"> 회원정보 수정 </h1>	
			</div>
			
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
			
				<div id = "left">
						<div class = "left_inside">
							<!-- 좌측메뉴 -->
							
							<%@ include file="/WEB-INF/views/customer/mypage/leftMenu.jsp" %>
							
							<!-- 좌측 메뉴바 -->
						</div>
				</div>
				
			
				<div id="right">
					<div class="table_div">
						<form name="passwordform" action="${path }/modifyDetailAction.do">
							
							<%-- <%
								String customerID = (String)request.getSession().getAttribute("customerID");
							%> --%>
							<table>
								<colgroup>
									<col style="width:100px">
									<col style="width:300px">
								</colgroup>
								
								<h3 align="center">비밀번호 인증</h3>
								
								<tr>
									<th colspan="2">
										회원정보 수정을 위해 <span style="color: #FF82AA;">${customerID }</span>님의 비밀번호를 입력하세요.	
									</th>
								</tr>
								
								<tr>
									<th> * 비밀번호 </th>
									<td><input type="password" class="input" name="password" size="15" placeholder="비밀번호를 입력해주세요." autofocus required></td>
								</tr> 
								
								<tr>
									<td colspan="2">
										<br>
										<div align="right" style="border-bottom: none">
											<input type="submit" value="확인"> 
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
    <!-- 회원수정 - 비밀번호 인증 컨텐츠 끝 -->
</div>
	
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
	
</body>
</html>