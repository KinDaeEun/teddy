<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initialscale=1">

<title>테디</title>
</head>
<body>
	<div class="narrowWidth">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
		
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>
</html>