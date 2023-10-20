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
	<script type="text/javascript">
		var msg = "${msg}";

		if (msg != "") {
			alert(msg);
		}
	</script>
	<div class="container">
		<div class="text-center">
			<h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>
			<p class="mb-4">이메일을 입력해주세요!</p>
		</div>
		<form class="user" action="${path }/member/findId.do" method="post">
			<div class="form-group">
				<input type="email" class="form-control form-control-user"
					id="email" aria-describedby="emailHelp" name="email"
					placeholder="Enter Email Address...">
			</div>
			<input type="submit" class="btn btn-primary btn-user btn-block"
				value="아이디 찾기">
		</form>
		<hr>
		<div align="center">
			<a href="${path}/member/login.do" class="btn btn-sm btn-dark"> 로그인
			</a>
			<hr>
			<div class="text-center">
				<a class="small" href="${path}/main/main.do">메인페이지</a>
			</div>
		</div>
	</div>
</body>
</html>