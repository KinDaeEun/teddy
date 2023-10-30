<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container" align="center">
		<h2 class="text-secondary text-center" style="cursor: pointer">게시글
			목록</h2>
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
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
				</c:forEach>
			</c:if>
		</table>
		<!-- paging -->
		<div>
			<ul class="pagination pagination-sm justify-content-center">
				<!-- < -->
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li class="page-item"><a class="page-link"
						href="${path }/list/pageNum/1?search=${board.search }&keyword=${board.keyword}">
							<i class="bi bi-arrow-left-square-fill"
							style="width: 10px; height: 10px"></i>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="${path }/list/pageNum/${pb.startPage-1}?search=${board.search }&keyword=${board.keyword}">
							<i class="bi bi-arrow-left-circle"></i>
					</a></li>
				</c:if>

				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li class="page-item active"><a class="page-link"
							href="${path }/list/pageNum/${i }?search=${board.search }&keyword=${board.keyword}">${i }</a>
						</li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li class="page-item"><a class="page-link"
							href="${path }/list/pageNum/${i }?search=${board.search }&keyword=${board.keyword}">${i }</a>
						</li>
					</c:if>
				</c:forEach>

				<!-- > -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li class="page-item"><a class="page-link"
						href="${path }/list/pageNum/${pb.endPage + 1 }?search=${board.search }&keyword=${board.keyword}">
							<i class="bi bi-arrow-right-square-fill"></i>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="${path }/list/pageNum/${pb.totalPage }?search=${board.search }&keyword=${board.keyword}">
							<i class="bi bi-arrow-right-circle"></i>
					</a></li>
				</c:if>
			</ul>
		</div>
		<form action="${path }/list/pageNum/1">
			<select name="search">
				<!--	<option value="writer">작성자</option>
				<option value="subject">제목</option>
				<option value="content">내용</option>	-->
				<c:forTokens var="sh" items="writer,subject,content,subcon"
					delims="," varStatus="i">
					<c:if test="${sh == board.search }">
						<option value="${sh }" selected>${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != board.search }">
						<option value="${sh }">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${board.keyword }"
				class="form-text"> <input type="submit" name="검색"
				class="btn btn-outline-secondary btn-sm">
		</form>
		<a href="${path }/board/boardInsertForm.do"
			class="btn btn-outline-secondary btn-sm">게시글 작성</a>
	</div>

</body>
</html>