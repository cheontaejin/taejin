<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>상품 수정 처리 페이지</title>

<link rel = "stylesheet" href = "${path }/resources/css/commonCss/header.css">
<link rel = "stylesheet" href = "${path }/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path }/resources/css/managerCss/table2.css">

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>

</head>
<body>

	<!-- header 시작 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header 끝 -->

	<!-- insert 실패 -->
	<c:if test="${updateCnt == 0 }">
		<script type = "text/javascript">
			alert("상품수정을 실패했습니다!");
		</script>
	</c:if>
	<c:if test="${updateCnt != 0 }">
		<script type = "text/javascript">
			alert("상품이 정상적으로 수정되었습니다.!");
			window.location="productList.st?pageNum=${pageNum}";
		</script>
	</c:if>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>