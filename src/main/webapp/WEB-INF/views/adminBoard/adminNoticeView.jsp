<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/adminNoticeView.css">
<script>
	function del() {
		let cf = confirm("공지사항을 삭제하시겠습니까 ?")
		if (cf)
			location.href = "${path }/adminBoard/adminNoticeDelete.do?nno=${notice.nno}&pageNum=${pageNum}"
		else
			alert("삭제가 취소되었습니다")
	}
</script>
</head>
<body>
	<div align="center">
		<h3>${notice.n_title }</h3>
		<div>${notice.n_date }</div>
		<table class="ta">
			<tr class="vi">
				<td align="center"><pre>${notice.n_content }</pre></td>
			</tr>

		</table>
		<div>
			<a class="btn btn-sm btn-dark"
				href="${path }/adminBoard/adminNoticeUpdateForm.do?nno=${notice.nno}&pageNum=${pageNum}">수정</a>
			<button class="btn btn-sm btn-dark" onclick="del()">삭제</button>
		</div>
	</div>
</body>
</html>