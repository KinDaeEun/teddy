<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<select class="form-select" id="car_brand">
			<optgroup label="차량 모델을 선택해주세요">
			<c:forEach var="car" items="${list }">
				<option>${car.car_brand }</option>
					</c:forEach>
			</optgroup>
		</select>

</body>
</html>