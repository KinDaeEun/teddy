<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initialscale=1">
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="${path}/resources/js/jquery.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${path }/resources/images/teddy.ico" rel="shortcut icon" type="image/x-icon" sizes="16x16">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Slick.js -->

<link rel="stylesheet" type="text/css" href="${path}/resources/js/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/js/slick/slick-theme.css"/>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/> -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/> -->
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- Sliding jQuery -->
<!-- <script src="${path}/resources/js/jquery.scrollTo.min.js"></script> -->
<script src="${path}/resources/js/custom.js"></script>
<link rel="stylesheet" href="${path}/resources/css/main.css">
<link rel="stylesheet" href="${path}/resources/css/responsive.css">
<link rel="stylesheet" href="${path}/resources/css/member.css">
<link rel="stylesheet" href="${path}/resources/css/faqList.css">
<style>
	.err { color:#; font-weight: bold; display: inline-block; margin-top:5px;}
	a {
		text-decoration: none;
	}
</style>