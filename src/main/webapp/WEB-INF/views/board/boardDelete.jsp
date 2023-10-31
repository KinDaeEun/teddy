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
			alert("게시물을 삭제하였습니다")
			location.href = "${path}/board/boardList.do"
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script>
			alert("게시물 삭제에 실패하였습니다")
			history.back();
		</script>
	</c:if>
</body>
</html>