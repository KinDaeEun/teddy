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
<!-- <script type="text/javascript"> -->
<!-- 	$(function() { -->
<!-- 		$('#rInsert').click(function() { -->
<!-- 			let sendData = $('#frm1').serialize(); -->
<%-- 			$.post('${path}/board/rInsert.do', sendData, function(data) { --%>
<!-- 				$('#rbdListDisp').html(data); -->
<!-- 			}); -->
<!-- 		}); -->
<!-- 	}); -->
<!-- </script> -->

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
		<!-- <div id="rbdListDisp"> -->
		<div>
			<form action="${path}/board/rInsert.do" name="frm1" id="frm1"
				method="post">
				<input type="hidden" name="id" value="${member.id }">
				<table>
					<tr>
						<th>아이디</th>
						<td>${member.id }</td>
					</tr>
				</table>
				<div>
					<input type="text" name="cp_content" placeholder="내용을 입력해 주세요.">
					<input type="submit" id="rInsert" value="칭찬등록">
				</div>
			</form>
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
<<<<<<< HEAD
						<td colspan="4" class="text-center">칭찬내역이 존재하지 않습니다</td>
=======
						<td colspan="3" class="text-center">칭찬내역이 존재하지 않습니다</td>
>>>>>>> origin/master
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="compliment" items="${list }">
						<tr>
<<<<<<< HEAD
=======
							<c:if test="${compliment.cp_del == 'y' }">
								<th colspan="4" class="text-center">삭제된 칭찬내용입니다</th>
							</c:if>
>>>>>>> origin/master
							<c:if test="${compliment.cp_del != 'y' }">
								<td class="text-center">${compliment.id }</td>
								<td class="text-center">${compliment.cp_content }</td>
								<td class="text-center">${compliment.cp_date }</td>
								<c:if test="${compliment.id == id }">
									<td><a class="btn btn-sm btn-dark"
										href="${path }/board/complimentDelete.do?id=${id}&cpno=${compliment.cpno}">삭제</a></td>
								</c:if>
								<c:if test="${compliment.id != id }">
									<td></td>
								</c:if>
							</c:if>
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
							href="${path }/board/complimentMain.do?pageNum=1"> <i>맨
									앞으로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="${path }/board/complimentMain.do?pageNum=${pb.startPage-1}">
								<i>앞으로</i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
						<c:if test="${pb.currentPage == i }">
							<li class="page-item active"><a class="page-link"
								href="${path }/board/complimentMain.do?pageNum=${i}">${i }</a></li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="page-item"><a class="page-link"
								href="${path }/board/complimentMain.do?pageNum=${i}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage}">
						<li class="page-item"><a class="page-link"
							href="${path }/board/complimentMain.do?pageNum=${pb.endPage+1}">
								<i>뒤로</i>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="${path }/board/complimentMain.do?pageNum=${pb.totalPage}">
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