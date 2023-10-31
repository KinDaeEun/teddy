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
function del(re_no,re_del) {
	var con = confirm("해당 리뷰의 전시상태를 변경하시겠습니까?");
	if(con) {
		location.href="${path}/admin/adminReviewDelete.do?re_no="+re_no+"&re_del="+re_del;
	}
}
</script>
</head>
<body>
	<div class="container pg_top v_h">
		<h4 style="margin-bottom: 10px">차량  : ${c_name}(${review.cno })</h4>
		<h4 style="margin-bottom: 10px">리뷰목록</h4>
		<form action="${path }/admin/adminReviewList.do">
			<input type="hidden" value="${review.cno }" name="cno">
				<select name="search">
					<c:forTokens var="sh" items="re_no,id" delims=","
						varStatus="i">
						<c:if test="${sh == review.search }">
							<option value="${sh}" selected>${title[i.index] }</option>
						</c:if>
						<c:if test="${sh != review.search }">
							<option value="${sh }">${title[i.index] }</option>
						</c:if>
					</c:forTokens>
				</select> <input type="text" name="keyword" value="${review.keyword }"
					class="form-text"> <input type="submit" name="검색"
					class="btn btn-outline-secondary btn-sm" value="검색">
			</form>
		<table class="table table-bordered" >
			<tr class="table-secondary">
				<th>리뷰번호</th>
				<th>작성자</th>
				<th>점수</th>
				<th>작성일</th>
				<th>삭제여부</th>
				<th>삭제/전시</th>
				<th>상세내용</th>

			</tr>
			<c:if test="${empty reviewList }">
				<tr>
					<th colspan="7">리뷰가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty reviewList }">
				<c:forEach var="review" items="${reviewList }">
					<tr>
						<td>${review.re_no }</td>
						<td>${review.id }</td>
						<td>${review.rating }</td>
						<td>${review.re_date }</td>
						<td>${review.re_del }</td>
						<th><a onclick="del(${review.re_no},'${review.re_del}')">변경</a></th>
						<th><a href="${path }/admin/adminReviewContent.do?re_no=${review.re_no}">보기</a></th>

	
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div>
				<ul class="pagination justify-content-center">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<li class="page-item"><a class="page-link"
							href="adminReviewList.do?pageNum=${startPage-1}&search=${review.search}&keyword=${review.keyword}&cno=${review.cno}">
								<i class="bi bi-arrow-left-circle icofont-2x"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage == i }">
							<li class="page-item active"><a class="page-link"
								href="adminReviewList.do?pageNum=${i }&search=${review.search}&keyword=${review.keyword}&cno=${review.cno}">${i }</a></li>
						</c:if>
						<c:if test="${currentPage != i }">
							<li class="page-item"><a class="page-link"
								href="adminReviewList.do?pageNum=${i}&search=${review.search}&keyword=${review.keyword}&cno=${review.cno}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < totalPage}">
						<li class="page-item"><a class="page-link"
							href="adminReviewList.do?pageNum=${endPage+1 }&search=${review.search}&keyword=${review.keyword}&cno=${review.cno}">
								<i class="bi bi-arrow-right-square icofont-2x"></i>
						</a></li>
					</c:if>
				</ul>
			</div>
	</div>



</body>
</html>