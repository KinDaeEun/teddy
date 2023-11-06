<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/carViews.css">

<script>
	// 글자 수 세기 , 제한
	$(document).ready(function() {
		$('#tf_cmt').on('keyup', function() {
			$('#txt_num').html($(this).val().length + " / 200");

			if ($(this).val().length > 200) {
				$(this).val($(this).val().substring(0, 200));
				$('#txt_num').html("200 / 200");
			}
		});
	});
	
	 function fnImgPop(url){
		  var img=new Image();
		  img.src=url;
		  var img_width=img.width;
		  var win_width=img.width+25;
		  var img_height=img.height;
		  var win=img.height+30;
		  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
		  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+"${path }/resources/upload/${car.formt_img}"+"' width='"+500+"'>");
		 }
	 
	 function siImgPop(url){
		  var img=new Image();
		  img.src=url;
		  var img_width=img.width;
		  var win_width=img.width+25;
		  var img_height=img.height;
		  var win=img.height+30;
		  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
		  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+"${path }/resources/upload/${car.side_img}"+"' width='"+500+"'>");
		 }
</script>
</head>
<body class="contents_l02">
	<section id="sc_car pd_top" class="pd_top">
		<div class="container">
			<div class="cont">
				<div id="dept_main">
					<h3 class="tit">${car.c_name } </h3>
				</div>
				<div class="box_g box_total" data-content="total">
					<div class="area_thumb">
						<img src="${path }/resources/upload/${car.c_img}" class="thumb_g" />
					</div>
					<div class="inner_fx">
						<h4 class="tit_all">종합평가</h4>
						<div class="area_detail">
							<!-- <strong class="tit_summary">"911 경쟁 상대는 911뿐. 자신의 벽을
								뛰어넘는다"</strong> -->
							<p class="desc_detail">
								<br> ${car.c_content }
							</p>
						</div>
						<div class="area_review">
							<strong class="tit_total"> <span class="blind">총
									평점</span> <span class="txt_total"><fmt:formatNumber
										pattern="0.0">${rateAvg }</fmt:formatNumber> </span>
							</strong>
							<div class="rating_review">
								<span class="detail_rating"> <em class="tit_rating">평점</em>
									<span><c:forEach begin="1" end="${rateAvg }">★
								</c:forEach></span> <span class="ico_bar"></span> <a href="#none" class="link_cmt"
									data-tab="comment">댓글 ${total }&nbsp;개</a>
								</span> <span> <a
									href="${path}/car/reservationForm.do?brand=${car.brand}&c_name=${car.c_name}"
									class="btn btn-outline-secondary" style="margin-top: 10px">시승
										예약</a>
								</span>
							</div>
						</div>
						<!-- 성능 / 제원 START -->
						<div class="box_perform on">
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
											<td>${car.engine}</td>
											<th>변속기 형식</th>
											<td>${car.gear }</td>
										</tr>
										<tr>
											<th>배기량</th>
											<td>${car.displacement }</td>
											<th>구동방식</th>
											<td>${car.drive_type }</td>
										</tr>
										<tr>
											<th>최고출력(ps/rpm)</th>
											<td>${car.max_output }</td>
											<th>서스펜션 (전/후)</th>
											<td>${car.suspention }</td>
										</tr>
										<tr>
											<th>최대토크(kg . m/rpm)</th>
											<td>${car.torque}</td>
											<th>브레이크 (전/후)</th>
											<td>${car.brake }</td>
										</tr>
										<tr>
											<th>0→100km/h 가속(초)</th>
											<td>${car.accel }</td>
											<th>최고속도(km/h)</th>
											<td>${car.max_speed}</td>
										</tr>
									</tbody>
								</table>
								<!-- 성능 / 제원 END -->
							</div>
						</div>
					</div>
				</div>


				<!-- 디자인 START -->
				<div class="box_design box_g">
					<h4 class="tit_subject">디자인</h4>
					<div class="area_summary">
					
						<p></p>
					</div>
					<ul class="list_detail">
						<c:forEach var="img" items="${ imgList}">
							<li data-thumb="1"><a href="#none"
								 class="link_thumb" data-lightbox="car-img"> <img
									alt="" src="${path}/resources/upload/${img.img_name}"
									class="thumb_g"> <span class="frame_g"></span>
							</a></li>
						</c:forEach>

					</ul>
					<p class="desc_detail"></p>
				</div>
				<!-- 크기 START -->
				<div class="box_design box_g">
					<h4 class="tit_subject">크기·공간</h4>
					<div class="area_summary">
						<strong class="tit_summary">"소형 SUV라 부르지 마"</strong>
						<p></p>
					</div>
					<ul class="list_detail">
						<li data-thumb="0"><a href="#none"
							class="link_thumb" onclick="fnImgPop(this.src)"> <img
								alt="" src="${path }/resources/upload/${car.formt_img}"
								class="thumb_g"> <span class="frame_g"></span>
						</a></li>
						<li data-thumb="1"><a href="#none"
							class="link_thumb" onclick="siImgPop(this.src)"> <img
								alt="" src="${path }/resources/upload/${car.side_img}"
								class="thumb_g"> <span class="frame_g"></span>
						</a></li>

					</ul>
					<p class="desc_detail"></p>
				</div>
				<!-- 댓글 START -->
				<form method="post"
					action="${path }/car/reviewInsert.do?cno=${car.cno}">
					<div class="box_comment">
						<div class="cmt_total">
							<h4 class="tit_cmt">댓글 ${total }개</h4>
							<span class="detail_rating cmt_rating"> <em class="blind">평점</em>

								<!-- 평점 이미지 자리 --> <span class="raging_g"> <fmt:formatNumber
										pattern="#.#">${rateAvg }</fmt:formatNumber> <c:forEach
										begin="1" end="${rateAvg }">★
								</c:forEach>
							</span>

							</span>
						</div>
						<!-- 평점 END -->
						<c:if test="${empty id }"></c:if>
						<c:if test="${not empty id }">
							<div class="cmt_write">
								<div class="opt_g">
									<em class="blind">평점 선택</em>
									<fieldset class="rate">
										<input type="radio" id="rating5" name="rating" value="5">
										<label class="rating5" for="rating5" title="5점"></label> <input
											type="radio" id="rating4" name="rating" value="4"> <label
											for="rating4" title="4점"></label> <input type="radio"
											id="rating3" name="rating" value="3"> <label
											class="rating3" for="rating3" title="3점"></label> <input
											type="radio" id="rating2" name="rating" value="2"> <label
											for="rating2" title="2점"></label> <input type="radio"
											id="rating1" name="rating" value="1"> <label
											class="rating1" for="rating1" title="1점"></label>
									</fieldset>
								</div>


								<div class="user_cmt_off">
									<strong class="blind">댓글 입력</strong> <span class="txt_cmt">고객님의
										평가를 남겨주세요</span>
									<textarea rows="8" cols="80" maxlength="300" class="tf_cmt"
										name="re_content" id="tf_cmt" placeholder="고객님의 평가를 남겨주세요"
										required></textarea>
									<span class="txt_num" id="txt_num">0 / 200 </span> <input
										type="submit" class="btn_cmt" value="등록"
										style="cursor: pointer">
								</div>
						</c:if>
						<!-- 댓글목록 START -->
						<div>
							<ul class="list_comment">
								<c:forEach var="review" items="${reviewList }">
									<li><span class="detail_rating type_rating"> <span
											class="img rating_g"> <c:forEach begin="1"
													end="${review.rating }">
													<span class="star">★</span>
												</c:forEach>
										</span> <span class="txt_user">${review.id }</span>
									</span>

										<p class="desc_cmt">${review.re_content }</p> <a
										class="delete"
										href="${path }/car/reviewDelete.do?cno=${car.cno }&re_no=${review.re_no}">삭제</a>
										<span class="txt_date">${review.re_date }</span></li>

								</c:forEach>
							</ul>
						</div>
						<!-- 댓글목록 END -->
						<!-- paging -->
						<div>

							<ul class="pagination justify-content-center m-3">
								<c:if test="${pb.startPage > pb.pagePerBlock}">
									<li class="page-item"><a class="page-link link"
										href="carView.do?cno=${car.cno }&pageNum=1">
											<i class="bi bi-arrow-left-square-fill">&laquo;</i>
									</a></li>
									<li class="page-item"><a class="page-link link"
										href="carView.do?cno=${car.cno }&pageNum=${pb.startPage-1}">
											<i class="bi bi-arrow-left-circle"></i>
									</a></li>
								</c:if>
								<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
									<c:if test="${pb.currentPage == i }">
										<li class="page-item active"><a class="page-link link"
											href="carView.do?cno=${car.cno }&pageNum=${i }">${i }</a></li>
									</c:if>
									<c:if test="${pb.currentPage != i }">
										<li class="page-item"><a class="page-link link"
											href="carView.do?cno=${car.cno }&pageNum=${i }">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pb.endPage < pb.totalPage }">
									<li class="page-item"><a class="page-link link"
										href="carView.do?cno=${car.cno }&pageNum=${pb.endPage + 1 }">
											<i class="bi bi-arrow-right-square-fill"></i>
									</a></li>
									<li class="page-item"><a class="page-link link"
										href="carView.do?cno=${car.cno }&pageNum=${pb.totalPage }">
											<i class="bi bi-arrow-right-circle">&raquo;</i>
									</a></li>
								</c:if>
							</ul>
						</div>
						<!-- paging end -->
					</div>
				</form>
			</div>

			<!-- 댓글 END -->
		</div>
	</section>

</body>
</html>