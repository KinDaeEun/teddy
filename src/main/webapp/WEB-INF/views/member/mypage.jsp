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
	<div class="container text-center">
		<h2 class="text-primary">회원 정보 상세</h2>
		<table class="table table-striped">
			<tr>
				<th class="bg-info">아이디</th>
				<td>${member.id}</td>
			</tr>
			<tr>
				<th class="bg-default">이름</th>
				<td>${member.name}</td>
			</tr>
			<tr>
				<th class="bg-success">이메일</th>
				<td>${member.email}</td>
			</tr>
			<tr>
				<th class="bg-success">등록일</th>
				<td>${member.regdate}</td>
			</tr>
			<tr>
				<th class="bg-success">사진</th>
				<td><img alt=""
					src="${path}/resources/upload/${member.fileName}" class="rounded img-thumbnail">
			</tr>
		</table>
		<a class="btn btn-success" href="${path }main/main.do">메인</a>
	</div>
</body>
</html>