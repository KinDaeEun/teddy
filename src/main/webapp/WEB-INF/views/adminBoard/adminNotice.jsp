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
	<div class="container text-center">
		<h2 class="text-primary">게시글 목록</h2>
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty list }">
				<tr class="table-warning">
					<td colspan="5">게시글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${num}<c:set var="num" value="${num-1}"></c:set></td>
						<c:if test="${board.del =='y' }">
							<td colspan="4" class="table-danger">삭제된 글입니다</td>
						</c:if>
						<c:if test="${board.del != 'y' }">
							<!-- 답변글 -->
							<td title="${board.content }"><c:if
									test="${board.re_level > 0}">
									<img src="${path }/resources/images/level.gif" height="5"
										width="${board.re_level * 10 }">
									<img src="${path }/resources/images/re.gif">
								</c:if> <a href="${path }/view/num/${board.num}/pageNum/${pageNum}"
								class="btn btn-primary btn-sm">${board.subject}</a> <c:if
									test="${board.readcount > 50 }">
									<img src="${path }/resources/images/hot.gif">
								</c:if></td>
							<td>${board.writer }</td>
							<td>${board.readcount }</td>
							<td>${board.reg_date }
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div>
			<ul class="pagination justify-content-center">
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li class="page-item"><a class="page-link"
						href="${path}/list/pageNum/1?search=${board.search}&keyword=${board.keyword}">
							<i class="icofont-duotone icofont-arrow-first icofont-2x"></i>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="${path}/list/pageNum/${pb.startPage-1}?search=${board.search}&keyword=${board.keyword}">
							<i class="bi bi-arrow-left-circle icofont-2x"></i>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
					<c:if test="${pb.currentPage == i }">
						<li class="page-item active"><a class="page-link"
							href="${path}/list/pageNum/${i}?search=${board.search}&keyword=${board.keyword}">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li class="page-item"><a class="page-link"
							href="${path}/list/pageNum/${i}?search=${board.search}&keyword=${board.keyword}">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage}">
					<li class="page-item"><a class="page-link"
						href="${path}/list/pageNum/${pb.endPage+1}?search=${board.search}&keyword=${board.keyword}">
							<i class="bi bi-arrow-right-square icofont-2x"></i>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="${path}/list/pageNum/${pb.totalPage}?search=${board.search}&keyword=${board.keyword}">
							<i class="bi bi-arrow-right-circle-fill icofont-2x"></i>
					</a></li>
				</c:if>
			</ul>
		</div>
		<form action="${path }/list/pageNum/1">
			<select name="search">
				<!-- 	<option value="writer">작성자</option>
		<option value="subject">제목</option>
		<option value="content">내용</option> -->
				<c:forTokens var="sh" items="writer,subject,content,subcon"
					delims="," varStatus="i">
					<c:if test="${sh == board.search }">
						<option value="${sh}" selected="selected">${title[i.index]}</option>
					</c:if>
					<c:if test="${sh != board.search }">
						<option value="${sh}">${title[i.index]}</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${board.keyword }">
			<input type="submit" value="확인">
		</form>
		<a href="${path }/insertForm/num/0/pageNum/1" class="btn btn-success">게시글
			입력</a>
	</div>
</body>
</html>