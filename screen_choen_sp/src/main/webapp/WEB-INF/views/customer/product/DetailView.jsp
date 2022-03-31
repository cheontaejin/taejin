<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>상세페이지</title>
<link rel = "stylesheet" href = "${path }/resources/customer/DetailView.css">
<Style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
</Style>
<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>

<script>
	$(function(){
		$("#btnSave").click(function(){
			basket_add();
		});
	});
	
	$(function(){
		$("#btn_login2").click(function(){
			order_add();
		});
	});
	
	function basket_add(){
		// 게시글번호, 작성자, 글내용을 파라미터로 넘김
		var param = {
				"quan": $('#quan').val(),
				"pd_code": $('#pd_code').val(),
		}
		$.ajax({
			type: "post",
			url: "${path}/basketAdd.do",
			data: param,
			success: function(){
				alert('장바구니 추가 완료');
			}
		});
	}
	
	function order_add(){
		// 게시글번호, 작성자, 글내용을 파라미터로 넘김
		var param = {
				"quan": $('#quan').val(),
				"pd_code": $('#pd_code').val(),
		}
		$.ajax({
			type: "post",
			url: "${path}/orderAdd.do",
			data: param,
			success: function(){
				alert('구매 요청 완료');
			}
		});
	}
	
</script>

</head>
<body>

<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- header 끝 -->

<div class = "detailView">
	<div class = "detailView_top">
		<h1>상세정보</h1>
		<hr>
		<div class = "detailView_top_left">
			<img src = "${dto.pd_img }">
		</div>
		<div class = "detailView_top_right">
		<form action ="${path }/basketAdd.do?pd_code=${dto.pd_code}" method="post" name="form1" enctype="multipart/form-data">
			<input type="hidden" name="pd_code" id="pd_code" value="${dto.pd_code}">
			<ul>
				<li><span style = "font-weight: bold">${dto.pd_name}</span></li>
				<li><span style = "font-weight: bold">가   &nbsp&nbsp&nbsp&nbsp격</span> : <fmt:formatNumber value="${dto.pd_salary }" pattern="#,### 원" /></li>
				<li><span style = "font-weight: bold">제 조 사</span> : ${dto.pd_make}</li>
				<li><span style = "font-weight: bold">상  &nbsp&nbsp&nbsp 태</span> : ${dto.pd_status}</li>
				<li><span style = "font-weight: bold">등 록 일</span> : ${dto.pd_date }</li>
				<li><input class="quan" type="number" name="quan" id="quan" size="10"></li>
				<li>
					<div class = "input_box_login">
						<input id="btnSave" type="button" class ="btn_login1" value="장바구니 추가">
					</div>
					<div class = "input_box_login">
						<input id="btn_login2" type="button" class ="btn_login2" value="구매하기">
					</div>
				</li>
			</ul>
		</form>
		</div>
	</div>
	<div class = "detailView_bottom">
		<img src = "${dto.pd_detail_img }">
	</div>
</div>

<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- footer 끝 -->

</body>
</html>