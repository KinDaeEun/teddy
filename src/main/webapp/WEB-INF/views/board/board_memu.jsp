<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr a {
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
			<td class="bc"><a class="text-dark"
				href="${path }/board/notice.do">공지사항</a></td>
		</tr>
		<tr class="text-center">
			<td class="bc"><a class="text-dark"
				href="${path }/board/updateForm.do">커뮤니티</a></td>
		</tr>
		<tr class="text-center">
			<td class="bc"><a class="text-dark"
				href="${path }/board/reservationList.do">칭찬 알림방</a></td>
		</tr>
	</table>
</body>
</html>