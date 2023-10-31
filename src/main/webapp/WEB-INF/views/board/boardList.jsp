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
		<h2 class="text-secondary text-center" style="cursor: pointer">게시글 목록</h2>
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
						<td>
							${board.bno }<c:set var="num" value="${num - 1 }"></c:set>
						</td>
						<c:if test="${board.del == 'y' }">
							<td colspan="4">삭제된 글 입니다</td>
						</c:if>
						<c:if test="${board.del != 'y' }">
							<td>${board.b_title }</td>
							<td>${board.b_writer }</td>
							<td>${board.b_cnt }</td>
							<td>${board.b_date }</td>
						</c:if>
				</c:forEach>
			</c:if>
		</table>
		<a href="${path }/board/boardInsertForm.do" class="btn btn-outline-secondary btn-sm">게시글 작성</a>
	</div>
</body>
</html>