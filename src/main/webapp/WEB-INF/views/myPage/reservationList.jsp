<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<div class="container">
		<h3 align="center">예약 내역</h3>
		<table class="table table-bordered">
			<c:forEach var="reservation" items="${reservationlist }">
				<tr>
					<th></th>
				</tr>
				<tr>
					<th>차량 브랜드</th>
					<td>${reservation.brand }</td>
				</tr>
				<tr>
					<th>차량 모델</th>
					<td>${reservation.c_name }</td>
				</tr>
				<tr>
					<th>예약자 성명</th>
					<td>${reservation.r_name }</td>
				</tr>
				<tr>
					<th>예약자 이메일</th>
					<td>${reservation.email }</td>
				</tr>
				<tr>
					<th>예약자 연락처</th>
					<td>${reservation.r_tel }</td>
				</tr>
				<tr>
					<th>예약한 전시장</th>
					<td>${reservation.find_city }</td>
					<td>${reservation.find_gu }</td>
					<td>${reservation.find_center }</td>
				</tr>
				<tr>
					<th>예약 날짜</th>
					<td>${reservation.r_date }</td>
				</tr>
			</c:forEach>
		</table>

		<div style="align-content: center">
			<div align="center">
				<a href="${path }/main/main.do"
					class="btn btn-outline-secondary btn-sm">돌아가기</a>
				<button onclick="delete()" class="btn btn-secondary btn-sm">예약취소</button>
			</div>
		</div>
	</div>
</body>
</html>