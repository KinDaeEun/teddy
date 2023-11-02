<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/adminBoardList.css">
<script type="text/javascript">
function del(bno,b_del) {
	var con = confirm("해당 게시글의 전시상태를 변경하시겠습니까?");
	if(con) {
		location.href="${path}/admin/adminBoardDelete.do?bno="+bno+"&b_del="+b_del;
	}
}
</script>
</head>
<body>
	<div class="container">
		<h4 style="margin-bottom: 10px">커뮤니티 게시글 목록</h4>
		<h6 style="margin-bottom: 10px">게시글 총 ${total } 개</h6>
		<form action="${path }/admin/adminBoardList.do">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="b_title, b_writer, b_content"
					delims="," varStatus="i">
					<c:if test="${sh == board.search }">
						<option value="${sh}" selected>${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != board.search }">
						<option value="${sh }">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${board.keyword }"
				class="form-text inputUnderLine"> <input type="submit" name="검색"
				class="btn btn-outline-secondary btn-sm btn_search" value="검색">
		</form>
		<table class="table table-bordered">
			<tr class="table-secondary">
				<th>게시글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>삭제여부</th>
				<th>삭제/전시</th>
				<th>상세내용</th>
			</tr>
			<c:if test="${empty boardList }">
				<tr>
					<th colspan="7">등록된 게시글이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty boardList }">
				<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.bno }</td>
						<td>${board.b_writer }</td>
						<td>${board.b_title }</td>
						<td>${board.b_date }</td>
						<td>${board.b_cnt }</td>
						<td>${board.b_del }</td>
						<th><a onclick="del(${board.bno},'${board.b_del}')">변경</a></th>
						<th><a
							href="${path }/admin/adminBoardContent.do?bno=${board.bno}">보기</a></th>
					</tr>
				</c:forEach>
			</c:if>
		</table>
			<!-- paging -->
			<div>
				<ul class="pagination pagination-sm justify-content-center">
					<c:if test="${pb.startPage > pb.pagePerBlock}">
						<li class="page-item"><a class="page-link"
							href="adminBoardList.do?pageNum=1&search=${board.search}&keyword=${board.keyword}">
								<i>맨 앞으로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="adminBoardList.do?pageNum=${pb.startPage-1}&search=${board.search}&keyword=${board.keyword}">
								<i>앞으로</i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
						<c:if test="${pb.currentPage == i }">
							<li class="page-item active"><a class="page-link"
								href="adminBoardList.do?pageNum=${i}&search=${board.search}&keyword=${board.keyword}">${i }</a></li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="page-item"><a class="page-link"
								href="adminBoardList.do?pageNum=${i}&search=${board.search}&keyword=${board.keyword}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage}">
						<li class="page-item"><a class="page-link"
							href="adminBoardList.do?pageNum=${pb.endPage+1}&search=${board.search}&keyword=${board.keyword}">
								<i>뒤로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="adminBoardList.do?pageNum=${pb.totalPage}&search=${board.search}&keyword=${board.keyword}">
								<i>맨뒤로</i>
						</a></li>
					</c:if>
				</ul>
			</div>
	</div>
</body>
</html>