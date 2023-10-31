<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 조회</title>
</head>
<body>
	<div class="container pg_top fx ">
		<div class="jumbotron six-wd bd pg-tb">
			<div align="center">
				<h2>아이디 목록</h2>
				<br />
				<ul>
					<c:forEach items="${member}" var="member">
						<li>${member.id}</li>
						<br />
					</c:forEach>
				</ul>
				<a href="${path}/member/loginForm.do" class="btn btn-dark">로그인페이지</a>
				<a href="${path}/main/main.do" class="btn btn-dark">메인페이지</a>
			</div>
		</div>
	</div>
</body>
</html>