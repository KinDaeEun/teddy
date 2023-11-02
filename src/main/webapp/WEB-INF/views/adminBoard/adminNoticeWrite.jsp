<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력</title>
<link rel="stylesheet" href="${path}/resources/css/adminNotice.css">
</head>
<body>
	<div>
		<form action="${path }/adminBoard/adminNoticeResult.do" method="post">
			<input type="hidden" name="id" value="${id }">
			<h3>공지사항 작성</h3>
			<div class="container">
				<table class="table">
					<tr>
						<td>제목</td>
						<td><input type="text" name="n_title" placeholder="제목을 입력하세요"
							required="required"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><input type="text" name="n_content"
							placeholder="내용을 입력하세요" required="required"></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							class="btn btn-outline-secondary" value="공지사항 등록"></td>
					</tr>
				</table>
			</div>
		</form>



	</div>
</body>
</html>