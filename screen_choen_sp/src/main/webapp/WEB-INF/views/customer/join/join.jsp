<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path }/resources/customer/join.css">
<script src="${path }/resources/js/customerJS/join.js" defer></script>

</head>
<body>

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <!-- header 끝 -->
</div>

<!-- 회원가입 컨텐츠 시작 : 화면 크기 조정을 위한 container -->
	<div id = "container">
		<div id = "contents">
			<!-- 상단 중앙 시작 -->
			<div id = "section1">
				<h2 align = "center"> 일반 회원가입 </h2>
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id = "section2">
				<div id = "se_inner">
					<div class = "join">
						<form name="joinform" action="${path }/joinAction.do" method="post" onsubmit="return signInCheck();">
							<input type="hidden" name="hiddenId" value="0">
							<table>
								<colgroup>
									<col style = "width : 150px;">
									<col style = "width : auto;">
									<col style = "width : auto;">
								</colgroup>
								<tr>
									<th> * 아이디 </th>
									<td>
										<input type = "text" class = "input" name = "id" size = "15" placeholder = "공백없이 15자 이내로 작성">
										<input type="button" name="dupChk" value="중복확인" style="margin-left: 10px;" onclick="confirmId()">
									</td>
								</tr>
								
								<tr>
									<th> * 비밀번호</th>
									<td colspan = "2"><input type = "password" class = "input" name = "password" size = "15" placeholder = "공백없이 15자 이내로 작성"></td>
								</tr>
								
								<tr>
									<th> * 비밀번호(확인)</th>
									<td colspan = "2"><input type = "password" class = "input" name = "repassword" size = "15" placeholder = "비밀번호 확인"></td>
								</tr>
								
								<tr>
									<th> * 이름</th>
									<td colspan = "2"><input type = "text" class = "input" name = "name" size = "15"></td>
								</tr>
								
								
								<tr>
									<th> * 생년월일</th>
									<td colspan = "2"><input type = "date" class = "input" name = "birth" size = "30"></td>
								</tr>
								
								
								<tr>
									<th scope = "row"> * 주소</th>
									<td colspan = "2"><input type = "text" class = "input" name = "address" size = "60"></td>
								</tr>
								
								<tr>
									<th> 핸드폰</th>
									<td colspan = "2">
										<input type = "text" class = "input" name = "hp1" maxlength="3" size = "3">
										-
										<input type = "text" class = "input" name = "hp2" maxlength="4" size = "4">
										-
										<input type = "text" class = "input" name = "hp3" maxlength="4" size = "4">
									</td>
								</tr>
								
								<tr>
									<th> * 이메일</th>
									<td>
										<input type = "text" class = "input" name = "email1" maxlength="20" style = "width : 100px">
										@
										<input type = "text" class = "input" name = "email2" maxlength="20" style = "width : 100px">
										<select class="input" name="email3" style="width:100px;" onchange="selectEmailChk();">
											<option value = "0">직접입력</option>
											<option value = "naver.com">네이버</option>
											<option value = "gmail.com">구글</option>
											<option value = "daum.net">다음</option>
											<option value = "nate.com">네이트</option>
										</select>
									</td>
								</tr>
								
								<tr>
									<td colspan = "3" style = "border-bottom : none">
										<br>
										<div align = "right">
											<!-- submit(전송) : 폼에서 입력한 값들을 전송, action에서 지정한 페이지로 결과값들을 출력 -->
											<!-- onclick = "window.location'이동할 페이지'" -->
											<input type = "submit" value = "회원가입" >
											<input type = "reset" value = "초기화">
											<input type = "button" class = "button" value = "가입취소" onclick = "window.location = '/login.do">
										</div>
									</td>
								</tr>

							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 메인 컨텐츠 끝 -->

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->

</body>
</html>