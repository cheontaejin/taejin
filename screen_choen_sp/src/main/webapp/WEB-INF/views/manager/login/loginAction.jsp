<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 처리</title>

<link rel="stylesheet" href="${path }/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path }/resources/css/commonCss/footer.css"> 
<link rel="stylesheet" href="${path }/resources/css/customerCss/login.css">

<!-- 1. kit.fontawesome.com에서 인증 2. 이미지 사용가능-->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>    
   <!-- header 끝 -->
   <!-- 메인 컨텐츠 시작 : 화면 크기 조정을 위한 container -->
   <div id="container">
      <!-- 메인 컨텐츠 시작 : 화면 크기 조정을 위한 contents - 화면 max-width: 1240, min-width: 1240 -->
      <div id="contents">
      
         <!-- 상단 중앙 시작 -->
         <div id="section1">
            <h1 align="center"> 로그인 </h1>
         </div>
         <div id="section2">
            <div id="s2_inner">
               <div class="join">
                  <form action="loginAction.do" method="post" name="mainform" onsubmit="return mainCheck();">
                     <c:if test="${sessionScope.customerID == null }">	<!-- 세션이 없는 경우 : 첫진입, 로그인 실패 -->
                           <table>
                              <tr>
                                 <td colspan="4" align="center">
                                 <h3>
                                 <c:choose>
                                 	<c:when test="${selectCnt == -1 }">
                                 		비밀번호 똑바로 입력해라 EL
                                 	</c:when>
                                 	<c:when test="${selectCnt == 0 }">
                                 		아이디 없다 똑바로 입력해라 EL
                                 	</c:when>
                                 	<c:when test="${selectCnt == 2 }">
                                 		여어~ EL
                                 	</c:when>
                                 </c:choose>
                                 </h3>
                                 </td>
                              </tr>
		                     <!-- section1 끝 -->
		                     <!-- section2 시작(로그인 X시) -->
                              <tr>
                                 <th>아이디</th>
                                 <td><input class="input" id="label_id" type="text" name="id" maxlength="20" autofocus required placeholder="공백없이 20자 이내로 작성"></td>
                              </tr>
                              <tr>
                                 <th>비밀번호</th>
                                 <td><input class="input" id="label_pwd" type="password" name="password" maxlength="20" required placeholder="공백없이 20자 이내로 작성"></td>
                              </tr>
                              <tr>
                                 <td colspan="2" style="border-bottom: none;">
                                    <div align="right">
                                       <input class="button" type="submit" value="로그인">
                                       <input class="button" type="reset" value="취소">
                                       <input class="button" type="button" value="회원가입" onclick="window.location='join.do'">
                                    </div>
                                 </th> 
                              </tr>
                           </table>
                        
                     <!-- section2 끝(로그인 X시) -->
                     
                     </c:if>
                     
                     <c:if test="${sessionScope.customerID != null }">
                  <%-- <%
                     } else {
                  %> --%>
                  
                        <tr>
                           <th align="center" style="width:300px">
                              <span><b>${sessionScope.customerID }</b></span>여어~ EL
                              <br><br>
                           </th>
                        </tr>
                        <!-- header.jsp에서 로그아웃 처리함,  -->
                        <tr>
                           <td colspan="2" style="border-bottom: none;">
                              <br>
                              <div align="right">
                                 <input type="button"  value="회원정보 수정"
                                    onclick="window.location='modifyCustomer.do'">
                                 <input  type="button"  value="회원탈퇴"
                                    onclick="window.location='deleteCustomer.do'">
                                 <input  type="button"  value="로그아웃"
                                    onclick="window.location='logout.do'">
                              </div>
                           </td>      
                        </tr>
                     </table>      
                     
                     <!-- section2 끝(로그인 상태시) -->
                     
                     </c:if>
                  <%-- <%      
                     }
                  %> --%>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>   
</div>

<br><br><br><br><br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>