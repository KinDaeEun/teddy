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

.veiw_fx {
	display: flex;
	justify-content: space-between;
	text-align: right;
}



.h_t {
	height: auto;
	overflow: hidden;
	background-color: #FFFFF0;
	border-radius: 50px 50px 0px 0px;
}

.mr {
	margin-right: 30px;
	color: gray;
}

.h_view {
	width: 800px;
	height: auto;
	border-radius: 50px;
}

.boxx {
	background-color: #E0FFFF;
	height: auto;
	overflow: hidden;
	border-radius: 0px 0px 50px 50px;
}
</style>

</head>

<body>
	<div class="container top" align="center">
		<div class="inner join-inner h_view">
			<div class="veiw_fx mg h_t">
				<div></div>
				<h3 class="h_title">${id }님의문의사항</h3>
				<%-- 				<a href="${path }/help/helpUpdateForm.do?hno=${help.hno}&pageNum=${pageNum }" class="mr">수정하기</a>  --%>
				<a
					href="${path }/help/helpDelete.do?hno=${help.hno}&pageNum=${pageNum }"
					class="mr">삭제하기</a>
			</div>
			<div class="boxx">
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

				<c:if test="${help.h_fileName != null }">
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-2 col-form-label">사진</label>
						<div class="col-sm-10">
							<img src="${path}/resources/upload/${help.h_fileName}"
								class="h_img" alt="...">
						</div>
					</div>
				</c:if>

				<c:if test="${help.h_fileName == null }">
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-2 col-form-label">사진</label>
					</div>
				</c:if>
			</div>
		</div>
		<div>
			<h3>답변</h3>
			<c:if test="${help.r_content == 'n' }">아직 답변이 없습니다</c:if>
			<c:if test="${help.r_content != 'n' }">${help.r_content }</c:if>
		</div>


		<div class="mg" align="center">
			<a href="helpList.do?pageNum=${pageNum}" class="btn btn-primary">문의내역</a>
		</div>

	</div>
</body>
</html>