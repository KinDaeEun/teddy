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
	<c:if test="${result > 0 }">
		<script>
			alert("시승 예약이 완료되었습니다")
			location.href = "${path}/main/main.do"; // 마이페이지 예약 완료 페이지로 이동 예정
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script>
			alert("시승 예약에 실패하였습니다")
			history.back();
		</script>
	</c:if>
</body>
</html>