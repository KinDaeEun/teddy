<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
.pd {
	padding-top: 250px;
	padding-bottom: 100px;
}

td {
	height: 50px;
	line-height: 50px;
}

.mg {
	margin-top: 100px;
}
</style>
</head>
<body>
	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="container pd">
		<table class="table">
			<tr class="mg" height="1000">
				<td width="25%"><tiles:insertAttribute name="menu"></tiles:insertAttribute></td>
				<td><tiles:insertAttribute name="body"></tiles:insertAttribute></td>
			</tr>
		</table>
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>