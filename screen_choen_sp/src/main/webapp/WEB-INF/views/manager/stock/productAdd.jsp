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

<link rel = "stylesheet" href = "${path }/resources/manager/productAdd.css">

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>

</head>
<body>

	<!-- header 시작 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header 끝 -->

<!-- 컨텐츠 시작 -->

<div id ="container">
	<div id = "contents">
		<!-- section1 시작 -->
		<div id = "section1">
			<h1 align = "center">
				재고목록
				<hr>
			</h1>
		</div>
		
		<!-- section2 시작 -->
		<div id = "section2">
			<!-- 좌측 내용 시작 -->
			<div id = "left">
				<div class = "left_inside">
					<!-- 좌측메뉴 -->
					<%@ include file="/WEB-INF/views/manager/common/leftMenu.jsp" %>
					<!-- 좌측 메뉴바 -->
				</div>
			</div>
			
			<!-- 우측 내용 시작 -->
			<div id = "right">
				<div class = "table_div">
					<form action = "${path }/productAddAction.st" method = "post" name = "productAdd" enctype="multipart/form-data">
						<table style = "width : 800px" align = "center">
							<tr>
								<th>상품카테고리 *</th>
								<td>
									<select class = "input" id="PD_CATEGOTY" name = "PD_CATEGOTY" required>
										<option>상품카테고리</option>
										<option value = "노트북">노트북</option>
										<option value = "데스크탑">데스크탑</option>
										<option value = "모니터/사운드">모니터/사운드</option>
										<option value = "프린터">프린터</option>
										<option value = "PC주요부폼">PC주요부폼</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>브랜드 *</th>
								<td><input type = "text" class = "input" id = "PD_MAKE" name = "PD_MAKE" size = "60" placeholder = "브랜드 입력" required autofocus></td>
							</tr>
							<tr>
								<th>제품명 *</th>
								<td><input type = "text" class = "input" id = "PD_NAME" name = "PD_NAME" size = "60" placeholder = "제품명 입력" required autofocus></td>
							</tr>
							<tr>
								<th>제품 대표이미지 *</th>
								<td><input type = "file" class = "inputOpt" id = "PD_IMG" name = "PD_IMG" accept="image/*"></td>
							</tr>
							<tr>
								<th>제품 상세이미지 *</th>
								<td><input type = "file" class = "inputOpt" id = "PD_DETAIL_IMG" name = "PD_DETAIL_IMG" accept="image/*"></td>
							</tr>
							<tr>
								<th>판매가격</th>
								<td><input type = "number" class = "input" id = "PD_SALARY" name = "PD_SALARY" size = "10" placeholder = "상품 판매가 입력" required></td>
							</tr>
							
							<tr>
								<th>재고수량</th>
								<td><input type = "number" class = "input" id = "PD_STOCK" name = "PD_STOCK" size = "10" placeholder = "상품 원가 입력" required></td>
							</tr>
							<tr>
								<th>판매상태</th>
								<td>
									<select class = "input" id="PD_STATUS" name = "PD_STATUS" required>
										<option>상품판매상태</option>
										<option value = "판매중" selected>판매중</option>
										<option value = "품절">품절</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<th colspan = "2">
									<input type = "submit" class = "inputButton" value = "등록">
									<input type = "submit" class = "inputButton" value = "초기화">
								</th>
							</tr>
							
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 컨텐츠 종료 -->

	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->

</body>
</html>