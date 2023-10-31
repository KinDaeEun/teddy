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
	<script type="text/javascript">
		alert("공지사항이 동록되었습니다")
		location.href="${path}/adminBoard/adminNotice.do?id";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("등록 실패")
		history.go(-1);
	</script>
</c:if>
</body>
</html>