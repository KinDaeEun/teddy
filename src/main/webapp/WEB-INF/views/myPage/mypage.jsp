<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section>
		<div class="container text-center ">
			<div>
				<h3 class="mb">마이 페이지</h3>
			</div>

			<div class="myinfo-wrap">

				<img alt="" src="${path}/resources/upload/${member.fileName}"
					class="wd">
				<table class="table">
					<tr>
						<th class="bg-light">아이디</th>
						<td>${member.id}</td>
					</tr>
					<tr>
						<th class="bg-light">이름</th>
						<td>${member.name}</td>
					</tr>
					<tr>
						<th class="bg-light">이메일</th>
						<td>${member.email}</td>
					</tr>
					<tr>
						<th class="bg-light">등록일</th>
						<td>${member.regdate}</td>
					</tr>
				</table>

				<a class="btn btn-dark" href="${path}/main/main.do">메인</a>
			</div>
		</div>
	</section>
</body>
</html>