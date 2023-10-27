<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../headerBase.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teddy</title>
<script type="text/javascript">
	/* 맨 위로 */
	$(function() {
		$('#top').on('click', function(e) {
			e.preventDefault();
			$('body').animate({
				scrollTop : 0
			}, 600);
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
<body>
	<a id="top"></a>

	<main class="intro">
		<div class="inner">
			<div class="heading">
				<h1>Teddy</h1>
				<p></p>
			</div>
		</div>
	</main>

	<section class="ranking" id="ranking">
		<div class="inner">
			<div class="ranking-content">
				<div class="fxsb">
					<h2>Best Car</h2>
					<a class="btn-explore mg-r" href="${path}/car/carForm.do">Read More <img src="/teddy/resources/images/main/icon-arrow.png"></a>
				</div>
				<div class="items_car">
						<div class="item_car">
							<div class="up-image">
								<img src="${path}/resources/images/main/best-city-01.jpg">
							</div>
							<div class="down-desc">
								<span class="badge good">Good to go</span>
								<h3>The Kia, Ray EV</h3>
								<p>London’s main sights might date back millennia, but the
									capital’s shops, bars, hotels, and restaurants emerge and
									evolve on an almost weekly basis.</p>
								<a class="btn-explore" href="#none">Explore <img
									src="${path}/resources/images/main/icon-arrow.png"></a>
							</div>
						</div>
						<div class="item_car">
							<div class="up-image">
								<img src="${path}/resources/images/main/best-city-02.jpg">
							</div>
							<div class="down-desc">
								<span class="badge good">Good to go</span>
								<h3>Volkswagen, The Arteon</h3>
								<p>New York’s performing arts scene—both on Broadway and
									off—is beloved by visitors and locals alike, so it’s no
									surprise that the Big Apple took the number one spot.</p>
								<a class="btn-explore" href="#none">Explore <img
									src="${path}/resources/images/main/icon-arrow.png"></a>
							</div>
						</div>
						<div class="item_car">
							<div class="up-image">
								<img src="${path}/resources/images/main/best-city-03.jpg">
							</div>
							<div class="down-desc">
								<span class="badge good">Good to go</span>
								<h3>London, England</h3>
								<p>Paris, France The Notre Dame fire was a devastating
									reminder of how well-loved Paris is by travelers worldwide, and
									as the capital gears up for the 2024 Olympics</p>
								<a class="btn-explore" href="#none">Explore <img
									src="${path}/resources/images/main/icon-arrow.png"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>

	<section class="testimonial" id="testimonial">
		<div class="inner">
			<div class="testimonial-content">
				<h2>
					what <b>our customers</b> are saying
				</h2>
				<hr>
				<div class="myslider">
					<div>
						<p class="client">
							<img src="${path}/resources/images/main/client-01.jpg"> <span><b>Hanni
									Pham</b>Melbourne, Australia</span>
						</p>
						<p class="comment">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Officia ipsa consequatur dolore quam illum
							laudantium, at voluptate eos, natus reprehenderit odio,
							aspernatur. Quos, nam expedita fugit tempora! Recusandae sint
							atque perspiciatis iusto iure adipisci quas eius facere beatae
							molestias! Ea odit accusamus debitis neque, eius ratione,
							consectetur odio nostrum veritatis.</p>
					</div>
					<div>
						<p class="client">
							<img src="${path}/resources/images/main/client-02.jpg"> <span><b>Kate
									Whitney</b>Los Angeles, US</span>
						</p>
						<p class="comment">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Consectetur porro minus cum fuga rerum maiores?
							Dolorem, autem. Nemo fuga atque praesentium alias veniam odio
							error, repellat iusto dolor. Quidem laudantium a, consequatur
							eligendi et cum voluptas, ut harum, dignissimos enim numquam
							repellat amet impedit! Nulla dolor harum ea nobis odit.</p>
					</div>
					<div>
						<p class="client">
							<img src="${path}/resources/images/main/client-03.jpg"> <span><b>Kelly
									Muvils</b>New York, US</span>
						</p>
						<p class="comment">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Eligendi tempore excepturi enim at, fugiat odio
							aperiam dolorem sint dolorum id nulla deleniti nesciunt, fugit
							ipsam itaque atque molestiae. Quod tenetur culpa qui magnam ex
							fugit ducimus quam similique iure voluptatibus distinctio velit
							animi eaque totam, eius blanditiis. Iusto, perferendis nam.</p>
					</div>
					<div>
						<p class="client">
							<img src="${path}/resources/images/main/client-04.jpg"> <span><b>Oliver</b>Califonia,
								US</span>
						</p>
						<p class="comment">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Repudiandae quia quod ullam itaque mollitia,
							eaque illum, porro nobis consequatur, qui aliquid doloribus
							possimus accusamus provident nostrum recusandae earum quo
							blanditiis dolorem veritatis ducimus laborum fuga vel. Laboriosam
							assumenda voluptas voluptatibus quasi est earum doloribus
							doloremque, incidunt quis. Consequuntur, atque, obcaecati.</p>
					</div>
					<div>
						<p class="client">
							<img src="${path}/resources/images/main/client-05.jpg"> <span><b>Sophia</b>London,
								UK</span>
						</p>
						<p class="comment">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Nulla adipisci, nesciunt itaque ad ducimus quae
							repellendus, sint. Nam, vel, neque. Accusamus voluptatum
							laboriosam qui dolorum, reprehenderit, aliquam inventore
							veritatis, rem accusantium beatae sunt quia illum voluptatibus?
							Doloremque assumenda temporibus atque tenetur ipsam perferendis
							ut minima veniam. Expedita aspernatur quae commodi!</p>
					</div>
					<div>
						<p class="client">
							<img src="${path}/resources/images/main/client-06.jpg"> <span><b>Charlotte</b>Washington,
								US</span>
						</p>
						<p class="comment">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Similique, eum! Fuga velit, consequatur sequi
							nemo voluptas, beatae. Dicta sunt et eum nulla sapiente. Delectus
							mollitia reiciendis quidem facilis tempore, voluptas rerum
							excepturi non ducimus minus quasi minima. Tenetur, deserunt optio
							tempore vitae nostrum illum? Ducimus veniam nihil velit voluptate
							ad.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="callaction" id="callaction">
		<div class="callaction-heading">
			<h2>
				시승 예약 바로가기
			</h2>
			<a href="${path}/car/reservationForm.do">Read More</a>
		</div>
	</section>

	<section class="blog" id="blog">
		<div class="inner">
			<div class="blog-content">
				<div class="blog-header">
					<h6>feature article</h6>
					<h2>Can Americans Visit Mexico Right Now?</h2>
					<p>Technically, there’s a ban on nonessential travel across the
						border through September 21. Then how are people on vacation in
						Cabo and Cancun right now?</p>
					<a class="btn-explore" href="#none">Read More <img
						src="${path}/resources/images/main/icon-arrow.png"></a>
				</div>
				<hr class="divider">
				<div class="post-content">
					<div class="recent-post-items">
						<h6>most recent</h6>
						<div class="post-item">
							<div class="post-image">
								<img src="${path}/resources/images/main/most-recent-01.jpg">
							</div>
							<div class="post-desc">
								<h3>world ocean travel</h3>
								<p>
									The ocean provides a vast seascape for travel. Beyond the
									cruise ship there are other, more intimate, more
									environmentally sustainable ways to engage with the ocean. <span>July
										12, 2020</span>
								</p>
							</div>
						</div>
						<hr class="divider">
						<div class="post-item">
							<div class="post-image">
								<img src="${path}/resources/images/main/most-recent-02.jpg">
							</div>
							<div class="post-desc">
								<h3>come to South Korea</h3>
								<p>
									While only 60 years ago South Korea was considered a developing
									country, it’s now one of Asia’s economic and cultural leaders.
									Super-chic Seoul combines modernism with ancient history <span>August
										22, 2020</span>
								</p>
							</div>
						</div>
						<hr class="divider">
						<div class="post-item">
							<div class="post-image">
								<img src="${path}/resources/images/main/most-recent-03.jpg">
							</div>
							<div class="post-desc">
								<h3>Vietnam & Cambodia</h3>
								<p>
									Start in Hanoi and end in Bangkok! With the Discovery tour Best
									of Vietnam & Cambodia, you have a 18 days tour package taking
									you through Hanoi, Vietnam and 10 other destinations. <span>June
										30, 2020</span>
								</p>
							</div>
						</div>
					</div>
					<div class="shared-post-items">
						<h6>most shared</h6>
						<div class="post-item">
							<div class="post-image">
								<img src="${path}/resources/images/main/most-shared-01.jpg">
							</div>
							<div class="post-desc">
								<h3>Events in NYC</h3>
								<p>
									New York City is the place to see and do everything <span>May
										02, 2020</span>
								</p>
							</div>
						</div>
						<div class="post-item">
							<div class="post-image">
								<img src="${path}/resources/images/main/most-shared-02.jpg">
							</div>
							<div class="post-desc">
								<h3>FESTIVALS</h3>
								<p>
									Experiencing a festival together with a group of like-minded <span>Jan
										18, 2020</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>