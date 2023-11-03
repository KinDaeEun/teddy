<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/newsList.css">
</head>

<body class="n" oncontextmenu="return false"
	onselectstart="return false" ondragstart="return false">
	<div class="container pg_top v_hb" style="width: 1000px;">
		<div class="top">
			<div class="news">
				<div class="news_area">
					<h3 class="title">뉴스</h3>
					<c:forEach var="news" items="${list }" varStatus="v">
						<ul class="news_list">
							<li><a href="${path }/news/newsContent.do?nno=${news.nno}">
									<span class="news_img"> <img
										src="${path }/resources/images/news/${news.n_cover_img }">
								</span> <span class="smry"> <strong class="n_title">${news.n_title }</strong>
										<span class="n_cont"> <strong class="contents"></strong>
									</span> <span class="n_date">${news.n_writer }</span> <span
										class="n_date">${news.n_date }</span>
								</span>
							</a></li>
						</ul>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- paging -->
		<div>
			<ul class="pagination pagination-sm justify-content-center">
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li class="page-item"><a class="page-link link"
						href="newsList.do?pageNum=1"> <i>&raquo;</i>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
					<c:if test="${pb.currentPage == i }">
						<li class="page-item active"><a class="page-link link"
							href="newsList.do?pageNum=${i}">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li class="page-item"><a class="page-link link"
							href="newsList.do?pageNum=${i}">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage}">
					<li class="page-item"><a class="page-link link"
						href="newsList.do?pageNum=${pb.endPage+1}"> <i>&laquo;</i>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>