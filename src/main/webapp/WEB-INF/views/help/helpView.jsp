<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summernote -->

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style type="text/css">
h3 {
	text-align: center;
}

.table {
	border: 1px solid black;
}

.join-inner {
	height: 100vh;
}

.top {
	padding-top: 200px;
}

.h_img {
	width: 300px;
	height: 300px;
	float: left;
}

.h_title {
	
	text-align: center;
}
.veiw_fx{
display: flex; 
justify-content: space-between;
text-align: right;
}
.mg {
	margin: 100px 0;
}
.mr {
	margin-right: 30px;
	color: gray;
}
</style>

</head>

<body>
	<div class="container top" align="center">
		<div class="inner join-inner table">
			    <div class="veiw_fx mg">
			    <div></div>
				<h3 class="h_title">${id }님의문의사항</h3>
				<a href="${path }/help/helpUpdateForm.do?hno=${help.hno}&pageNum=${pageNum }"
				class="mr">수정하기</a>
				<a href="${path }/help/helpDelet.do?hno=${help.hno}&pageNum=${pageNum }"
				class="mr">삭제하기</a>
				</div>
					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								value="${help.h_title }">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								value="${help.h_content }">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-2 col-form-label">사진</label>
						<div class="col-sm-10">
							<img src="${path}/resources/upload/${help.h_fileName}"
								class="h_img" alt="...">
						</div>
					</div>

				</div>

				<div class="mg" align="center">
					<a href="helpList.do?pageNum=${pageNum}" class="btn btn-primary">문의
						내역</a>
				</div>
			</div>
</body>
</html>