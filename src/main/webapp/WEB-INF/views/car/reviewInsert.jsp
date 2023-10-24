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
		<script type="text/javascript">
			alert("리뷰 등록이 완료되었습니다")
			location.href = "${path}/car/carView.do?cno=${cno}";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("리뷰 등록에 실패하였습니다")
			history.go(-1);
		</script>
	</c:if>
</body>
</html>