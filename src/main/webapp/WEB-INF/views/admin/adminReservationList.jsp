<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/adminReservationList.css">
<script type="text/javascript">
function del(rno,r_del) {
	var con = confirm("해당 게시글의 전시상태를 변경하시겠습니까?");
	if(con) {
		location.href="${path}/admin/adminReservationDelete.do?rno="+rno+"&r_del="+r_del;
	}
}
</script>
</head>
<body>
	<div class="container pg_top v_h">
		<h4 style="margin-bottom: 10px">시승 예약 목록</h4>
		<h6 style="margin-bottom: 10px">시승 예약 총 ${total } 개</h6>
		<form action="${path }/admin/adminReservationList.do">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="r_name, brand, c_name"
					delims="," varStatus="i">
					<c:if test="${sh == reservation.search }">
						<option value="${sh}" selected>${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != reservation.search }">
						<option value="${sh }">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${reservation.keyword }"
				class="form-text inputUnderLine"> <input type="submit" name="검색"
				class="btn btn-outline-secondary btn-sm btn_search" value="검색">
		</form>
		<table class="table table-bordered">
			<tr class="table-secondary">
				<th>예약번호</th>
				<th>예약자 아이디</th>
				<th>예약자 성명</th>
				<th>예약자 이메일</th>
				<th>예약자 연락처</th>
				<th>예약일 / 시간</th>
				<th>시승 브랜드</th>
				<th>시승 모델</th>
				<th>시승 지역 / 구</th>
				<th>전시장</th>
				<th>삭제여부</th>
				<th>삭제/전시</th>
			</tr>
			<c:if test="${empty reservationList }">
				<tr>
					<th colspan="7">등록된 게시글이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty reservationList }">
				<c:forEach var="reservation" items="${reservationList }">
					<tr>
						<td>${reservation.rno }</td>
						<td>${reservation.id }</td>
						<td>${reservation.r_name }</td>
						<td>${reservation.email }</td>
						<td>${reservation.r_tel }</td>
						<td>${reservation.r_date }</td>
						<td>${reservation.brand }</td>
						<td>${reservation.c_name }</td>
						<td>${reservation.find_city }&nbsp;${reservation.find_gu }</td>
						<td>${reservation.find_center }</td>
						<td>${reservation.r_del }</td>
						<th><a onclick="del(${reservation.rno},'${reservation.r_del}')">변경</a></th>
					</tr>
				</c:forEach>
			</c:if>
		</table>
			<!-- paging -->
			<div>
				<ul class="pagination pagination-sm justify-content-center">
					<c:if test="${pb.startPage > pb.pagePerBlock}">
						<li class="page-item"><a class="page-link link"
							href="adminReservationList.do?pageNum=1&search=${reservation.search}&keyword=${reservation.keyword}">
								<i>맨 앞으로</i>
						</a></li>
						<li class="page-item"><a class="page-link link"
							href="adminReservationList.do?pageNum=${pb.startPage-1}&search=${reservation.search}&keyword=${reservation.keyword}">
								<i>앞으로</i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
						<c:if test="${pb.currentPage == i }">
							<li class="page-item active"><a class="page-link link"
								href="adminReservationList.do?pageNum=${i}&search=${reservation.search}&keyword=${reservation.keyword}">${i }</a></li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="page-item"><a class="page-link link"
								href="adminReservationList.do?pageNum=${i}&search=${reservation.search}&keyword=${reservation.keyword}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage}">
						<li class="page-item"><a class="page-link link"
							href="adminReservationList.do?pageNum=${pb.endPage+1}&search=${reservation.search}&keyword=${reservation.keyword}">
								<i>뒤로</i>
						</a></li>
						<li class="page-item"><a class="page-link link"
							href="adminReservationList.do?pageNum=${pb.totalPage}&search=${reservation.search}&keyword=${reservation.keyword}">
								<i>맨뒤로</i>
						</a></li>
					</c:if>
				</ul>
			</div>
	</div>
</body>
</html>