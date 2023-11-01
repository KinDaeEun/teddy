<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th {
	margin-top: 10px;
}

h3 {
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<div class="container">
		<h3 align="center">예약 내역</h3>
		<table class="table table-striped">
			<c:if test="${empty reservationList }">
			시승예약 내역이 없습니다
		</c:if>
			<c:if test="${not empty reservationList }">
				<c:forEach var="reservation" items="${reservationlist }">
					<!-- 				<tr> -->
					<!-- 					<th></th> -->
					<!-- 				</tr> -->
					<tr class="text-center">
						<th>차량 브랜드</th>
						<td>${reservation.brand }</td>
						<th>차량 모델</th>
						<td>${reservation.c_name }</td>
					</tr>
					<tr class="text-center">
						<th>예약자 성명</th>
						<td>${reservation.r_name }</td>
						<th>예약자 이메일</th>
						<td>${reservation.email }</td>
					</tr>
					<tr class="text-center">
						<th>예약자 연락처</th>
						<td>${reservation.r_tel }</td>
						<th>예약한 전시장</th>
						<td>${reservation.find_city }${reservation.find_gu }
							${reservation.find_center }</td>
					</tr>
					<tr class="text-center">
						<th>예약 날짜</th>
						<td>${reservation.r_date }</td>
					</tr>
					<button onclick="delete()" class="btn btn-secondary btn-sm">예약취소</button>
				</c:forEach>
			</c:if>
		</table>

		<div style="align-content: center">
			<div align="center">
				<a href="${path }/main/main.do"
					class="btn btn-outline-secondary btn-sm">돌아가기</a>
			</div>
		</div>
	</div>
</body>
</html>