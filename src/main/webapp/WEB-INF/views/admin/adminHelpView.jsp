<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summernote -->

<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> -->
<link rel="stylesheet" href="${path}/resources/css/adminHelpView.css">
</head>

<body>
	<div class="container top" align="center">

		<div class="inner join-inner">
			<div class="table">
				<c:if test="${help.h_del == 'y' }">
					<h3 class="h_title_y">${help.id }님의문의사항</h3>
				</c:if>
				<div class="veiw_fx mg">
					<div></div>
					<c:if test="${help.h_del == 'n' }">
						<h3 class="h_title">${help.id }님의문의사항</h3>
						<a
							href="${path }/admin/adminHelpInsertForm.do?hno=${help.hno}&pageNum=${pageNum }"
							class="mr">답변하기</a>
						<a
							href="${path }/admin/adminHelpDelete.do?hno=${help.hno}&pageNum=${pageNum }"
							class="mr">삭제하기</a>
					</c:if>
				</div>
				<div class="width">
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
			<!-- 문의사항 end -->
			<div class="reply_di">
				<div>
					<h3 class="reply_head">답변</h3>

					<c:if test="${help.r_content == 'n' }"></c:if>

					<c:if test="${help.r_content != 'n' }">
						<div class="width">${help.r_content }</div>
					</c:if>
				</div>
				<div class="mg" align="center">
					<a href="adminHelpList.do?pageNum=${pageNum}"
						class="btn btn-primary btn-sm">문의내역</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>