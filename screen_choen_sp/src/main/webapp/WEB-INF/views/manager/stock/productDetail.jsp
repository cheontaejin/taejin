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

<Style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
</Style>

<script src="https://kit.fontawesome.com/ba734c2e5e.js" crossorigin="anonymous"></script>

<script type="text/javascript">

var sel_flie;

$(document).ready(function(){
   $("#pdImg").on("change",handleImgFileSelect);
});

function handleImgFileSelect(e){
   var files = e.target.files;
   var filesArr = Array.prototype.slice.call(files);
   
   filesArr.forEach(function(f){

   sel_file = f;
   
   var reader = new FileReader();
   reader.onload = function(e) {
      $("#imgsrc").attr("src",e.target.result);
      }
   reader.readAsDataURL(f);
   });
   
}
</script>

</head>
<body>

	<!-- header 시작 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header 끝 -->
			
		<!-- 컨텐츠 시작 -->
	   <div id="container">
	   		<div id="contents">
	   			<!-- section1 시작 -->
	   			<div id="section1">
	   				<h1 align="center">
	   					상품 수정
	   				</h1>
	   			</div>
	   			
	   			<!-- section2 시작 -->
	   			<div id="section2">
	   				<!-- 좌측 내용 시작 -->
					<div id = "left">
						<div class = "left_inside">
							<!-- 좌측메뉴 -->
							
							<%@ include file="/WEB-INF/views/manager/common/leftMenu.jsp" %>
							
							<!-- 좌측 메뉴바 -->
						</div>
					</div>
	   				
	   				<!-- 우측 내용 시작 -->
	   				<div align="right">
	   					<div class="table_div">
	   					
	   						<form action ="${path }/productUpdateAction.st" method="post" name="form1" enctype="multipart/form-data">
	   							<table style="width:1000px" align="center">
	   								<input type="hidden" name="hiddenPdNo" value="${dto.pd_code}">
	   								<input type="hidden" name="pageNum" value="${pageNum}">
	   								<input type="hidden" name="hiddenPdImg" value="${dto.pd_img}">
	   								<input type="hidden" name="hiddenPdImgDetail" value="${dto.pd_detail_img}">
		   							<tr>
		   								<th style="width: 150px">제품번호 *</th>
		   								<td>
		   									${dto.pd_code}
		   								</td>
		   								
		   								<th>제품명 *</th>
		   								<td>
		   									<input type="text" class="input" name="pd_name" id="pd_name" size="20"  value="${dto.pd_name}" placeholder="제품명 입력" required>
		   								</td>
		   							</tr>
		   							
		   							<tr>
		   								<th style="width: 150px">브랜드 *</th>
		   								<td>
		   									<input type="text" class="input" name="pd_make" id="pd_make" size="20"  value="${dto.pd_make}" placeholder="브랜드 입력" required>
		   								</td>
		   								
		   								<th style="width: 150px">이미지 *</th>
		   								<td>
		   									<input type="file" class="input" name="pd_img" id="pd_img" size="20"  value="${dto.pd_img}" placeholder="이미지 입력" required>
		   									<img src="${dto.pd_img }" width = "80px" height="80px" id="imgsrc">
		   								</td>
		   							</tr>
		   							
		   							<tr>
		   								<th style="width: 150px">카테고리 *</th>
		   								<td colspan = "3">
		   									<div>
		   										<select id="pd_category" name="pd_category">
		   											<option>제품구분</option>
		   											<option <c:if test="${dto.pd_category == '노트북'}">selected</c:if> value = "노트북">노트북</option>
		   											<option <c:if test="${dto.pd_category == '데스크탑'}">selected</c:if> value = "데스크탑">데스크탑</option>
		   											<option <c:if test="${dto.pd_category == '모니터/사운드'}">selected</c:if> value = "모니터/사운드">모니터/사운드</option>
		   											<option <c:if test="${dto.pd_category == '프린터'}">selected</c:if> value = "프린터">프린터</option>
		   											<option <c:if test="${dto.pd_category == 'PC주요부품'}">selected</c:if> value = "PC주요부품">PC주요부품</option>
		   										</select>
		   									</div>
		   								</td>
		   							</tr>
		   							<tr>
		   							
		   							<tr>
									<th>제품 상세페이지</th>
									<td colspan="4">
										<input type="file" class="input" name="pd_detail_img" id="pd_detail_img" size="20"  value="${dto.pd_detail_img}" placeholder="이미지 입력" required>
		   								<img src="${dto.pd_detail_img }" width = "80px" height="80px" id="imgsrc">
									</td>
									</tr>
									<tr>
										<th>판매가격</th>
										<td colspan="4"><input type = "number" class = "input" id = "pd_salary" name = "pd_salary" size = "10" value="${dto.pd_salary }" placeholder = "상품 판매가 입력" required></td>
									</tr>
									
									<tr>
										<th>재고수량</th>
										<td colspan="4"><input type = "number" class = "input" id = "pd_stock" name = "pd_stock" size = "10" value="${dto.pd_stock }" placeholder = "상품 원가 입력" required></td>
									</tr>
									<tr>
										<th>판매상태</th>
										<td colspan="4">
											<select class = "input" id="pd_status" name = "pd_status" required>
												<option>상품판매상태</option>
												<option <c:if test="${dto.pd_status == '판매중'}">selected</c:if> value = "판매중">판매중</option>
												<option <c:if test="${dto.pd_status == '품절'}">selected</c:if> value = "품절">판매중</option>
											</select>
		   								</td>
									</tr>
									
									<tr>
										<th>등록일</th>
										<td colspan="4">
										<fmt:formatDate pattern="yyy-MM-dd hh:mm" value = "${dto.pd_date }" />
										</td>
									</tr>
									
									<tr>
	   								<th colspan="4">
	   									<input type="submit" class ="inputButton" value="수정" id="btnEdit">
	   									<input type="reset" class ="inputButton" value="취소" id="history.back();">
	   								</th>
	   							</tr>
	   							</table>
	   						</form>
	   					</div>
	   				</div>
	   			</div>	<!-- section2 -->
	   		</div>
	   </div>
	</div>
	   <!-- 컨텐츠 종료 -->


	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->

</body>
</html>