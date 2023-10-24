<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 예약</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
h2 {
	margin-bottom: 50px;
}

/* .pd_top { */
/* 	padding-top: 200px; */
/* 	height: 130vh; */
/* } */
</style>

<script>
	// 브랜드 모델 select
	function carBox() {
		$.post('${path}/nolay/brand.do', "brand=" + frm.brand.value, function(
				data) {
			$('#car_cname').html(data);
			$('#car_center').html('');
			$('#find_gu').val('a');
		})
	}
	// 구 select
	function centerBox() {
		$.post('${path}/nolay/center.do', "brand=" + frm.brand.value
				+ "&find_gu=" + frm.find_gu.value, function(data) {
			$('#car_center').html(data);
		})
	}
</script>

</head>
<body>
	<div class="container pg_top pg-b">
		<h2 align="left" class="text-secondary">차량 선택</h2>
		<form action="${path}/car/reservationResult.do" method="post"
			name="frm">
			<table class="table table-bordered">
				<tr>
					<th>차량 브랜드&nbsp;*</th>
					<c:if test="${not empty brandlist}">
						<td><select class="form-select" onchange="carBox()" required
							name="brand">
								<optgroup label="회사를 선택해주세요">
									<option>회사를 먼저 선택해주세요</option>
									<c:forEach var="car" items="${brandlist }">
										<option>${car.brand }</option>
									</c:forEach>
								</optgroup>

						</select></td>
					</c:if>
					<!-- 차량 목록에서 넘어온 input -->
					<c:if test="${empty brandlist}">
						<td><input type="text" name="brand" value="${car.brand }"
							class="form-control" readonly="readonly"></td>
					</c:if>
				</tr>
				<tr>
					<th>차량 모델&nbsp;*</th>
					<td><c:if test="${not empty brandlist}">
							<div id="car_cname" class="r_model"></div>
						</c:if> <c:if test="${empty brandlist}">
							<div id="car_cname" class="r_model">
								<input type="text" name="c_name" value="${car.c_name }"
									class="form-control" readonly="readonly">
							</div>
						</c:if></td>
				</tr>
			</table>

			<h2 align="left" style="margin-top: 50px;" class="text-secondary">시승
				예약</h2>
			<table class="table table-bordered">
				<tr>
					<th>성명&nbsp;*</th>
					<td><input type="text" name="r_name" class="form-control"
						required autofocus></td>
				</tr>
				<tr>
					<th>이메일&nbsp;*</th>
					<td><input type="email" name="email" class="form-control"
						required></td>
				</tr>
				<tr></tr>
				<tr>
					<th>휴대폰 번호&nbsp;*</th>
					<td>
						<!-- 번호형식 추가예정 --> <input type="text" name="r_tel"
						placeholder="전화번호는 숫자로만 입력해주세요" class="form-control" required>
					</td>
				</tr>
				<tr>
					<th>지역 선택</th>
					<td><select class="form-select" name="find_city" required>
							<option>서울
					</select></td>
				</tr>
				<tr>
					<th>구 선택</th>
					<td><select id="find_gu" class="form-select"
						onchange="centerBox()" name="find_gu">
							<option value="a">구를 선택해주세요
							<option value="강북">강북
							<option value="강서">강서
							<option value="강남">강남
							<option value="강동">강동
					</select>
				</tr>
				<tr>
					<th>전시장 선택</th>
					<td>
						<div id="car_center"></div>
					</td>
				</tr>
			</table>
			<h2 align="left" style="margin-top: 50px;" class="text-secondary">예약
				날짜 선택</h2>
			<details open>
				<summary style="font-weight: bold">예약 날짜 선택</summary>
				<br>
				<!-- picker 시작 -->
				<input type="text" name="r_date" id="datetimePicker"
					placeholder="날짜 및 시간 선택" class="form-control"
					style="text-align: center">
				<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
				<script>
					flatpickr("#datetimePicker", {
						enableTime : true, // 시간 선택 활성화
						dateFormat : "Y-m-d H:i", // 날짜 및 시간 형식
						minDate : "today", // 오늘 이전 날짜를 선택할 수 없게 함
					});
				</script>
			</details>
			<!-- picker 끝 -->
			<div style="align-content: center">
				<div align="center">
					<input type="submit" value="예약하기" class="btn btn-outline-dark"
						style="margin-top: 30px;">
				</div>
			</div>
		</form>
	</div>
</body>
</html>