<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.vi {
	border-bottom: solid 1px gray;
	border-top: solid 1px black;
}

.ta {
	height: 500px;
	width: 100%;
}
</style>
</head>
<body>
	<div align="center">
		<h3>${notice.n_title }</h3>
		<div>${notice.n_date }</div>
		<table class="ta" >
			<tr class="vi">
				<td align="center">${notice.n_content }</td>
			</tr>

		</table>
		<div>
			<a class="btn btn-sm btn-dark"
				href="${path }/board/notice.do?nno=${notice.nno}&pageNum=${pageNum}" style="margin-top: 15px">목록으로</a>
		</div>
	</div>
</body>
</html>