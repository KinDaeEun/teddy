<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
</head>
<body>
	<div class="container">
		<h4 class="text-dark" style="margin-bottom: 10px">공지사항 목록</h4>
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="7">게시글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="board" items="${list }">
					<tr>
						<c:if test="${notice.n_del =='y' }">
							<td colspan="4" class="table-danger">삭제된 글입니다</td>
						</c:if>
						<c:if test="${notice.n_del != 'y' }">
							<td>${notice.nno }</td>
							<td>${notice.n_title }</td>
							<td>${notice.id }</td>
							<td>${notice.n_cnt }</td>
							<td>${notice.n_date }</td>
							<td><a class="btn btn-sm btn-dark">수정</a></td>
							<td><a class="btn btn-sm btn-dark">삭제</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="right">
			<a href="${path }/adminBoard/noticeWriteForm.do"
				class="btn btn-dark btn-sm">글쓰기</a>
		</div>
	</div>
<!-- 	<div class="paging mg_tb"> -->
<!-- 		<ul class="pagination justify-content-center"> -->
<%-- 			<c:if test="${startPage > PAGE_PER_BLOCK}"> --%>
<!-- 				<li class="page-item"><a class="page-link" -->
<%-- 					href="adminNotice.do?pageNum=${startPage-1}"> --%>
<!-- 						<i class="bi bi-arrow-left-circle icofont-2x"></i> -->
<!-- 				</a></li> -->
<%-- 			</c:if> --%>
<%-- 			<c:forEach var="i" begin="${startPage}" end="${endPage}"> --%>
<%-- 				<c:if test="${currentPage == i }"> --%>
<!-- 					<li class="page-item active"><a class="page-link" -->
<%-- 						href="adminNotice.do?pageNum=${i }">${i }</a></li> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${currentPage != i }"> --%>
<!-- 					<li class="page-item"><a class="page-link" -->
<%-- 						href="adminNotice.do?pageNum=${i}"></a></li> --%>
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
<%-- 			<c:if test="${endPage < totalPage}"> --%>
<!-- 				<li class="page-item"><a class="page-link" -->
<%-- 					href="adminNotice.do?pageNum=${endPage+1 }"> --%>
<!-- 						<i class="bi bi-arrow-right-square icofont-2x"></i> -->
<!-- 				</a></li> -->
<%-- 			</c:if> --%>
<!-- 		</ul> -->
<!-- 	</div> -->
</body>
</html>