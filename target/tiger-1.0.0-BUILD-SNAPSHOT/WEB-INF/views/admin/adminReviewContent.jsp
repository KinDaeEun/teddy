<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mb {
	margin-bottom: 100px;
}

.top {
	padding-top: 200px;
	padding-bottom: 50px;
}

.btn-top {
	margin-top: 5px;
	
}



</style>
<body>
<div class="container " align="center">
		<div class="inner join-inner mb">
			<h2 class="text-dark top">상세내용</h2>
				<table class="table table-bordered">
					<tr>
						<th>번호</th>
						<td>${review.re_no }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${review.id }</td>
					</tr>
					<tr>
						<th>점수</th>
						<td>${review.rating }</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${review.re_date }</td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="5" name="c_content" class="form-control" readonly="readonly">${review.re_content }</textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="button" onclick="history.back();" class="btn btn-outline-dark">돌아가기</button>
							</td>
					</tr>

				</table>

		</div>
	</div>
</body>
</html>