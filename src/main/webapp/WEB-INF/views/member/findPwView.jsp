<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
</head>
<body>
	<div class="p-5">
		<div class="text-center">
			<h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
			<p class="mb-4">아이디와 이메일을 입력해주세요!</p>
		</div>
		<form class="user" action="${path }/member/findPw.do" method="post">
			<div class="form-group">
				<input type="text" class="form-control form-control-user" id="id"
					aria-describedby="IdHelp" name="id" placeholder="Enter ID....">
			</div>
			<div class="form-group">
				<input type="email" class="form-control form-control-user"
					id="email" aria-describedby="emailHelp" name="email"
					placeholder="Enter Email Address...">
			</div>

			<button type="submit" class="btn btn-primary btn-user btn-block">
				비밀번호 찾기</button>
		</form>
		<hr>
		<a href="${path }/member/loginForm.do"
			class="btn btn-google btn-user btn-block"> 로그인 </a>
		<hr>
		<div class="text-center">
			<a class="small" href="${path}/main/main.do">메인페이지</a>
		</div>
	</div>
</body>
</html>