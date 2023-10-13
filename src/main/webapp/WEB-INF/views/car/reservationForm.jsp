<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 예약</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
	integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
	integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
h2 {
	margin-bottom: 50px;
}
</style>

<script>
$(document).ready(function() {
    $('#date-picker').datepicker({
        format: "yyyy-m-dd",
        minViewMode: 0,
        language: "ko",
        autoclose: true
    })

    $('#get-history').on('click', function() {
        const dateArr = $('#date-picker').val().split('-')
        location.href = '/history?year=' + dateArr[0] + '&month=' + dateArr[1]
    })
})
</script>
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
	<hr>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<h2 align="left">시승 예약</h2>
		<form action="reservationResult.do" method="post" name="frm">
			<table class="table table-bordered">
				<tr>
					<th class="form-inline">모델</th>
					<td><select class="form-select">
							<option>1
							<option>2
							<option>3
					</select></td>
				</tr>
				<tr>
					<th class="form-inline">성명&nbsp;*</th>
					<td><input type="text" name="r_name" class="form-control"
						required></td>
				</tr>
				<tr>
					<th class="form-inline">이메일&nbsp;*</th>
					<td><input type="email" name="r_email" class="form-control"
						required></td>
				</tr>
				<tr></tr>
				<tr>
					<th class="form-inline">휴대폰 번호&nbsp;*</th>
					<td>
						<!-- 번호형식 추가예정 --> <input type="text" name="r_tel"
						placeholder="전화번호는 숫자로만 입력해주세요" class="form-control" required>
					</td>
				</tr>
				<tr>
					<th class="form-inline">지역 선택</th>
					<td><select class="form-select" name="country" required>
							<option>서울
							<option>경기
							<option>인천
							<option>대전
							<option>대구
							<option>부산
					</select></td>
				</tr>
				<tr>
					<th class="form-inline">전시장 선택</th>
					<td><select class="form-select" name="center" required>
							<option>1전시장
							<option>2전시장
							<option>3전시장
							<option>4전시장
							<option>5전시장
							<option>6전시장
					</select></td>
				</tr>
				<tr>
					<th class="form-inline">예약 날짜 선택</th>
					<td><select class="form-select" required>
							<option>1
							<option>2
							<option>3
							<option>4
							<option>5
							<option>6
					</select></td>
				</tr>
				<tr>
					<th class="form-inline">예약 날짜 선택</th>
					<td><input type="text" id="date-picker"
						class="form-control bg-white border-0 small" aria-label="Search"
						aria-describedby="basic-addon2" value="|${year}-${month}-${date}|">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						class="btn btn-outline-secondary" class="form-control"></td>
				</tr>
			</table>
		</form>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>