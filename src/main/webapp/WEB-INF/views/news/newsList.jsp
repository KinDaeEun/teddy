<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/newsList.css">
</head>
<body class="n">
	<div class="container pg_top v_hb">
		<div class="body" id="bodydiv">
			<!-- carousel start -->
			<div id="carouselExampleInterval" class="carousel slide carousel-fade"
				data-bs-ride="carousel">
				<div class="carousel-inner">
				<c:forEach var="pic" items="${newslist }">
					<div class="carousel-item active cover_pic" data-bs-interval="2000" style="height: 400px;">
						<img src="${path }/resources/images/news/${pic.n_cover_img}" class="d-block" alt="..." style="width:100%; height:100%">
					</div>
				</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- carousel end -->
			<div class="news">
				<div class="news_area">
					<h3 class="title">뉴스</h3>
					<c:forEach var="news" items="${newslist }">
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
			<!-- 뭐넣을지 모름 -->
			<div>
				<div class="ummmm">
					<h3 class="umm">뭐넣지</h3>
					<a href="#"> <span> <img
							src="${path }/resources/images/intro.jpg">
					</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>