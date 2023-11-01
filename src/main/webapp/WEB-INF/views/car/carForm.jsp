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
	<div class="container body pd_top" id="bodydiv">
		<div id="main" class="contents">
			<a id="top"></a>
			<!-- @@@ 검색 보류 @@@ -->
			<form id="finder" class="form_finder"
				action="${path }/car/carForm.do">
				<fieldset>
					<legend class="blind">조회</legend>
					<div class="finder finder_on">
						<details class="bundle_finder">
							<summary class="link_finder">차종 찾아보기로</summary>
							<!-- 차종 -->
							<div>
								<div class="find">
									<strong class="tit_finder">차종</strong>
									<div class="list_finder">
										<label class="test_obj"> <input type="radio"
											name="c_kind" value="경차/소형차"> <span>경차/소형차</span>
										</label> <label class="test_obj"> <input type="radio"
											name="c_kind" value="준중형차"> <span>준중형차</span>
										</label> <label class="test_obj"> <input type="radio"
											name="c_kind" value="중형차"> <span>중형차</span>
										</label> <label class="test_obj"> <input type="radio"
											name="c_kind" value="대형차"> <span>대형차</span>
										</label> <label class="test_obj"> <input type="radio"
											name="c_kind" value="SUV"> <span>SUV</span>
										</label>
									</div>
								</div>
								<!-- 브랜드 -->
								<div class="find">
									<strong class="tit_finder">브랜드</strong>
									<div class="list_finder">
										<label class="test_obj"> <input type="radio"
											name="brand" value="현대"> <span>현대</span>
										</label> <label class="test_obj"> <input type="radio"
											name="brand" value="쉐보레"> <span>쉐보레</span>
										</label> <label class="test_obj"> <input type="radio"
											name="brand" value="기아"> <span>기아</span>
										</label> <label class="test_obj"> <input type="radio"
											name="brand" value="벤츠"> <span>벤츠</span>
										</label> <label class="test_obj"> <input type="radio"
											name="brand" value="BMW"> <span>BMW</span>
										</label>
									</div>
								</div>
								<!-- 순서 -->
								<div class="find">
									<strong class="tit_finder">정렬 순서</strong>
									<div class="list_finder">
										
										<label class="test_obj"> <input type="radio"
											name="order" value="cno"> <span>업데이트순</span>
										</label> <label class="test_obj"> <input type="radio"
											name="order" value="avg_rating"> <span>종합 평가 순</span>
										</label>
									</div>
								</div>
								<input type="submit" value="조회" class="find_c">
							</div>
						</details>
					</div>
				</fieldset>
			</form>
			<!-- 검색 끝 -->


			


			<div class="cont">
				<h3 class="blind">차량</h3>
				<div class="cont_sub">
					<ul class="list" id="list">
						<c:forEach var="car" items="${carList }">
							<li><a class="link_car"
								href="${path }/car/carView.do?cno=${car.cno}"> <strong
									class="tit_car">${car.c_name }</strong> <span
									class="detail_point"> <em class="tit_point">별점</em> <span
										class="txt_point tit_font">
										
										<c:if test="${car.avg_rating>0 }">
										<fmt:formatNumber value="${car.avg_rating }" pattern="0.0"></fmt:formatNumber> 
											<c:forEach var="i" begin="1" end="${car.avg_rating-(car.avg_rating%1)}">
       						   					  <img alt="" src="${path }/resources/images/car/star.png" class="star_img">
     								  		 </c:forEach>
     								    	<c:if test="${car.avg_rating != car.avg_rating-(car.avg_rating%1)}">
              									 <img alt="" src="${path }/resources/images/car/half_star.png" class="star_img">
          									</c:if>
          								</c:if>
          								<c:if test="${car.avg_rating<=0 }">
          									<div class="no_tit">평점이 없습니다</div>
          								</c:if>
          								

									</span>
								</span> <span class="detail_rating"> <em class="blind">평점</em> <span
										class="img rating_g"></span>
								</span> <span class="detail_thumb"> <img
										src="${path}/resources/upload/${car.c_cover_img}"
										class="thumb_g">
								</span>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="paging" style="margin-top: 15px">
				<ul class="pagination justify-content-center">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<li class="page-item"><a class="page-link link"
							href="carForm.do?pageNum=1&brand=${car.brand}&c_kind=${car.c_kind}&order=${car.order}">
								<i class="icofont-duotone icofont-arrow-first icofont-2x"></i>
						</a></li>
						<li class="page-item"><a class="page-link link"
							href="carForm.do?pageNum=${startPage-1}&brand=${car.brand}&c_kind=${car.c_kind}&order=${car.order}">
								<i class="bi bi-arrow-left-circle icofont-2x"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage == i }">
							<li class="page-item active"><a class="page-link link"
								href="carForm.do?pageNum=${i}&brand=${car.brand}&c_kind=${car.c_kind}&order=${car.order}">${i }</a></li>
						</c:if>
						<c:if test="${currentPage != i }">
							<li class="page-item"><a class="page-link link"
								href="carForm.do?pageNum=${i}&brand=${car.brand}&c_kind=${car.c_kind}&order=${car.order}">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < totalPage}">
						<li class="page-item"><a class="page-link link"
							href="carForm.do?pageNum=${endPage+1}&brand=${car.brand}&c_kind=${car.c_kind}&order=${car.order}">
								<i class="bi bi-arrow-right-square icofont-2x"></i>
						</a></li>
						<li class="page-item"><a class="page-link link"
							href="carForm.do?pageNum=${totalPage}&brand=${car.brand}&c_kind=${car.c_kind}&order=${car.order}">
								<i class="bi bi-arrow-right-circle-fill icofont-2x"></i>
						</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>