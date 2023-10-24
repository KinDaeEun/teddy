<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="inner pg_top v_h">
		<h4 style="margin-bottom: 10px">차량목록</h4>
		<table class="table table-bordered">
			<tr class="table-secondary">
				<th>차량번호</th>
				<th>차량명</th>
				<th>브랜드</th>
				<th>종류</th>
				<th>최고가</th>
				<th>최저가</th>
				<th>출시일</th>
				<th>삭제여부</th>
				<th>전시상태</th>
				<th>상세내용</th>
				<th>차량리뷰</th>
			</tr>
			<c:if test="${empty carList }">
				<tr>
					<th colspan="11">차량이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty carList }">
				<c:forEach var="car" items="${carList }">
					<tr>
						<td>${car.cno }</td>
						<td>${car.c_name }</td>
						<td>${car.brand }</td>
						<td>${car.c_kind }</td>
						<td>${car.max_price }</td>
						<td>${car.min_price }</td>
						<td>${car.c_date }</td>
						<td>${car.c_del }</td>
						<th><a href="#">변경</a></th>
						<th><a href="#">수정</a></th>
						<th><a href="#">리뷰</a></th>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="right">
			<a href="${path}/admin/insertCarForm.do"
				class="btn btn-outline-secondary btn-sm">차량 추가</a>
		</div>
	</div>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>