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
	<div class="container pg_top v_h">
		<form action="${path}/admin/newsInsertResult.do" method="post"
			enctype="multipart/form-data">
			<h2 style="margin-bottom: 30px">뉴스 등록</h2>
			<table class="table table-bordered">
				<tr>
					<th>뉴스 제목</th>
					<td><input type="text" name="n_title" class="form-control"
						required></td>
				</tr>
				<tr>
					<th>뉴스 작성자</th>
					<td><input type="text" name="n_writer" class="form-control"
						required></td>
				</tr>
				<tr>
					<th>뉴스 내용</th>
					<td><textarea rows=10 class="form-control" name="n_content"></textarea>
					</td>
				</tr>
				<tr>
					<th>표지 사진</th>
					<td><input type="file" name="n_cover_img_file" class="form-control"
						required></td>
				</tr>
				<tr>
					<th>첨부 사진</th>
					<td><input type="file" name="n_img_file" class="form-control"
						required></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="작성"
						class="btn btn-outline-secondary"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>