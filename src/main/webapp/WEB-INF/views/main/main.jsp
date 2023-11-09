<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../headerBase.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teddy</title>
<link href="${path }/resources/images/teddy.ico" rel="shortcut icon"
	type="image/x-icon" sizes="16x16">
<script type="text/javascript">
	/* 맨 위로 */
	$(function() {
		$('#top').on('click', function(e) {
			e.preventDefault();
			$('body').animate({
				scrollTop : 0
			}, 300);
		});

		$(window).scroll(function() {
			if ($(document).scrollTop() > 100) {
				$('#top').addClass('show');
			} else {
				$('#top').removeClass('show');
			}
		});
	});
</script>

</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<a id="top"></a>

	<main class="intro">
		<div class="inner">
			<div class="heading">
				<h1 style="position: relative; top: 400px; float: left;">Teddy</h1>
				<p></p>
			</div>
		</div>
	</main>

	<section class="ranking" id="ranking">
		<div class="inner">
			<div class="ranking-content">
				<div class="fxsb">
					<h2>Best Car</h2>
					<a class="btn-explore mg-r" href="${path}/car/carForm.do">Read
						More <img src="/teddy/resources/images/main/icon-arrow.png">
					</a>
				</div>
				<div class="items_car">

					<c:forEach var="car" items="${carList }" begin="0" end="2">

						<div class="item_car">
							<div class="up-image">
								<img src="${path}/resources/upload/${car.c_cover_img }">
							</div>
							<div class="down-desc">
								<span class="badge good">Good to go</span>
								<h3>${car.c_name }</h3>
								<p
									style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">${car.c_content }</p>
								<a class="btn-explore"
									href="${path }/car/carView.do?cno=${car.cno}">Explore <img
									src="${path}/resources/images/main/icon-arrow.png"></a>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</section>

	<section class="testimonial" id="testimonial">
		<div class="inner">
			<div class="testimonial-content" style="width: 1310px;">
				<h2>
					<b>Best</b> community
				</h2>
				<hr>

				<div class="myslider">
					<c:if test="${not empty board }">

						<c:forEach items="${board }" var="brd" varStatus="v">
							<c:if test="${v.index < 8 }">
								<figure class="snip1157">
									<blockquote style="font-size: 15px;  height:230px; vertical-align: bottom;" >
										${brd.b_content }
										<div class="arrow"></div>
									</blockquote>
									<img src="${path}/resources/upload/${brd.fileName}"
										alt="sq-sample3" />
									<div class="author" style="color: black;">
										<h5>
											${brd.b_title } 
										</h5>
										<span> ${brd.name }</span>
									</div>
								</figure>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</section>

	<section class="callaction" id="callaction">
		<div class="callaction-heading">
			<h2>시승 예약 바로가기</h2>
			<a href="${path}/car/reservationForm.do">Read More</a>
		</div>
	</section>

	<section class="blog" id="blog">
		<div class="inner">
			<div class="blog-content">
				<div class="blog-header">
					<h6>Hot News</h6>
					<h2>새로운 시승차 정보가 궁금하신가요?</h2>
					<p>이 곳에서 새로운 NEWS를 확인하세요</p>
					<a class="btn-explore" href="${path}/news/newsMain.do">Read
						More <img src="${path}/resources/images/main/icon-arrow.png">
					</a>
				</div>
				<hr class="divider">
				<div class="post-content">
					<div class="recent-post-items">
						<h6>most recent</h6>
						<c:forEach var="news" items="${news }" varStatus="v">
							<div class="post-item" style="margin-bottom: 30px;">
								<c:if test="${v.index < 3 }">
									<a class="post-image"
										href="${path }/news/newsContent.do?nno=${news.nno}"> <img
										src="${path}/resources/images/news/${news.n_cover_img}">
									</a>
									<div class="post-desc">
										<h3>
											<a href="${path }/news/newsContent.do?nno=${news.nno}"
												class="ntitle" style="color: #333; text-decoration: none;">${news.n_title }</a>
										</h3>
										<br>
										<p class="cont"
											style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
											${news.n_content }<span>${news.n_date }</span>
										</p>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>