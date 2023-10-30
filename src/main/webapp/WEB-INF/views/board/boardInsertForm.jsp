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
<body>
	<div class="container text-center">
		<h2 class="text-center"style="margin-bottom: 30px">게시글 작성</h2>
		<form action="${path}/board/boardInsert.do" method="post">			
		<input type="hidden" name="id" value="${id }">	
			<table class="table">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="b_title" class="form-control" required>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="b_writer" value="${id }" class="form-control" required>
					</td>
				</tr>			
				<tr>
					<th>내용</th>
					<td>
						<textarea cols="70" rows="10" name="b_content" class="form-control"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인" class="btn btn-outline-secondary">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>