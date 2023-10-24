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
	<div class="container pg_top fx ">
		<div class="jumbotron six-wd bd pg-tb">
			<div align="center">
				<h3>임시 비밀번호가 전송되었습니다.</h3>
					<br />
					<h5>${member}</h5>
					<br />
				<a href="${path}/member/loginForm.do" class="btn btn-dark">로그인페이지</a>
				<a href="${path}/main/main.do" class="btn btn-dark">메인페이지</a>
			</div>
		</div>
	</div>
</body>
</html>