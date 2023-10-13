<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 예약</title>
</head>
<body>
	<div class="container">
		<h2>시승 예약</h2>
		<form action="reservationResult.do" method="post" name="frm">
			<table class="table table-bordered">
				<tr>
					<th>모델</th>
					<td>
						<input type="text">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>