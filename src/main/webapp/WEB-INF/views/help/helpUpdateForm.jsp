<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style type="text/css">
h3 {
	text-align: center;
	margin-bottom: 50px;
}
/* .h_wrier{
   border: 1px solid black;
   border-radius: 5px;
} */
</style>

</head>
<body>
	<form action="${path}/help/helpUpdateResult.do" method="post"
		enctype="multipart/form-data">
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <input type="hidden"
			name="id" value="${id }"> <input type="hidden" name="hno"
			value="${help.hno }"> <input type="hidden" name="pageNum"
			value="${pageNum }">
		<h3>${id }님의&nbsp;1:1문의수정</h3>
		<div class="container">
			<input class="form-control" list="datalistOptions"
				id="exampleDataList" name="h_title" value="${help.h_title }"
				required="required">
			<datalist id="datalistOptions">
			</datalist>
			<textarea class="summernote" name="h_content">${help.h_content }</textarea>
			<div class="input-group">
				<input type="file" class="form-control" id="inputGroupFile04"
					aria-describedby="inputGroupFileAddon04" aria-label="Upload"
					name="file">
			</div>
		</div>

		<script>
			$('.summernote')
					.summernote(
							{
								callbacks : {
									onPaste : function(e) {
										// 텍스트를 붙여넣을 때 <p></p> 태그를 제거
										var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData)
												.getData('Text');
										e.preventDefault();
										document.execCommand('insertText',
												false, bufferText);
									},
									onInit : function() {
										// 에디터 초기화 시 <p></p> 태그 제거
										var content = $('.summernote')
												.summernote('code');
										$('.summernote').summernote(
												'code',
												content.replace(
														/<p><br><\/p>/g, ''));
									}
								},
								// 다른 설정 옵션들...
								placeholder : '내용을 입력해주세요',
								tabsize : 2,
								height : 400,
								toolbar : [
										[ 'style', [ 'style' ] ],
										[
												'font',
												[ 'bold', 'underline', 'clear' ] ],
										[ 'color', [ 'color' ] ],
										[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
										[ 'table', [ 'table' ] ],
										[ 'insert',
												[ 'link', 'picture', 'video' ] ],
										[
												'view',
												[ 'fullscreen', 'codeview',
														'help' ] ] ]
							});
		</script>

		<div align="center" style="margin-top: 50px">
			<input type="submit" class="btn btn-outline-secondary" value="수정하기">
		</div>
	</form>
</body>
</html>