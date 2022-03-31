<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<%@ page import="java.sql.Date" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="700px">
		<c:forEach var="dto" items="${list}">
			<tr>
				<%-- <td>${dto.comment_num }</td> --%>
				<%-- <td>${dto.board_num }</td> --%>
				<td>${dto.writer }</td>
				<td>${dto.content }</td>
				<td>(<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd" />)</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>