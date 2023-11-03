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
<link rel="stylesheet" href="${path}/resources/css/helpView.css">
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
			<h3 class="h_reply text-center">${id }님의문의사항답변</h3>

			<c:if test="${help.r_content == 'n' }">
				<div class="reply">
					<div class="n_reply">아직 답변이 없습니다</div>
				</div>
			</c:if>

			<c:if test="${help.r_content != 'n' }">
				<div class="reply">
					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">문의제목</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								value="${help.h_title }">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-2 col-form-label">문의내용</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								value="${help.h_content }">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-2 col-form-label">답변</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								value="${help.r_content }">
						</div>
					</div>
				</div>
			</c:if>
		</div>


		<div class="mg" align="center">
			<a href="helpList.do?pageNum=${pageNum}"
				class="btn btn-primary btn-sm">문의내역</a>
		</div>

	</div>
</body>
</html>