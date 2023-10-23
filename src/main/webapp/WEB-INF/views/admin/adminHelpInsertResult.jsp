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
			alert("1:1문의 답변 등록하였습니다")
			location.href = "${path}/admin/adminHelpList.do?pageNum=${pageNum}&id=${id}";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("답변 실패")
			history.go(-1);
		</script>
	</c:if>

</body>
</html>