<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl --> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <c:set var="path" value="/jsp_pj_105"/> --%>

<!-- path는 뒤에 /가 없기에 뒤에 한개 더 붙이면 에러난다 -->
<!--
   context는 플젝명이다 => path라는 변수에 플젝명을 준다는 뜻이다
   EL태그를 통해 path를 불러오면 플젝명이 담기게되는 구조다
-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>

<!-- ***********요청 URI : ${pageContext.request.requestURI}-->
<%-- 요청 URI : ${pageContext.request.requestURI}
   request.에서는 contextPath와 requestURI 가 있는데 contextPath는 플젝명이고, requestURI는 도메인을 제외한 모든 것
   결과 : /jsp_105/09_el/04_next.jsp => 처럼 나온다
--%>