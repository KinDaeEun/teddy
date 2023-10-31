<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력</title>
</head>
<body>
	<div>
		<form action="${path }/adminBoard/adminNoticeUpdateResult.do" method="post">
			<input type="hidden" name="id" value="${id }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<input type="hidden" name="nno" value="${notice.nno }">
			<h3>공지사항 작성</h3>
			<div class="container">
				<table class="table">
					<tr>
						<td>제목</td>
						<td><input type="text" name="n_title" 
							required="required" value="${notice.n_title}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><input type="text" name="n_content"
						 required="required"  value="${notice.n_content}"></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							class="btn btn-outline-secondary" value="공지사항 수정"></td>
					</tr>
				</table>
			</div>
		</form>



	</div>
</body>
</html>