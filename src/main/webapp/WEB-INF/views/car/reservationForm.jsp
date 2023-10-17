<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 예약</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/slick/slick.js"></script>
<!-- time / date picker -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<link rel="stylesheet" href="${path}/resources/css/datepicker.css">
<style>
h2 {
	margin-bottom: 50px;
}
</style>

<script>
	$(document).ready(function() {

		$('.datepicker').datepicker({
			format : 'yyyy-mm-dd',
			autoclose : true,
			startDate : '0d'
		});

		$('.cell').click(function() {
			$('.cell').removeClass('select');
			$(this).addClass('select');
		});

	});
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
			<table class="table">
				<tr>
					<th>모델</th>
					<td><select class="form-select" required>
							<option>1
							<option>2
							<option>3
					</select></td>
				</tr>
				<tr>
					<th>성명&nbsp;*</th>
					<td><input type="text" name="r_name" class="form-control"
						required></td>
				</tr>
				<tr>
					<th>이메일&nbsp;*</th>
					<td><input type="email" name="r_email" class="form-control" required>
					</td>
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
					<th>전시장 선택</th>
					<td><select class="form-select" name="center" required>
							<option>1전시장
							<option>2전시장
							<option>3전시장
							<option>4전시장
							<option>5전시장
							<option>6전시장
					</select></td>
				</tr>
				</table>
				<details>
					<summary style="font-weight:bold">예약 날짜 선택</summary>
					<br>	
					<br>	
					<br>	
				<!-- picker 시작 -->
						<div class="row justify-content-center mx-0">
							<div class="col-lg-10">
								<div class="card border-0">
									<form autocomplete="off">
										<div class="card-header bg-dark">
											<div
												class="mx-0 mb-0 row justify-content-sm-center justify-content-start px-1">
												<input type="text" id="dp1" class="datepicker"
													placeholder="날짜 선택하기" name="r_date" readonly required>
											</div>
										</div>
										<div class="card-body p-3 p-sm-5">
											<div class="row text-center mx-0">
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">9:00AM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">9:30AM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">9:45AM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">10:00AM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">10:30AM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">10:45AM</div>
												</div>
											</div>
											<div class="row text-center mx-0">
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">11:00AM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">11:30AM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">11:45AM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">12:00PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">12:30PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">12:45PM</div>
												</div>
											</div>
											<div class="row text-center mx-0">
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">1:00PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">1:30PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">1:45PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">2:00PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">2:30PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">2:45PM</div>
												</div>
											</div>
											<div class="row text-center mx-0">
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">3:00PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">3:30PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">4:15PM</div>
												</div>
												<div class="col-md-2 col-4 my-1 px-2">
													<div class="cell py-1">5:00PM</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
				</details>
				<!-- picker 끝 -->
				<div style="align-content: center">
					<div align="center">
						<input type="submit" value="예약하기" class="btn btn-outline-dark">
					</div>
				</div>
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