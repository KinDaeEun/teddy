<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/carForm.css">
<script>

/* 맨 위로 */
$(function(){
	  $('#top').on('click',function(e){
	      e.preventDefault();
	      $('body').animate({scrollTop:0},600);
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<br>
	<br>

	<div class="container body" id="bodydiv">
		<div id="main" class="contents">
		<a id="top"></a>
			<!-- @@@ 검색 보류 @@@ -->
			<div class="finder finder_on">
				<details class="bundle_finder">
					<summary class="link_finder">접기 / 펼치기</summary>
					<p>검색 보류</p>
				</details>
			</div>
			<!-- 검색 끝 -->

			<div class="cont">
				<h3 class="blind">차량</h3>
				<div class="cont_sub">
					<ul class="list" id="list">
					<c:forEach begin="0" end="21">
						<li><a class="link_car" href="#"> 
								<strong class="tit_car">현대그랜저</strong>
								<span class="detail_point"> 
									<em class="tit_point">장점</em>
									<span class="txt_point">아아.. 이것이 '현대'다</span>
								</span> 
								<span class="detail_point"> 
									<em class="tit_point tit_cons">단점</em> 
									<span class="txt_point">결함수준은 '뭔데'</span>
								</span> 
								<span class="detail_rating"> 
									<em class="blind">평점</em> 
									<span class="img rating_g"></span>
								</span> 
								<span class="detail_thumb"> 
									<img src="${path}/resources/images/main/best-city-01.jpg"
									class="thumb_g">
							</span>
						</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<hr>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>