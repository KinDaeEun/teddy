<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/adminMemberList.css">
</head>
<body>
	<div class="pg_top">
		<div class="inner  v_h">
			<h3>회원목록</h3>
			<div>총 회원수${total }명</div>
			<!-- 검색 -->
			<div class="searchDIV">
			<form action="${path }/admin/adminMemberList.do">
				<select name="search" class="inputUnderLine">
					<c:forTokens var="sh" items="id,name,gender,m_del" delims=","
						varStatus="i">
						<c:if test="${sh == member.search }">
							<option value="${sh }" selected="selected">${title[i.index] }</option>
						</c:if>
						<c:if test="${sh != member.search }">
							<option value="${sh }">${title[i.index] }</option>
						</c:if>
					</c:forTokens>
				</select> <input type="text" name="keyword" value="${member.keyword }"
					class="form-text inputUnderLine"> <input type="submit" name="검색"
					class="btn_search" value="검색">
			</form>
			</div>
			<table class="table table-bordered">
				<tr class="table-secondary">

					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>가입일</th>
					<th>삭제여부</th>
				</tr>
				<c:if test="${empty mbList }">
					<tr>
						<th colspan="5" style="text-align: center;">회원 정보가 없습니다</th>
					</tr>
				</c:if>
				<c:if test="${not empty mbList }">
					<c:forEach var="member" items="${mbList }">
						<tr>
							<%-- 						<td>${num } <c:set var="num" value="${num - 1 }"></c:set> </td> --%>
							<td><a
								href="${path }/admin/adminMemberView.do?id=${member.id}&pageNum=${pb.currentPage}">${member.id }</a></td>
							<td>${member.name }</td>
							<td>${member.gender }</td>
							<td>${member.regdate }</td>
							<td>${member.m_del }</td>

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
						<li class="page-item"><a class="page-link link"
							href="adminMemberList.do?pageNum=1&search=${member.search}&keyword=${member.keyword}">
								<i>맨 앞으로</i>
						</a></li>
						<li class="page-item"><a class="page-link link"
							href="adminMemberList.do?pageNum=${pb.startPage-1}&search=${member.search}&keyword=${member.keyword}">
								<i>앞으로</i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
						<c:if test="${pb.currentPage == i }">
							<li class="page-item active"><a class="page-link link"
								href="adminMemberList.do?pageNum=${i}&search=${member.search}&keyword=${member.keyword}">${i }</a></li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="page-item"><a class="page-link link"
								href="adminMemberList.do?pageNum=${i}&search=${member.search}&keyword=${member.keyword}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage}">
						<li class="page-item"><a class="page-link link"
							href="adminMemberList.do?pageNum=${pb.endPage+1}&search=${member.search}&keyword=${member.keyword}">
								<i>뒤로</i>
						</a></li>
						<li class="page-item"><a class="page-link link"
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