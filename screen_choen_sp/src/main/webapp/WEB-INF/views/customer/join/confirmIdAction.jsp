<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>중복확인 페이지</title>
<link rel="stylesheet" href="${path }/resources/customer/confirmIdAction.css">

<script src="https://kit.fontawesome.com/efbbe67799.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 이벤트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지   -->
<script src="${path }/resources/js/customerJS/join.js"></script>

</head>
<body onload="confirmIdFocus();">
	<h2>중복확인 페이지</h2>
	
	<form action="${path }/confirmIdAction.do" method="post" name="confirmform" 
	    onsubmit="return confirmIdCheck();">

	<!-- id 중복 -->
	<c:if test="${selectCnt == 1 }">

		<table>
			<tr>
				<th colspan="2">
					<span>${id }</span>는 사용할 수 없습니다.
				</th>
			</tr>
			
			<tr>
				<th> 아이디 : </th>
				<td>    
					<input class="input" type="text" name="id" maxlength="20"
						style="width:150px" autofocus required>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input class="inputButton" type="submit" value="확인">
					<input class="inputButton" type="reset" value="취소" onclick="self.close();">
				</th>
			</tr>
		</table>
	
	</c:if>	
	<!-- // id 중복 아닐 시  -->
	<c:if test="${selectCnt != 1 }">
	
		<table>
			<tr>
				<td align="center">
					<span>${id }</span>는 사용할 수 있습니다.
				</td>
			</tr>
			
			<tr>
				<th>
					<input class="inputButton" type="button" value="확인" onclick="setId('${id }');">
				</th>
			</tr>
		</table>
		
	</c:if>
	</form>

</body>
</html>