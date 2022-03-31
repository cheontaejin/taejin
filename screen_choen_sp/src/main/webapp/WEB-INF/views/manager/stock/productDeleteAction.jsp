<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제 처리 페이지</title>
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