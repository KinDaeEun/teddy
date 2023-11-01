<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<link rel="stylesheet" href="${path}/resources/css/notice.css">
</head>
<body>
	<div class="container">
		<h4 class="text-dark" style="margin-bottom: 10px">공지사항 목록</h4>
		<!-- 검색 -->
		<form action="${path }/board/notice.do">
			<select name="search">
				<c:forTokens var="sh" items="n_title,n_content,subcon" delims=","
					varStatus="i">
					<c:if test="${sh == notice.search }">
						<option value="${sh }" selected>${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != notice.search }">
						<option value="${sh }">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${notice.keyword }"
				class="form-text"> <input type="submit" name="검색"
				class="btn btn-outline-secondary btn-sm" value="검색">
		</form>


		<table class="table table-striped">
			<tr>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="3" align="center">게시글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="notice" items="${list }">
					<tr>
							<td><a href="${path }/board/noticeView.do?nno=${notice.nno}&pageNum=${pb.currentPage}">${notice.n_title }</a></td>
							<td>${notice.n_cnt }</td>
							<td>${notice.n_date }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<!-- paging -->
	<div>
		<ul class="pagination pagination-sm justify-content-center">
			<c:if test="${pb.startPage > pb.pagePerBlock}">
				<li class="page-item"><a class="page-link link"
					href="notice.do?pageNum=1&search=${notice.search}&keyword=${notice.keyword}">
						<i>맨 앞으로</i>
				</a></li>
				<li class="page-item"><a class="page-link link"
					href="notice.do?pageNum=${pb.startPage-1}&search=${notice.search}&keyword=${notice.keyword}">
						<i>앞으로</i>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
				<c:if test="${pb.currentPage == i }">
					<li class="page-item active"><a class="page-link link"
						href="notice.do?pageNum=${i}&search=${notice.search}&keyword=${notice.keyword}">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li class="page-item"><a class="page-link link"
						href="notice.do?pageNum=${i}&search=${notice.search}&keyword=${notice.keyword}">${i }</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pb.endPage < pb.totalPage}">
				<li class="page-item"><a class="page-link link"
					href="notice.do?pageNum=${pb.endPage+1}&search=${notice.search}&keyword=${notice.keyword}">
						<i>뒤로</i>
				</a></li>
				<li class="page-item"><a class="page-link link"
					href="notice.do?pageNum=${pb.totalPage}&search=${notice.search}&keyword=${notice.keyword}">
						<i>맨뒤로</i>
				</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>