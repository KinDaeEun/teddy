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
	<div>
		<div class="v_h">
			<h3 class="mg-b">공지사항 목록</h3>
			
			<table class="table">
				<tr class="text-center">
					<th>번호</th>
					<th colspan="2">제목</th>
					<th>가입일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:if test="${empty ntList }">
					<tr>
						<th class="text-center" colspan="6">게시글이 없습니다</th>
					</tr>
				</c:if>
				<c:if test="${not empty ntList }">
					<c:forEach var="board" items="${ntList }">
						<tr>
							<td>${board.bno }</td>
							<td colspan="2"><a
								href="${path }/adminBoard/adminNoticeView.do?id=${board.id}&pageNum=${pb.currentPage}">${board.b_title }</a></td>
							<th>${board.b_date }</th>
							<td><a
								href="${path }/adminBoard/adminNotice_update.do?bno=${board.bno}"
								class="btn btn-warning">수정</a></td>
							<td><a
								href="${path }/adminBoard/adminNotice_delete.do?bno=${board.bno}"
								class="btn btn-warning">삭제</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="mg_tb" align="right">
				<a href="${path }/adminBoard/adminBoard_write.do" class="btn btn-dark btn-sm">글쓰기</a>
			</div>
			<!-- paging -->
			<div>
				<ul class="pagination pagination-sm justify-content-center">
					<c:if test="${pb.startPage > pb.pagePerBlock}">
						<li class="page-item"><a class="page-link"
							href="adminMemberList.do?pageNum=1&search=${member.search}&keyword=${member.keyword}">
								<i>맨 앞으로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="adminMemberList.do?pageNum=${pb.startPage-1}&search=${member.search}&keyword=${member.keyword}">
								<i>앞으로</i>
						</a></li>
					</c:if>
				
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
						<c:if test="${pb.currentPage == i }">
							<li class="page-item active"><a class="page-link"
								href="adminMemberList.do?pageNum=${i}&search=${member.search}&keyword=${member.keyword}">${i }</a></li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="page-item"><a class="page-link"
								href="adminMemberList.do?pageNum=${i}&search=${member.search}&keyword=${member.keyword}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage}">
						<li class="page-item"><a class="page-link"
							href="adminMemberList.do?pageNum=${pb.endPage+1}&search=${member.search}&keyword=${member.keyword}">
								<i>뒤로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="adminMemberList.do?pageNum=${pb.totalPage}&search=${member.search}&keyword=${member.keyword}">
								<i>맨뒤로</i>
						</a></li>
					</c:if>
				</ul>
			</div>
		</div>
			
	</div>
</body>
</html>