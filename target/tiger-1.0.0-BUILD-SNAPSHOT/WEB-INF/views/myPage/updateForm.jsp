<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.join-inner{
	height: 100vh;
}
.top{
	padding-bottom: 50px;
}
.btn-top {
	margin-top:5px;
}
</style>
<script type="text/javascript">
function chk() {
	if (frm.password.value != frm.password2.value) {
		alert("암호가 확인과 다릅니다");
		frm.password.focus();
		frm.password.value = "";
		frm.password2.value = "";
		return false;
	}
}
</script>
</head>
<body>
	<div class="container " align="center">
		<div class="join-inner">
			<h2 class="text-dark top">회원정보 수정</h2>
			<form action="${path }/member/update.do" method="post" enctype="multipart/form-data"
				name="frm" onsubmit="return chk()">
				<input type="hidden" name="id" value="${member.id }">
				<table class="table table-bordered">
					<tr>
						<th>아이디</th>
						<td>${member.id}</td>
					</tr>
					<tr>
						<th>암호</th>
						<td><input type="password" name="password"
							 class="form-control" required="required"></td>
					</tr>
					<tr>
						<th>암호확인</th>
						<td><input type="password" name="password2"
							 class="form-control" required="required"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" required="required"
							class="form-control" value="${member.name }"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email" required="required"
							class="form-control" value="${member.email }"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><input type="radio" name="gender" id="mal" value="남자"
							checked="checked"> <label for="mal">남자</label> <input
							type="radio" name="gender" id="mal" value="여자"> <label
							for="fem">여자</label></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input type="file" name="file" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="수정" class="btn btn-dark"></td>
					</tr>
				</table>
			</form>
			<a href="${path }/main/main.do" class="btn btn-dark">메인</a>
			<a href="${path }/member/delete.do" class="btn btn-dark">삭제</a>
		</div>
	</div>
</body>
</html>