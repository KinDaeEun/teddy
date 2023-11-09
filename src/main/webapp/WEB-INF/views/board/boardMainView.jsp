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
				<td>${board.b_content }</td>
							
			</tr>
		</table>
	</div>
</body>
</html>