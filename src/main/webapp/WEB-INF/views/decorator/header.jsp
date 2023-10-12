<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header>
		<div class="banner">
			<div class="lnb">
				<a href="#none">로그인</a> 
				<a href="${path}/member/joinForm.do">회원가입</a> 
				<a href="#none">마이페이지</a>
			</div>
		</div>
		<nav>
			<div class="logo">
				<h1>
					<a href="#none">Teddy</a>
				</h1>
			</div>
			<ul class="gnb">
				<li><a href="#">홈</a></li>
				<li><a href="#ranking">차목록</a></li>
				<li>
					<a href="#">게시판</a>
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">커뮤니티</a></li>
						<li><a href="#">칭찬 알림방</a></li>
					</ul>
				</li>
				<li>
					<a href="#">게시판</a>
					<ul>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">1:1 문의</a></li>
						<li><a href="#">문의 내역</a></li>
					</ul>
				</li>
				<li><a href="#blog">NEWS</a></li>
			</ul>
		</nav>
		<div class="trigger">
			<span></span> <span></span> <span></span>
		</div>
	</header>
</body>
</html>