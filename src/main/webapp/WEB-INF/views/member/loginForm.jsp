<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script type="text/javascript">
	$(function() {
		let id = $('#id');
		let password = $('#password');
		let btn = $('#btn');
		$(btn).on('click', function() {
			if ($(id).val() == "") {
				$(id).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			} else if ($(password).val() == "") {
				$(password).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
		});
	});
</script>
</head>
<body>
	<section class="login-form">
		<div class="login-form_inner">
			<h1>로그인</h1>
			<form action="${path}/member/login.do">
				<div class="int-area">
					<input type="text" name="id" id="id" autocomplete="off"
						required="required"> <label for="id">아이디</label>
				</div>
				<div class="int-area">
					<input type="password" name="password" id="password"
						autocomplete="off" required="required"> <label
						for="password">암호</label>
				</div>
				<div class="btn-area">
					<button id="btn" type="submit">로그인</button>
				</div>
			</form>
			<div class="caption">
				<a href="${path}/member/joinForm.do">회원가입</a>
				<br>
				<a href="${path}/member/findIdView.do">아이디 찾기</a> 
				<br>
				<a href="${path}/member/findPwView.do">비밀번호 찾기</a>
			</div>
		</div>
	</section>
</body>
</html>