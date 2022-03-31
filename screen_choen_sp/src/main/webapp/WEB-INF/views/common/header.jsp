<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path }/resources/common/header.css">

<Style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
</Style>

<!-- 3-3. 자바스크립트 이벤트 추가 : 햄버거버튼을 클릭하면 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할때 까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
<script src="${path }/resources/js/customerJS/main.js" defer></script>

<script>
	function enterKey() {
		if (window.event.keyCode == 13) {
			var keyword = document.getElementById('keyword').value;
			
			document.search_form.action = '${path}/search.do?keyword=' + keyword;
			document.search_form.submit();
		}
	}
	
	// 상품 키워드 검색
	function searchProduct() {
		var keyword = document.getElementById('keyword').value;
		
		document.search_form.action = '${path}/search.do?keyword=' + keyword;
		document.search_form.submit();
	}
	
</script>


</head>
<body>

<div class = "main-header">

	<div class = "main-header_loginbar">
		<div align = "right">
			<c:if test="${sessionScope.customerID == null }">
				<a href = "${path }/login.do">로그인</a>&nbsp&nbsp&nbsp   |   &nbsp&nbsp&nbsp<a href = "${path }/modifyCustomer.do">마이페이지</a>&nbsp&nbsp&nbsp   |   &nbsp&nbsp&nbsp<a href = "${path }/adminLogin.ad">관리자페이지</a>
			</c:if>
			<c:if test="${sessionScope.customerID != null }">
				${sessionScope.customerID }님 &nbsp&nbsp&nbsp  <a href = "${path }/logout.do">로그아웃</a>&nbsp&nbsp&nbsp   |   &nbsp&nbsp&nbsp<a href = "${path }/modifyCustomer.do">마이페이지</a>&nbsp&nbsp&nbsp   |   &nbsp&nbsp&nbsp<a href = "${path }/adminLogin.ad">관리자페이지</a>
			</c:if>
		</div>
	</div>
	<hr>

	<div class = "main-header_wrap">
			<div class = "main-header_logo">
				<h1>
					<a href = "${path }/main.do"><i class="fas fa-desktop"></i> Cheon</a>
				</h1>
			</div>
			<div class = "main-header_search">
				<div class = "search">
					<form name="search_form" method="post">
						<fieldset>
							<div class= "search_box">
								<input type = "text" class = "search_input" id="keyword" autocomplete = "off" placeholder = "검색어를 입력해주세요." title = "검색어 입력" onkeydown="enterKey()">
								<button type = "submit" class = "search_submit" onclick="searchProduct()"><i class="fas fa-search"></i></button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<div class = "main-header_toggleBtn">
				<a href = "#" class = "navbar_toggleBtn">
					<i class="fas fa-bars"></i>
				</a>
			</div>
	</div>
	
	<div class = main-header_menubar>
		<ul class = "header_menu">
				<li><a href = "${path }/category.do?PD_CATEGORY=노트북">노트북</a></li>
				<li><a href = "${path }/category.do?PD_CATEGORY=데스크탑">데스크탑</a></li>
				<li><a href = "${path }/category.do?PD_CATEGORY=모니터/사운드">모니터/사운드</a></li>
				<li><a href = "${path }/category.do?PD_CATEGORY=프린터">프린터</a></li>
				<li><a href = "${path }/category.do?PD_CATEGORY=PC주요부품">PC주요부품</a>
					<ul class = "header_menu_sub">
						<li><a href = "/screen_cheon/cheon/common/keyboard.html">키보드</a></li>
						<li><a href = "#">마우스</a></li>
					</ul>
				</li>
			</ul>
	</div>
	
<!-- 	<div class = "main-header_mebubar">
		<div class = "header_menubar">
			<ul class = "header_menu">
				<li>카테고리</li>
				<li><a href = "#">노트북</a></li>
				<li><a href = "#">데스크탑</a></li>
				<li><a href = "#">모니터/사운드</a></li>
				<li><a href = "#">프린터</a></li>
				<li><a href = "#">PC주요부품</a>
					<ul class = "header_menu_sub">
						<li><a href = "#">키보드</a></li>
						<li><a href = "#">마우스</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div> -->
	
</div>



</body>
</html>