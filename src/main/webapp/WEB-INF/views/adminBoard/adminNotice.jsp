<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<link rel="stylesheet" href="${path}/resources/css/adminNotice.css">
<script>
	function del(nno) {
		let cf = confirm("게시글을 삭제하시겠습니까 ?")
		if (cf)
			location.href = "${path }/adminBoard/adminNoticeDelete.do?nno="+nno+"&pageNum=${pb.currentPage}";
		else
			alert("삭제가 취소되었습니다")
	}
</script>
</head>
<body>
	<div class="container">
		<h4 class="text-dark" style="margin-bottom: 10px">공지사항 목록</h4>
		<!-- 검색 -->
		<div class="searchDIV">
			<form action="${path }/adminBoard/adminNotice.do">
				<select name="search" class="inputUnderLine">
					<c:forTokens var="sh" items="n_title,n_content,subcon" delims=","
						varStatus="i">
						<c:if test="${sh == notice.search }">
							<option value="${sh }" selected="selected">${title[i.index] }</option>
						</c:if>
						<c:if test="${sh != notice.search }">
							<option value="${sh }">${title[i.index] }</option>
						</c:if>
					</c:forTokens>
				</select> <input type="text" name="keyword" value="${notice.keyword }"
					class="form-text inputUnderLine"> <input type="submit"
					name="검색" class="btn_search" value="검색">
			</form>
		</div>
		<table class="table table-striped table-bordered">
			<tr class="table-secondary text-center">
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center">게시글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="notice" items="${list }">
					<tr>
						<c:if test="${notice.n_del =='y' }">
							<td colspan="5" class="table">삭제된 글입니다</td>
						</c:if>
						<c:if test="${notice.n_del != 'y' }">
							<td><a href="${path }/adminBoard/adminNoticeView.do?nno=${notice.nno}&pageNum=${pb.currentPage}">${notice.n_title }</a></td>
							<td>${notice.n_cnt }</td>
							<td>${notice.n_date }</td>
							<td><a class="btn btn-sm btn-dark"
								href="${path }/adminBoard/adminNoticeUpdateForm.do?nno=${notice.nno}&pageNum=${pb.currentPage}">수정</a></td>
							<td><button class="btn btn-sm btn-dark"
									onclick="del(${notice.nno})">삭제</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="right">
			<a href="${path }/adminBoard/adminNoticeWrite.do"
				class="btn btn-dark btn-sm">공지사항 등록</a>
		</div>
	</div>
	<!-- paging -->
	<div>
		<ul class="pagination pagination-sm justify-content-center">
			<c:if test="${pb.startPage > pb.pagePerBlock}">
				<li class="page-item"><a class="page-link"
					href="adminNotice.do?pageNum=1&search=${notice.search}&keyword=${notice.keyword}">
						<i>맨 앞으로</i>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="adminNotice.do?pageNum=${pb.startPage-1}&search=${notice.search}&keyword=${notice.keyword}">
						<i>앞으로</i>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
				<c:if test="${pb.currentPage == i }">
					<li class="page-item active"><a class="page-link"
						href="adminNotice.do?pageNum=${i}&search=${notice.search}&keyword=${notice.keyword}">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li class="page-item"><a class="page-link"
						href="adminNotice.do?pageNum=${i}&search=${notice.search}&keyword=${notice.keyword}">${i }</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pb.endPage < pb.totalPage}">
				<li class="page-item"><a class="page-link"
					href="adminNotice.do?pageNum=${pb.endPage+1}&search=${notice.search}&keyword=${notice.keyword}">
						<i>뒤로</i>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="adminNotice.do?pageNum=${pb.totalPage}&search=${notice.search}&keyword=${notice.keyword}">
						<i>맨뒤로</i>
				</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>