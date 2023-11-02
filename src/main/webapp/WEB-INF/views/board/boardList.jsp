<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/boardList.css">
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-center">커뮤니티</h2>
		<!-- search -->
		<form action="${path }/board/boardList.do" class="search">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="b_writer,b_title,b_content,subcon"
					delims="," varStatus="i">
					<c:if test="${sh == board.search }">
						<option value="${sh }" selected>${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != board.search }">
						<option value="${sh }">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${board.keyword }"
				class="form-text inputUnderLine"><input type="submit" name="검색"
				value="검색" class="btn btn-outline-secondary btn-sm btn_search">
		</form>
		<table class="table table-hover">
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>조회수</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5" align="center">게시글이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="board" items="${list }">
						<tr>
							<td>${board.bno }<c:set var="num" value="${num - 1 }"></c:set>
							</td>
							<c:if test="${board.b_del == 'y' }">
								<td colspan="4">삭제된 글 입니다</td>
							</c:if>
							<c:if test="${board.b_del != 'y' }">
								<td><a href="${path }/board/boardView.do?bno=${board.bno}">${board.b_title }</a></td>
								<td>${board.b_writer }</td>
								<td>${board.b_cnt }</td>
								<td>${board.b_date }</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<a href="${path }/board/boardInsertForm.do"
			class="btn btn-outline-secondary btn-sm pull-right">게시글 작성</a>
		<!-- paging -->
		<div>
			<ul class="pagination justify-content-center">
				<!-- < -->
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li class="page-item"><a class="page-link link"
						href="boardList.do?pageNum=1&search=${board.search }&keyword=${board.keyword}">
							<i class="bi bi-arrow-left-square-fill">&laquo;</i>
					</a></li>
					<li class="page-item"><a class="page-link link"
						href="boardList.do?pageNum=${pb.startPage-1}&search=${board.search }&keyword=${board.keyword}">
							<i class="bi bi-arrow-left-circle"></i>
					</a></li>
				</c:if>

				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li class="page-item active"><a class="page-link link"
							href="boardList.do?pageNum=${i }&search=${board.search }&keyword=${board.keyword}">${i }</a>
						</li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li class="page-item"><a class="page-link link"
							href="boardList.do?pageNum=${i }&search=${board.search }&keyword=${board.keyword}">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage }">
					<li class="page-item"><a class="page-link link"
						href="boardList.do?pageNum=${pb.endPage + 1 }&search=${board.search }&keyword=${board.keyword}">
							<i class="bi bi-arrow-right-square-fill"></i>
					</a></li>
					<li class="page-item"><a class="page-link link"
						href="boardList.do?pageNum=${pb.totalPage }&search=${board.search }&keyword=${board.keyword}">
							<i class="bi bi-arrow-right-circle">&raquo;</i>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>

</body>
</html>