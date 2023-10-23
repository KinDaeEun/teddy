<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style type="text/css">
h3 {
	text-align: center;
	margin-bottom: 50px;
}

.table {
	align-content: center;
}
/* .h_wrier{
   border: 1px solid black;
   border-radius: 5px;
} */
</style>

</head>
<body>
	<form action="${path}/admin/adminHelpInsertResult.do" method="post"
		enctype="multipart/form-data">

		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <input type="hidden"
			name="id" value="${id }"> <input type="hidden" name="hno"
			value="${help.hno }"> <input type="hidden" name="pageNum"
			value="${pageNum }">
		<h3>${help.id }님의&nbsp;1:1문의</h3>

		<div class="mb-3 inner" >
			<textarea class="form-control" name="r_content" id="exampleFormControlTextarea1"
				rows="3"></textarea>
		</div>
		<div align="center" style="margin-top: 50px">
			<input type="submit" class="btn btn-outline-secondary" value="답변하기">
		</div>
	</form>
</body>
</html>