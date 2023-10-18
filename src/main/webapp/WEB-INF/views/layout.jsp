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

	<table>
		<tr><td>
			<tiles:insertAttribute name="header" />
		</td></tr><tr><td>
			<tiles:insertAttribute name="body"/>
		</td></tr><tr><td>
			<tiles:insertAttribute name="footer"/>
		</td></tr>
	</table>

</body>
</html>