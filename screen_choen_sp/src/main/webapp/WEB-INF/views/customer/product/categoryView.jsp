<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>search</title>

<link rel="stylesheet" href="${path }/resources/common/main.css">

<Style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
</Style>

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- header 끝 -->

<div class = "main">
	<div class = "main-inner">
		  <div class = "main-product">
			<div class="main-product_list">
				<c:forEach var="dto" items="${list}">
					<a href = "${path }/DetailView.do?pd_code=${dto.pd_code}&pageNum=${paging.pageNum}">
				    	<div class="main-product_list_cell">
				            <div class="img-box"><img class = "image-thumbnail" src="${dto.pd_img}" alt=""></div>
				            <div class="product-name">${dto.pd_name}</div>
				            <div class="product-price">${dto.pd_salary}</div>
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