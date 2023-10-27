<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div>
		<table class="table">
			<tr>
				<td class="text-center">아이디</td>
				<td class="text-center">칭찬내용</td>
				<td class="text-center">등록일</td>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="3" class="text-center">칭찬내역이 존재하지 않습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="compliment" items="${list }">
					<tr>
						<td class="text-center">${compliment.id }</td>
						<td class="text-center">${compliment.cp_content }</td>
						<td class="text-center">${compliment.cp_date }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- paging -->
		<div>
			<ul class="pagination pagination-sm justify-content-center">
<%-- 								<li>${pb}</li>  --%>
				<%-- 				<li>${pageNum }</li> --%>
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li class="page-item"><a class="page-link"
						href="${path }/board/complimentList.do?pageNum=1">
							<i>맨 앞으로</i>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="${path }/board/complimentList.do?pageNum=${pb.startPage-1}">
							<i>앞으로</i>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
					<c:if test="${pb.currentPage == i }">
						<li class="page-item active"><a class="page-link"
							href="${path }/board/complimentList.do?pageNum=${i}">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li class="page-item"><a class="page-link"
							href="${path }/board/complimentList.do?pageNum=${i}">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage}">
					<li class="page-item"><a class="page-link"
						href="${path }/board/complimentList.do?pageNum=${pb.endPage+1}">
							<i>뒤로</i>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="${path }/board/complimentList.do?pageNum=${pb.totalPage}">
							<i>맨뒤로</i>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>