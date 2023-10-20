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
	<div class="container">
		<div class="jumbotron">
			<h2>아이디는 :</h2>
			<br />
			<ul>
				<c:forEach items="${member}" var="member">
					<li>${member.id}</li>
					<br />
				</c:forEach>
			</ul>
			<h2>입니다</h2>
			<a href="${path}/member/findId.do" class="btn btn-primary">로그인페이지</a>
			<a href="${path}/main/main.do" class="btn btn-primary">메인페이지</a>
		</div>
	</div>
</body>
</html>