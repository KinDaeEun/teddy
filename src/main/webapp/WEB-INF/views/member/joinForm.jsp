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
	height: 1000px;
}
.top{
	padding-top: 250px;
}
</style>
<script type="text/javascript">
function idChk() {
	if (!frm.id.value){
		alert("아이디 입력한 후에 체크 하시오");
		frm.id.focus();
		return false;
	}
	$.post("/teddy/member/idChk.do","id="+frm.id.value, function(data){
		$('#idChk1').html(data);
	})
}
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
		<div class="inner join-inner">
			<h2 class="text-light top">회원가입</h2>
			<form action="${path }/member/join.do" method="post" enctype="multipart/form-data"
				name="frm" onsubmit="return chk()">
				<table class="table table-bordered">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" required="required"
							class="form-control" autofocus="autofocus"> <input
							type="button" class="btn btn-dark btn-sm" onclick="idChk()"
							value="중복체크">
							<div id="idChk1" class="err"></div></td>
					</tr>
					<tr>
						<th>암호</th>
						<td><input type="password" name="password"
							required="required" class="form-control"></td>
					</tr>
					<tr>
						<th>암호확인</th>
						<td><input type="password" name="password2"
							required="required" class="form-control"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email" required="required"
							class="form-control"></td>
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
						<td><input type="file" name="file" class="form-control"
							required="required"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="회원가입" class="btn btn-dark"></td>
					</tr>
				</table>
			</form>
			<a href="${path }/member/loginForm.do" class="btn btn-dark">로그인</a>
		</div>
	</div>
</body>
</html>