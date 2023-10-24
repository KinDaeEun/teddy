<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
</head>
<body>
	<div class="container ">
		<div class="fx pg-tb">
			<div class="p-5 pg_top six-wd ">
				<div class="text-center">
					<h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
					<p class="mb-4">아이디와 이메일을 입력해주세요!</p>
				</div>
				<form class="user" action="${path }/member/findPw.do" method="post">
					<div class="form-group">
						<input type="text" class="form-control form-control-user" id="id"
							aria-describedby="IdHelp" name="id" placeholder="Enter ID....">
					</div>
					<br>
					<div class="form-group">
						<input type="email" class="form-control form-control-user"
							id="email" aria-describedby="emailHelp" name="email"
							placeholder="Enter Email Address...">
					</div>
					<br>
					<div align="center">
						<button type="submit" class="btn btn-dark btn-user btn-block">
							비밀번호 찾기</button>
					</div>
				</form>
				<hr>
				<div align="center">
					<a href="${path }/member/loginForm.do"
						class="btn btn-google btn-user btn-block"> 로그인 </a>
				</div>
				<div class="text-center">
					<a class="btn btn-google btn-user btn-block"
						href="${path}/main/main.do">메인페이지</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>