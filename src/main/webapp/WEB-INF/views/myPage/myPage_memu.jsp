<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	tr a{
		font-size: 18px;
	}
	tr .bc:hover {
		background-color: #add8e6;
		transition: 0.4s;
	}
	.mg {
	 margin-top: 200px;
	}
</style>
</head>
<body>
	<table class="table">
		<tr class="text-center">
			<td class="bc"><a class="text-dark" href="${path }/myPage/mypage.do">홈</a></td>
		</tr>
		<tr class="text-center">
			<td class="bc"><a class="text-dark" href="${path }/myPage/updateForm.do">내 정보 수정</a></td>
		</tr>
		<tr class="text-center">
			<td class="bc"><a class="text-dark" href="${path }/myPage/reservationList.do">시승예약확인</a></td>
		</tr>
		<tr class="text-center">
			<td class="bc"><a class="text-dark" href="${path }/help/helpList.do">1:1 문의내역</a></td>
		</tr>
	</table>
</body>
</html>