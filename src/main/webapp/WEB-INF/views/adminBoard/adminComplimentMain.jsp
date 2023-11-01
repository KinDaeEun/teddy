<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function del(cpno) {
		let cf = confirm("칭찬을 삭제하시겠습니까 ?")
		if (cf)
			location.href="${path }/adminBoard/adminComplimentDelete.do?cpno="+cpno;
		else
			alert("삭제가 취소되었습니다")
	}
</script>
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
			<table class="table">
				<tr>
					<td class="text-center">아이디</td>
					<td class="text-center">칭찬내용</td>
					<td class="text-center">등록일</td>
					<td class="text-center">삭제</td>
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4" class="text-center">칭찬내역이 존재하지 않습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="compliment" items="${list }">
						<tr>

								<td class="text-center">${compliment.id }</td>
								<td class="text-center">${compliment.cp_content }</td>
								<td class="text-center">${compliment.cp_date }</td>
								<td><a class="btn btn-sm btn-dark" onclick="del(${compliment.cpno})">삭제</a></td>

						</tr>
					</c:forEach>
				</c:if>
			</table>
			<!-- paging -->
			<div>
				<ul class="pagination pagination-sm justify-content-center">
					<%-- 								<li>${pb}</li>  --%>
					<%-- 				<li>${pageNum }</li> --%>
					<c:if test="${pb.startPage > pb.pagePerBlock}">
						<li class="page-item"><a class="page-link"
							href="${path }/adminBoard/adminComplimentMain.do?pageNum=1">
								<i>맨 앞으로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="${path }/adminBoard/adminComplimentMain.do?pageNum=${pb.startPage-1}">
								<i>앞으로</i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
						<c:if test="${pb.currentPage == i }">
							<li class="page-item active"><a class="page-link"
								href="${path }/adminBoard/adminComplimentMain.do?pageNum=${i}">${i }</a></li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="page-item"><a class="page-link"
								href="${path }/adminBoard/adminComplimentMain.do?pageNum=${i}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage}">
						<li class="page-item"><a class="page-link"
							href="${path }/adminBoard/adminComplimentMain.do?pageNum=${pb.endPage+1}">
								<i>뒤로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="${path }/adminBoard/adminComplimentMain.do?pageNum=${pb.totalPage}">
								<i>맨뒤로</i>
						</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<!-- 	</div> -->
</body>
</html>