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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="body" id="bodydiv">
			<!-- carousel start 언젠가 수정 예정 -->
			<div id="carouselExample" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${path }/resources/images/intro.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="${path }/resources/images/intro.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="${path }/resources/images/intro.jpg"
							class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExample" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExample" data-bs-slide="next">
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
									<span class="news_img"> <img src="${path }/resources/images/news/${news.n_cover_img }">
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>