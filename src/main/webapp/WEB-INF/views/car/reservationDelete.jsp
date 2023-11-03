<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script>
			alert("시승 예약이 취소되었습니다")
			location.href="${path}/myPage/reservationList.do"
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script>
			alert("예약 취소에 실패하였습니다")
			history.back();
		</script>
	</c:if>
</body>
</html>