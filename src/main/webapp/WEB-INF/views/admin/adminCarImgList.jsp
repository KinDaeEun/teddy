<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../headerBase.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mb {
	margin-bottom: 100px;
}

.top {
	padding-top: 200px;
	padding-bottom: 50px;
}

.btn-top {
	margin-top: 5px;
	
}



</style>
<body>
	<div class="container " align="center">
		<div class="inner join-inner mb">
			<h2 class="text-dark top">차량 디자인 이미지</h2>
			<form action="${path }/admin/adminCarImgDelete.do" method="post">
				<table class="table table-bordered">
					<c:forEach var="img" items="${imgList }" varStatus="v">
					<tr>
						<th>
							<input type="checkbox" value="${img.dno}" id="img${v.index}" name="Dno">
							<label for="img${v.index}">${img.img_name}</label>
						</th>
						<td><img src="${path}/resources/upload/${img.img_name }" style="width:318px; height:159px"> </td>
					</tr>				
					</c:forEach>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="삭제" class="btn btn-dark">
							<a href="${path }/admin/adminCarList.do" class="btn btn-outline-dark">취소</a>
						</td>
					</tr>
				</table>
			</form>
			

		</div>
	</div>
</body>
</html>