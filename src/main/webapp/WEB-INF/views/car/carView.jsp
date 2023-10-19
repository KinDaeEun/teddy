<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/view.css">
<style>
</style>
</head>
<body class="contents_l02">
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<section id="sc_car">
		<div class="container">
			<div class="cont">
				<div id="dept_main">
					<h3 class="tit">${car.c_name }</h3>
				</div>
				<div class="box_g box_total" data-content="total">
					<div class="area_thumb">
						<img
							src="http://dzqerse1lankl.cloudfront.net/carsdata/idb/SU/20231004/47dc2da7-4ac3-40e5-a90a-2679ddb1ae6f.png"
							class="thumb_g" alt="포르쉐 911 (992) 가솔린" />
					</div>
					<div class="inner_fx">
						<h4 class="tit_subject">종합평가</h4>
						<div class="area_detail">
							<!-- <strong class="tit_summary">"911 경쟁 상대는 911뿐. 자신의 벽을
								뛰어넘는다"</strong> -->
							<p class="desc_detail">
							<br>
								${car.c_content }
							</p>
						</div>
						<div class="area_review">
							<strong class="tit_total"> <span class="blind">총
									평점</span> <span class="txt_total">5.0</span>
							</strong>
							<div class="rating_review">
								<span class="detail_rating"> <em class="tit_rating">평점</em>
									<span>★★★★★</span> <span class="ico_bar"></span> <a
									href="#none" class="link_cmt" data-tab="comment">댓글 1</a>
								</span> <span> <a
									href="${path}/car/reservationForm.do?brand=${car.brand}&c_name=${car.c_name}"
									class="btn btn-outline-secondary" style="margin-top: 10px">시승
										예약</a>
								</span>
							</div>
						</div>
						<!-- 성능 / 제원 START -->
						<div class="box-g box_perform on">
							<div class="area_data">
								<strong class="tit_g">제원</strong>
								<table class="table tbl">
									<colgroup>
										<col style="width: 25%">
										<col style="width: 25%">
										<col style="width: 25%">
										<col style="width: 25%">
									</colgroup>
									<tbody>
										<tr>
											<th>엔진 형식</th>
											<td>-</td>
											<th>변속기 형식</th>
											<td>수동 8단</td>
										</tr>
										<tr>
											<th>배기량</th>
											<td>2,981</td>
											<th>구동방식</th>
											<td>후륜</td>
										</tr>
										<tr>
											<th>최고출력(ps/rpm)</th>
											<td>450 / 6,500</td>
											<th>서스펜션 (전/후)</th>
											<td>맥퍼슨 스트럿, 멀티 링크</td>
										</tr>
										<tr>
											<th>최대토크(kg . m/rpm)</th>
											<td>54.1 / 2,300</td>
											<th>브레이크 (전/후)</th>
											<td>4개 / 벤틸레이티드 디스크4개</td>
										</tr>
										<tr>
											<th>0→100km/h 가속(초)</th>
											<td>3.7</td>
											<th>최고속도(km/h)</th>
											<td>308</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 성능 / 제원 END -->
						<!-- 댓글 START -->
<!-- 						<div class="box_comment">
							<div>
								<h4>댓글 1개</h4>
								<span class="detail_rating cmt_rating"> <em class="blind">평점</em>
									평점 이미지 자리 <span class="raging_g">★★★★★</span> 5.0
								</span>
							</div>
							평점 END
							<div class="cmt_write">
								<div class="opt_g">
									<em class="blind">평점 선택</em>
								</div>
							</div>
						</div> -->

						<!-- 댓글 END -->
					</div>
				</div>
			</div>
		</div>
	</section>
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
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>