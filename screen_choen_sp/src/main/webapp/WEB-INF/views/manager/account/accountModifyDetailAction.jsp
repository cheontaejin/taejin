<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.spring.screen_choen_sp.dto.CustomerDTO" %>
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
	<!-- header 시작 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header 끝 -->
    
	<!-- 회원가입 컨텐츠 시작 : 화면 크기 조정을 위한 container -->
	<div id="container">
		<div id="contents">
			<!-- 상단 중앙 -->
			<div id="section1">
				<h1 align="center"> 회원수정 - 상세페이지  </h1>			
			</div>
			
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
				
					<div id = "left">
						<div class = "left_inside">
							<!-- 좌측메뉴 -->
							
							<%@ include file="/WEB-INF/views/manager/common/leftMenu.jsp" %>
							
							<!-- 좌측 메뉴바 -->
						</div>
					</div>
				
					<div id="right">
						<div class="table_div">
							<form name="modifyform" action="${path }/modifyCustomerAction.do" method="post">
								<table>
									<colgroup>
										<col style="width:150px;">
										<col style="width:auto;">
										<col style="width:auto;">
									</colgroup>
									<tr>
										<th> * 아이디 </th>		
										<td>
											${dto.ac_id}
										</td>
									</tr>	
									
									<tr>
										<th> * 비밀번호 </th>		<!-- * : 필수 -->
										<td colspan="2"><input type="password" class="input" name="password" size="22" value="${dto.ac_pw }" placeholder="공백없이 15자 이내로 작성" required></td>
									</tr>
									
									<tr>
										<th> * 비밀번호(확인) </th>		<!-- * : 필수 -->
										<td colspan="2"><input type="password" class="input" name="repassword" value="${dto.ac_pw}" placeholder="비밀번호 확인" required></td>
									</tr>
									
									<tr>
										<th> * 이름 </th>
										<td colspan="2"><input type="text" class="input" name="name" size="20" value="${dto.ac_name}" required></td>
									</tr>
									
									<tr>
										<th> * 생년월일 </th>
										<td colspan="2"><input type="date" class="input" name="birthday" size="30" value="${dto.ac_birth}" required></td>
									</tr>     
									
									<tr>
										<th> * 주소 </th>
										<td colspan="2"><input type="text" class="input" name="address" size="60" value="${dto.ac_add}" required></td>
									</tr>
									
									<tr>
										<th>  핸드폰 </th>
										<td>
											<c:if test="${dto.ac_tel == null}">
												<input type="text" class="input" name="hp1" maxlength="3" style="width:50px">
												-
												<input type="text" class="input" name="hp2" maxlength="4" style="width:70px">
												-
												<input type="text" class="input" name="hp3" maxlength="4" style="width:70px">
											</c:if>
											
											<c:if test="${dto.ac_tel != null}">
												<!-- String hp = dto.getHp();
												String[] hpArr = hp.split("-"); -->
												<c:set var="hpArr" value="${fn:split(dto.ac_tel, '-') }"></c:set>
													
												<input type="text" class="input" name="hp1" maxlength="3" style="width:50px" value="${hpArr[0] }">
												-
												<input type="text" class="input" name="hp2" maxlength="4" style="width:70px" value="${hpArr[1] }">
												-
												<input type="text" class="input" name="hp3" maxlength="4" style="width:70px" value="${hpArr[2] }">
											</c:if>
											
										</td>
									</tr>
									
									<tr>
										<th> * 이메일 </th>
										<td >
												<!-- String email = dto.getEmail();
												String[] Semail = email.split("@"); -->
												
											<c:set var="emailArr" value="${fn:split(dto.ac_email, '@') }"></c:set>
											<input type="text" class="input" name="email1" maxlength="20" style="width:100px;" value="${emailArr[0] }" required>
											@
											<input type="text" class="input" name="email2" maxlength="20" style="width:100px;" value="${emailArr[1] }" required>
											<select class="input" name="email3" style="width:100px;" onchange="selectEmailChk();">
												<option value="0">직접입력</option>
												<option value="naver.com">네이버</option>
												<option value="gmail.com">구글</option>
												<option value="daum.net">다음</option>
												<option value="nate.com">네이트</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<td colspan="3" style="border-bottom: none">
											<br>
											<div align="right">
												<!-- submit(전송) : 폼에서 입력한 값들을 전송, action에서 지정한 페이지로 결과값들을 출력 -->
												<!-- type="button" onclick="window.location='이동할 페이지' -->
												<input type="submit" value="정보수정">
												<input type="reset" value="초기화">
												<input type="button" class="button" value="수정취소" onclick="window.history.back()">
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
	<!-- 회원가입 컨텐츠 끝 -->
	
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->

</body>
</html>