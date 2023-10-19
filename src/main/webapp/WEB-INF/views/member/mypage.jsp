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

	<section class="mypage-form">
		<div class="container text-center ">
			<div>
				<h3 class="mb">마이 페이지</h3>
			</div>
			<table class="table">
				<tr>
					<th class="bg-light">프로필</th>
					<th class="bg-light">아이디</th>
					<th class="bg-light">이름</th>
					<th class="bg-light">이메일</th>
					<th class="bg-light">등록일</th>
				</tr>
				<tr>
					<td><img alt=""
						src="${path}/resources/upload/${member.fileName}" class="wd"></td>
					<td>${member.id}</td>
					<td>${member.name}</td>
					<td>${member.email}</td>
					<td>${member.regdate}</td>
				</tr>
			</table>
			<div class="myinfo-wrap">
				<div class="quart-box">
					<div class="quart-description">
						<span>내 정보 수정</span>
					</div>
					<div class="more-btn">
						<a href="${path}/member/updateForm.do" class="win_point">바로가기 &gt;</a>
					</div>
				</div>
				<div class="quart-box">
					<div class="quart-description">
						<span>시승 예약</span>
					</div>
					<div class="more-btn">
						<a href="${path }/car/reservationList.do"
							class="win_point">바로가기&gt;</a>
					</div>
				</div>
				<div class="quart-box">
					<div class="quart-description">
						<span>리뷰</span>
					</div>
					<div class="more-btn">
						<a href="" class="win_point">바로가기 &gt;</a>
					</div>
				</div>
				<div class="quart-box">
					<div class="quart-description">
						<span>문의 내역</span>
					</div>
					<div class="more-btn">
						<a href="">바로가기 &gt;</a>
					</div>
				</div>
			</div>



			<a class="btn btn-dark" href="${path}/main/main.do">메인</a>
		</div>
	</section>
</body>
</html>