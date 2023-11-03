<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/adminHelpList.css">
<style type="text/css">

</style>
</head>
<body>
	<div class="pg_top v_h">
		<h3 class="title">문의내역</h3>
		<div class="inner">
			<div class="list_fx">
				<!-- 검색 -->
				<form action="${path }/admin/adminHelpList.do">
					<select name="search" class="inputUnderLine">
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
						class="form-text inputUnderLine"> <input type="submit" name="검색"
						class="btn btn-outline-secondary btn-sm btn_search" value="검색">
				</form>
			</div>
			<table class="table table-bordered">
				<tr class="table-secondary">
					<th class="text-center">아이디</th>
					<th class="text-center">제목</th>
					<th class="text-center">삭제여부</th>
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
							<td>${help.id }</td>
							<td class="text-center btn-sm"><a
								href="${path }/admin/adminHelpView.do?hno=${help.hno}&pageNum=${pb.currentPage}"
								class="menuTitle">${help.h_title }</a></td>
							<td class="text-center">${help.h_del }</td>
							<td class="text-center">${help.h_date }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<!-- paging -->
			<div>
				<ul class="pagination pagination-sm justify-content-center">
					<%-- 				<li>${pb}</li> --%>
					<%-- 				<li>${pageNum }</li> --%>
					<c:if test="${pb.startPage > pb.pagePerBlock}">
						<li class="page-item"><a class="page-link link"
							href="adminHelpList.do?pageNum=1&search=${help.search}&keyword=${help.keyword}">
								<i>맨 앞으로</i>
						</a></li>
						<li class="page-item"><a class="page-link link"
							href="adminHelpList.do?pageNum=${pb.startPage-1}&search=${help.search}&keyword=${help.keyword}">
								<i>앞으로</i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
						<c:if test="${pb.currentPage == i }">
							<li class="page-item active"><a class="page-link link"
								href="adminHelpList.do?pageNum=${i}&search=${help.search}&keyword=${help.keyword}">${i }</a></li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="page-item"><a class="page-link link"
								href="adminHelpList.do?pageNum=${i}&search=${help.search}&keyword=${help.keyword}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage}">
						<li class="page-item"><a class="page-link link"
							href="adminHelpList.do?pageNum=${pb.endPage+1}&search=${help.search}&keyword=${help.keyword}">
								<i>뒤로</i>
						</a></li>
						<li class="page-item"><a class="page-link link"
							href="adminHelpList.do?pageNum=${pb.totalPage}&search=${help.search}&keyword=${help.keyword}">
								<i>맨뒤로</i>
						</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>