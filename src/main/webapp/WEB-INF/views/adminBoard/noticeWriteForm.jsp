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
	<div class="container text-center">
		<h2 class="text-dark">게시물 작성</h2>
		<form action="${path }/adminBoard/noticeWriteResult.do" method="post"
			name="frm" onsubmit="return chk()">
			<input type="hidden" name="id" value="${id }">
			<table class="table">
				<tr>
					<th>제목</th>
					<td><input type="text" name="n_title" required="required"
						autofocus="autofocus" class="form-control"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="40" class="form-control"
							name="n_content" required="required"></textarea></td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="file" class="form-control"
						required="required"></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center"><input type="submit"
						value="확인" class=" btn btn-dark"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>