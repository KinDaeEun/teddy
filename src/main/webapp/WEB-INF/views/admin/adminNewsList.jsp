<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/adminNewsList.css">
<script type="text/javascript">
function del(nno,n_del) {
	var con = confirm("해당 게시글의 전시상태를 변경하시겠습니까?");
	if(con) {
		location.href="${path}/admin/adminNewsDelete.do?nno="+nno+"&n_del="+n_del;
	}
}
</script>
</head>
<body>
	<div class="container pg_top v_h">
		<h4 style="margin-bottom: 10px">뉴스 목록</h4>
		<h6 style="margin-bottom: 10px">뉴스 총 ${total } 개</h6>
		<form action="${path }/admin/adminNewsList.do">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="n_title, n_writer"
					delims="," varStatus="i">
					<c:if test="${sh == news.search }">
						<option value="${sh}" selected>${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != news.search }">
						<option value="${sh }">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${news.keyword }"
				class="form-text inputUnderLine"> <input type="submit" name="검색"
				class="btn btn-outline-secondary btn-sm btn_search" value="검색">
		</form>
		<table class="table table-bordered">
			<tr class="table-secondary">
				<th>뉴스번호</th>
				<th>커버이미지</th>
				<th>뉴스제목</th>
				<th>작성자</th>
				<th>게시일자</th>
				<th>삭제여부</th>
				<th>삭제/전시</th>
				<th>상세내용</th>
			</tr>
			<c:if test="${empty newsList }">
				<tr>
					<th colspan="7">등록된 게시글이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty newsList }">
				<c:forEach var="news" items="${newsList }">
					<tr>
						<td>${news.nno }</td>
						<td>${news.n_cover_img }</td>
						<td>${news.n_title }</td>
						<td>${news.n_writer }</td>
						<td>${news.n_date }</td>
						<td>${news.n_del }</td>
						<th><a onclick="del(${news.nno},'${news.n_del}')">변경</a></th>
						<th><a
							href="${path }/admin/adminNewsContent.do?nno=${news.nno}">보기</a></th>
					</tr>
				</c:forEach>
			</c:if>
		</table>
			<!-- paging -->
			<div>
				<ul class="pagination pagination-sm justify-content-center">
					<c:if test="${pb.startPage > pb.pagePerBlock}">
						<li class="page-item"><a class="page-link"
							href="adminNewsList.do?pageNum=1&search=${news.search}&keyword=${news.keyword}">
								<i>맨 앞으로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="adminNewsList.do?pageNum=${pb.startPage-1}&search=${news.search}&keyword=${news.keyword}">
								<i>앞으로</i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
						<c:if test="${pb.currentPage == i }">
							<li class="page-item active"><a class="page-link"
								href="adminNewsList.do?pageNum=${i}&search=${news.search}&keyword=${news.keyword}">${i }</a></li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="page-item"><a class="page-link"
								href="adminNewsList.do?pageNum=${i}&search=${news.search}&keyword=${news.keyword}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage}">
						<li class="page-item"><a class="page-link"
							href="adminNewsList.do?pageNum=${pb.endPage+1}&search=${news.search}&keyword=${news.keyword}">
								<i>뒤로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="adminNewsList.do?pageNum=${pb.totalPage}&search=${news.search}&keyword=${news.keyword}">
								<i>맨뒤로</i>
						</a></li>
					</c:if>
				</ul>
			</div>
	</div>
</body>
</html>