<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function del() {
		let cf = confirm("게시글을 삭제하시겠습니까 ?")
		if(cf) location.href="${path}/board/boardDelete.do?bno=${board.bno}"
		else alert("삭제가 취소되었습니다")
	}
</script>
</head>
<body>
	<div class="container">
		<table class="table tableb"  style="margin-top: 70px">
			<tr>
				<th>제목</th>
				<td>${board.b_title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.b_writer }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${board.b_cnt }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${board.b_date }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2"><textarea rows="5"
							class="form-control" readonly="readonly">${board.b_content }</textarea>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<a href="${path }/board/boardUpdateForm.do?bno=${board.bno}" class="btn btn-outline-secondary btn-sm">수정</a> 
					<button onclick="del()" class="btn btn-secondary btn-sm">삭제</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>