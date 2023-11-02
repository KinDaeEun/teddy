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

.side {
	width: 150px;
}
</style>
</head>
<body>
	<div class="side">
		<div class="bc">
			<a class="text-dark text-center" href="${path }/adminBoard/adminNotice.do">공지사항</a>
		</div>
		<div class="bc">
			<a class="text-dark text-center" href="${path }/adminBoard/adminBoardList.do">커뮤니티</a>
		</div>
		<div class="bc">
			<a class="text-dark text-center"
				href="${path }/adminBoard/adminComplimentMain.do?id=${id}">칭찬 알림방</a>
		</div>
	</div>
</body>
</html>