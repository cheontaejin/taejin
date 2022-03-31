<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet" href="${path }/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path }/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path }/resources/css/customerCss/join.css">

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
    
    <!-- 컨텐츠 시작 -->
    
    <!-- insert 실패 -->
	<c:if test="${insertCnt == 0 }">
		
		<script type="text/javascript">
			alert("insert 실패");
		</script>
		
	</c:if>
	
	<!-- insert 성공 -->
	<c:if test="${insertCnt != 0 }">
		
		<!-- response.sendRedirect("mainSuccess.do?insertCnt=" + insertCnt); -->
		<script type="text/javascript">
			alert("가입성공 로그인해주세요.");
		</script>
		<c:redirect url="mainSuccess.do?insertCnt=${insertCnt }"></c:redirect>	
		
	</c:if>
	<!-- 컨텐츠 끝 --> 

</div>
	
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
	
</body>
</html>