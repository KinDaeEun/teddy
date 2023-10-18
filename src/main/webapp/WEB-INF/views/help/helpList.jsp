<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title {
	text-align: center;
}
.list_fx{
display: flex;
justify-content: space-between;
}
.listAc{
  color: #333;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h3 class="title">${id }님의문의내역</h3>
	<div class="inner">
		<div class="list_fx">
			<!-- 검색 -->
			<form action="${path }/help/helpList.do">
			<select name="search">
					<c:forTokens var="sh" items="h_title,h_content,subcon" delims=","
						varStatus="i">
						<c:if test="${sh == help.search }">
							<option value="${sh }" selected>${title[i.index] }</option>
						</c:if>
						<c:if test="${sh != help.search }">
							<option value="${sh }">${title[i.index] }</option>
						</c:if>
					</c:forTokens>
				</select> <input type="text" name="keyword" value="${help.keyword }"
					class="form-text"> <input type="submit" name="검색"
					class="btn btn-outline-secondary btn-sm" value="검색">
			</form>

			<a href="${path }/help/helpInsertForm.do"
				class=" btn-sm listAc">1:1 문의 등록하기</a>
		</div>

		<table class="table">
			<tr>

				<th class="text-center">제목</th>
				<th class="text-center">작성일</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="2" class="text-center">문의내역이 존재하지 않습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="help" items="${list }">
					<tr>

						<c:if test="${help.h_del == 'y' }">
							<th colspan="2" class="text-center">삭제된 게시글입니다</th>
						</c:if>
						<c:if test="${help.h_del != 'y' }">
							<td class="text-center btn-sm"><a
								href="${path }/help/helpView.do?hno=${help.hno}&pageNum=${pb.currentPage}"
								class="menuTitle">${help.h_title }</a></td>
							<td class="text-center">${help.h_date }</td>

						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- paging -->
		<div>
			<ul class="pagination pagination-sm justify-content-center">
<%-- 		<li>${pb}</li>  --%>
				<%-- 				<li>${pageNum }</li> --%>
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li class="page-item"><a class="page-link"
						href="helpList.do?pageNum=1&search=${help.search}&keyword=${help.keyword}">
							<i>맨 앞으로</i>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="helpList.do?pageNum=${pb.startPage-1}&search=${help.search}&keyword=${help.keyword}">
							<i>앞으로</i>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
					<c:if test="${pb.currentPage == i }">
						<li class="page-item active"><a class="page-link"
							href="helpList.do?pageNum=${i}&search=${help.search}&keyword=${help.keyword}">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li class="page-item"><a class="page-link"
							href="helpList.do?pageNum=${i}&search=${help.search}&keyword=${help.keyword}">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage}">
					<li class="page-item"><a class="page-link"
						href="helpList.do?pageNum=${pb.endPage+1}&search=${help.search}&keyword=${help.keyword}">
							<i>뒤로</i>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="helpList.do?pageNum=${pb.totalPage}&search=${help.search}&keyword=${help.keyword}">
							<i>맨뒤로</i>
					</a></li>
				</c:if>
			</ul>
		</div>

	
	</div>
</body>
</html>