<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보 수정 처리 </title>
<link rel="stylesheet" href="${path }/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path }/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path }/resources/css/customerCss/join.css">
<script src="${path }/resources/js/customerJS/errorMsg.js"></script>

<script src="https://kit.fontawesome.com/efbbe67799.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 이벤트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지   -->
<script src="${path }/resources/js/customerJS/join.js" defer></script>
</head>
<body>
	<!-- header 시작 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header 끝 -->
<br><br>

	<c:if test="${updateCnt == 0 }">
	
		<script type = "text/javascript">
			/* alert("회원정보 수정 실패"); */
			errorAlert(updateError);
		</script>
	
	</c:if>

	<c:if test="${updateCnt != 0 }">
	
		<%
			// 모든 세션 삭제 => 비밀번호가 변경되었으므로 다시 로그인하도록 함(세션이 남아있으면 로그인시 변경전 비밀번호로 무조건 인증되므로)
			request.getSession().invalidate();
		%>
		
		<script type = "text/javascript">
			setTimeout(function() {
				alert("회원정보가 수정되었습니다. 다시 로그인해주세요.");
				window.location="/screen_cheon_jsp/main.do";
			}, 1000);
		</script>
	
	</c:if>

	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->

</body>
</html>