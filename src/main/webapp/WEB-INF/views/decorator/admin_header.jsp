<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header>
		<div class="banner">
			<c:if test="${id == null}">
				<div class="lnb">
					<a href="${path}/member/loginForm.do">로그인</a> 
					<a href="${path}/member/joinForm.do">회원가입</a>
				</div>
			</c:if>
			<c:if test="${id != null }">
				<div class="lnb">
					<a href="logout.do">로그아웃</a>
					<c:if test="${id == 'admin'}">
						<a href="${path}/main/main.do">메인</a>
					</c:if>
				</div>
			</c:if>
		</div>
		<nav id="w-nav">
			<div class="logo">
				<h1>
					<a href="${path}/main/main.do">Teddy</a>
				</h1>
			</div>
			<ul id="gnb">
				<li><a href="">홈</a></li>
				<li><a href="${path}/admin/adminCar.do">차량관리</a></li>
				<li><a href="${path}/admin/adminMemberList.do">회원관리</a></li>
				<li><a href="">시승예약관리</a>
				<li><a href="">게시판관리</a>
				<li><a href="${path}/admin/adminHelpList.do">1:1문의관리</a></li>
			</ul>
		</nav>
		<nav id="m-nav">
			<div class="logo">
				<h1>
					<a href="${path}/main/main.do">Teddy</a>
				</h1>
			</div>
			<ul class="gnb">
				<li><a href="${path}/main/main.do">홈</a></li>
				<li class="gnb-li"><a href="${path}/car/carForm.do">차목록</a>
					<ul class="sub">
						<li><a href="${path}/car/reservationForm.do">시승 예약</a></li>
						<li><a href="${path}/car/findCenter.do">전시장 찾기</a></li>
					</ul></li>


				<li class="gnb-li"><a href="${path}/board/notice.do">게시판</a>
					<ul class="sub">
						<li><a href="">공지사항</a></li>
						<li><a href="">커뮤니티</a></li>
						<li><a href="">칭찬 알림방</a></li>
					</ul></li>

				<li class="gnb-li"><a href="${path}/help/faqList.do">고객센터</a>
					<ul class="sub">
						<li><a href="${path}/help/faqList.do">FAQ</a></li>
						<li><a href="${path}/help/helpInsertForm.do">1:1 문의</a></li>
						<li><a href="${path}/help/helpList.do?id">문의 내역</a></li>
					</ul></li>
				<li><a href="${path}/news/newsList.do">NEWS</a></li>
			</ul>
		</nav>
		<div class="trigger">
			<span></span><span></span><span></span>
		</div>
	</header>
</body>
</html>