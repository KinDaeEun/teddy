<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function cancel() {
		alert("취소되었습니다")
		history.back();
	}
</script>
</head>
<body>
	<div class="container text-center">
		<h2 class="text-center"style="margin-bottom: 30px">게시글 수정</h2>
		<form action="${path}/board/boardUpdate.do" method="post">		
		<input type="hidden" name="bno" value="${board.bno }">	
		<input type="hidden" name="b_writer" value="${board.b_writer }">	
			<table class="table">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="b_title" class="form-control" value="${board.b_title }" required>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${board.b_writer }
					</td>
				</tr>			
				<tr>
					<th>내용</th>
					<td>
						<textarea cols="70" rows="10" name="b_content" class="form-control">${board.b_content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정" class="btn btn-outline-secondary btn-sm">
						<a class="btn btn-secondary btn-sm" onclick="cancel()">취소</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>