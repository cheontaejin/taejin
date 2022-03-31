<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>main</title>

<link rel="stylesheet" href="${path }/resources/common/main.css">

<Style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
</Style>

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>

<script type="text/javascript">
	<%
		int deleteCnt = (Integer)request.getAttribute("deleteCnt");
		if(deleteCnt == 1){
	%>
		alert("회원탈퇴 되었습니다. 다시 가입해주세요.");
	<%
		} else if(deleteCnt == -1) {
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
	</div>

<div class = "main">
	<div class = "main-inner">
		<div class = "main-banner">
			<img src = "${path }/resources/images/main_banner1.jpg">
		</div>
		  <div class = "main-product">
			<div class="main-product_list">
				<c:forEach var="dto" items="${list}">
					<a href = "${path }/DetailView.do?pd_code=${dto.pd_code}&pageNum=${paging.pageNum}">
				    	<div class="main-product_list_cell">
				            <div class="img-box"><img class = "image-thumbnail" src="${dto.pd_img}" alt=""></div>
				            <div class="product-name">${dto.pd_name}</div>
				            <div class="product-price"><fmt:formatNumber value="${dto.pd_salary }" pattern="#,### 원" /></div>
				        </div>
			        </a>
			    </c:forEach>
			</div>
		</div>
	</div>
</div>

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
</body>
</html>