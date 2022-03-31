<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>장바구니</title>

<link rel = "stylesheet" href = "${path }/resources/customer/basket.css">

<Style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
</Style>

<script>

	var basketArr = [];
	var bk_code = "";
	
	function allCheck() {
		
		if ($("input[name=basketCheck]").is(":checked")) {
			
			$("input[name=basketCheck]:checked").each(function(index, element) {
				$(element).prop("checked", false);
				basketArr = [];
			});
			
			basketArr = [];
			
		} else {
			
			$("input[name=basketCheck]").each(function(index, element) {
				$(element).prop("checked", true);
				basketArr.push($(element).val());
			});
		}
		
	}
	
	$(function(){
		
		$("#allbuy").click(function(){
			$("input[name=basketCheck]").each(function(index, element) {
				if ($(element).is(":checked")) {
					basketArr.push($(element).val());
				}
			});
			
			document.form1.action="${path }/basketAllBuy.do?basketArr=" + basketArr;
			document.form1.submit();
		});
		
		$("#alldelete").click(function(){
			$("input[name=basketCheck]").each(function(index, element) {
				if ($(element).is(":checked")) {
					basketArr.push($(element).val());
				}
			});
			
			document.form1.action="${path }/basketAllDelete.do?quan=${dto.basket_quan}&pd_code=${dto.pd_code}&basketArr=" + basketArr;
			document.form1.submit();
		});
	});
	
</script>

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>
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
				장바구니
				<hr>
			</h1>
		</div>
		
		<!-- section2 시작 -->
		<div id = "section2">
			
			<div id = "left">
					<div class = "left_inside">
						<!-- 좌측메뉴 -->
						
						<%@ include file="/WEB-INF/views/customer/mypage/leftMenu.jsp" %>
						
						<!-- 좌측 메뉴바 -->
					</div>
			</div>
			
			<!-- 우측 내용 시작 -->
			<div id = "right">
				<div class = "table_div">
					<form method = "post" name = "form1">
						<table style = "width : 1000px" align = "center">
							<tr>
								<th style = "width : 10%">
									선택
									<input type="checkbox" name="basket" id="basket" checked onclick="allCheck();">
								</th>
								<th style = "width : 10%">번호</th>
								<th style = "width : 20%">상품명</th>
								<th style = "width : 10%">수량</th>
								<th style = "width : 15%">낱개가격</th>
								<th style = "width : 15%">총 금액</th>
								<th style = "width : 10%">구매하기</th>
								<th style = "width : 10%">삭제하기</th>
							</tr>
							<!-- 게시글이 있으면 -->
							<c:forEach var="dto" items="${list }" varStatus="status">
							<tr>
								<td>
									<input type = "checkbox" id="basketCheck" name="basketCheck" value="${dto.bk_code }" checked>
								</td>
								<td>${dto.pd_rownum }</td>
								<td>${dto.pd_name }</td>
								<td>
									<input type = "text" class = "input" name = "p_name" size = "10" value = "${dto.basket_quan }">
								</td>
								<td>
									<fmt:formatNumber value="${dto.pd_salary }" pattern="#,### 원" />
								</td>
								<td>
									<fmt:formatNumber value="${dto.pd_salary * dto.basket_quan}" pattern="#,### 원" />
								</td>
								<td>
									<input type = "button" class = "inputButton" id="buy" value = "구매" onclick="window.location='basketOrderAdd.do?bk_code=${dto.bk_code}&quan=${dto.basket_quan}&pd_code=${dto.pd_code}'">
								</td>
								<td>
									<input type = "button" class = "inputButton" id="delete" value = "삭제" onclick="window.location='basketDelete.do?bk_code=${dto.bk_code}'">
								</td>
							</tr>
							<c:if test="${list.size() == 0}">
								<tr>
									<td colspan="8">장바구니에 담긴 상품이 없습니다.</td>
								</tr>
							</c:if>
							</c:forEach>
							<tr>
								<td colspan = "8" style="text-align: right !important; margin-right: 10px;">
									<input type = "button" class = "inputButton" id="allbuy" value = "일괄 구매">
									<input type = "button" class = "inputButton" id="alldelete"value = "일괄 삭제" style="margin-right: 15px;">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			
		</div>
	</div>
</div>

<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- footer 끝 -->

</body>
</html>