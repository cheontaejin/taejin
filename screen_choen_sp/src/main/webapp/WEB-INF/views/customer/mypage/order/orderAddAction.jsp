<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원수정 상세페이지 </title>
<link rel = "stylesheet" href = "${path }/resources/manager/productAdd.css">

<script src="https://kit.fontawesome.com/efbbe67799.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 이벤트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지   -->
<script src="${path }/resources/js/customerJS/join.js" defer></script>
<script src="${path }/resources/js/customerJS/errorMsg.js"></script>

</head>
<body>
	<%-- 장바구니 등록 성공 --%>
	<c:if test="${insertResult != 0 || updateResult != 0}">
		<script>
			alert("구매요청 되었습니다.");
			window.location="${path}/orderList.do";
		</script>
	</c:if>
	
	<%-- 장바구니 등록 실패 --%>
	<c:if test="${insertResult == 0 || updateResult == 0}">
		<script>
			alert("구매요청이 실패했습니다.");
			window.history.go(-1);
		</script>
	</c:if>

</body>
</html>