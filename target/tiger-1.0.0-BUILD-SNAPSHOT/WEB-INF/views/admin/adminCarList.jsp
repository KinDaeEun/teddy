<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	cursor: pointer;
	color: black;
}
tr, th{
	text-align: center;
}
</style>
<script type="text/javascript">
function del(cno,c_del) {
	var con = confirm("해당 차량의 전시상태를 변경하시겠습니까?");
	if(con) {
		location.href="${path}/admin/adminCarDelete.do?cno="+cno+"&c_del="+c_del;
	}
}
</script>
</head>
<body>
	<div class="container pg_top v_h">
		<h4 style="margin-bottom: 10px">차량목록</h4>
		<form action="${path }/admin/adminCarList.do">
				<select name="search">
					<c:forTokens var="sh" items="cno,c_name,brand,c_kind" delims=","
						varStatus="i">
						<c:if test="${sh == car.search }">
							<option value="${sh}" selected>${title[i.index] }</option>
						</c:if>
						<c:if test="${sh != car.search }">
							<option value="${sh }">${title[i.index] }</option>
						</c:if>
					</c:forTokens>
				</select> <input type="text" name="keyword" value="${car.keyword }"
					class="form-text"> <input type="submit" name="검색"
					class="btn btn-outline-secondary btn-sm" value="검색">
			</form>
		<table class="table table-bordered" >
			<tr class="table-secondary">
				<th>차량번호</th>
				<th>차량명</th>
				<th>브랜드</th>
				<th>종류</th>
				<th>최고가</th>
				<th>최저가</th>
				<th>출시일</th>
				<th>삭제여부</th>
				<th>삭제/전시</th>
				<th>상세내용</th>
				<th>차량리뷰</th>
				<th>디자인 이미지</th>
			</tr>
			<c:if test="${empty carList }">
				<tr>
					<th colspan="11">차량이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty carList }">
				<c:forEach var="car" items="${carList }">
					<tr>
						<td>${car.cno }</td>
						<td>${car.c_name }</td>
						<td>${car.brand }</td>
						<td>${car.c_kind }</td>
						<td>${car.max_price }</td>
						<td>${car.min_price }</td>
						<td>${car.c_date }</td>
						<td>${car.c_del }</td>
						<th><a onclick="del(${car.cno},'${car.c_del}')">변경</a></th>
						<th><a href="${path }/admin/adminCarUpdateForm.do?cno=${car.cno}">수정</a></th>
						<th><a href="${path }/admin/adminReviewList.do?cno=${car.cno}">리뷰</a></th>
						<th><a href="${path }/admin/adminCarImgList.do?cno=${car.cno}">수정</a></th>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="right">
			<a href="${path}/admin/adminCarInsertForm.do"
				class="btn btn-outline-secondary btn-sm">차량 추가</a>
		</div>
		<div>
				<ul class="pagination justify-content-center">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<li class="page-item"><a class="page-link"
							href="adminCarList.do?pageNum=${startPage-1}&search=${car.search}&keyword=${car.keyword}">
								<i class="bi bi-arrow-left-circle icofont-2x"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage == i }">
							<li class="page-item active"><a class="page-link"
								href="adminCarList.do?pageNum=${i }&search=${car.search}&keyword=${car.keyword}">${i }</a></li>
						</c:if>
						<c:if test="${currentPage != i }">
							<li class="page-item"><a class="page-link"
								href="adminCarList.do?pageNum=${i}&search=${car.search}&keyword=${car.keyword}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < totalPage}">
						<li class="page-item"><a class="page-link"
							href="adminCarList.do?pageNum=${endPage+1 }&search=${car.search}&keyword=${car.keyword}">
								<i class="bi bi-arrow-right-square icofont-2x"></i>
						</a></li>
					</c:if>
				</ul>
			</div>
	</div>



</body>
</html>