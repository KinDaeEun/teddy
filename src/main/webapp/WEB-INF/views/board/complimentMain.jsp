<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pn_title {
	background-color: #f8f8f8;
	border-bottom: solid 1px #dadbdc;
	border-top: solid 1px #dadbdc;
}

.info {
	color: #697278;
	padding-left: 10px;
	line-height: 1.75;
	list-style: inside;
	margin-top: 20px;
}

.pn_info {
	width: 80%;
	margin-bottom: 8px;
	text-align: left;
}

.pn_button {
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#compil').load('${path}/board/complimentList.do');
	});
</script>

</head>
<body>
	<div>
		<h1 align="center">칭찬 알림방</h1>
		<p class="description" align="center">고객님의 소중한 칭찬이 큰 힘이 됩니다.</p>
		<div align="center" class="pn_title">
			<ul class="info">
				<li class="pn_info">고객님께서 남겨주신 소중한 칭찬 글은 접수 후 순차적으로 게시됨에 따라 게시가
					다소 지연될 수 있으며, 본 알림방의 성격과 맞지 않는 글 또는 개인정보가 포함된 글은 임의 삭제하오니 양해 바랍니다.</li>
				<li class="pn_info">칭찬해 주신 내용은 마이 페이지 내 칭찬 알림방과 이메일을 통하여 확인하실 수
					있습니다.</li>
			</ul>
		</div>

		<div>
			<form action="${path }/board/complimentResult.do" method="post">
				<input type="hidden" name="id" value="${member.id }">
				<table>
					<tr>
						<th>이름</th>
						<td>${member.name }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.email }</td>
					</tr>
				</table>
				<div>
					<input type="text" name="cp_content" placeholder="내용을 입력해 주세요.">
					<input type="submit" value="칭찬등록">
				</div>
			</form>
		</div>
		<!-- 		<div> -->
		<!-- 		<table> -->
		<%-- 		<c:if test="${empty list}"> --%>
		<!-- 				<tr> -->
		<!-- 					<td colspan="2" class="text-center">칭찬내역이 존재하지 않습니다</td> -->
		<!-- 				</tr> -->
		<%-- 			</c:if> --%>
		<%-- 		<c:if test="${not empty list }"> --%>
		<%-- 				<c:forEach var="compliment" items="${list }"> --%>
		<!-- 					<tr> -->
		<%-- 					<td class="text-center">${member.fileName}</td> --%>
		<%-- 						<td class="text-center">${compliment.content}</td> --%>
		<%-- 						<td class="text-center">${help.cp_date }</td> --%>
		<!-- 					</tr> -->
		<%-- 				</c:forEach> --%>
		<%-- 			</c:if> --%>
		<!---->
		<!-- 		</div> -->
		<div id="compil"></div>
	</div>
</body>
</html>