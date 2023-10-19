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
					<h3 class="tit">포르쉐 911 (992) 가솔린 3L</h3>
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
							<strong class="tit_summary">"911 경쟁 상대는 911뿐. 자신의 벽을
								뛰어넘는다"</strong>
							<p class="desc_detail">
								버버리 트렌치코트, 롤렉스 손목시계. 이처럼 이름만 들어도 곧장 제품의 이미지가 머릿속에 그려지는 몇몇 브랜드가
								있습니다. 포르쉐 911도 당연 그중 하나죠. 911은 풍부한 역사와 명성에 걸맞은 화려한 성능, 시대를 초월한
								디자인으로 단순한 스포츠카를 넘어 스포츠카의 아이콘으로 거듭났습니다. 한 분야의 상징이란 건 사실상 최고의
								스포츠카로서 가치와 자격을 인정받았음을 의미합니다. <br /> <br />항상 여유와 자신감 넘치는 911의
								자태를 보면 실망할 일이 있겠나 싶지만, 매번 다음 911을 준비하는 포르쉐 입장에서는 어깨에 내려앉은 부담이
								상당할 것입니다. 911처럼 아이코닉한 스포츠카는 주변에서 보다 엄격하고 냉정한 잣대로 바라보기 마련이니까요.
								혈통의 진화를 정당화하려면 뚜렷한 발전을 이뤄내야 하는데, 이미 완벽에 가까운 이전 세대를 어떻게든 뛰어넘어야 했던
								이들의 고충은 감히 헤아리기 힘듭니다. 그런데도 911은 세대를 거듭할 때마다 어김없이 존재 가치를 보란 듯이
								증명했습니다. 지금의 8세대 992시리즈 911이 포르쉐 역사상 가장 완벽에 가까운 911인 셈이죠. <br />
								<br />현재 국내 판매 중인 911 라인업은 19종입니다. 이들은 크게 세 가지 카테고리(카레라, 터보,
								GT)로 나뉩니다. 터보는 엄청난 힘의 우위를 앞세워 엔트리 모델 카레라와 격차를 둡니다. GT는 모터스포츠로
								다져진 포르쉐 순수 DNA를 머금었습니다. RS는 이보다 한층 하드코어 세팅으로 아예 레이싱 영역으로 도약하죠. <br />
								<br />부드러운 일상 주행, 역동적인 스포츠 주행 어느 쪽이든 능숙하게 대응하는 GTS도 있습니다. 뛰어난
								주행 성능을 중시하지만, 출퇴근이나 마트를 오가는 일상 주행 때는 날카로운 운동성을 원하지 않는 911 고객의
								현실적인 바람을 반영한 모델입니다. 카브리올레는 이들 모두를 가장 자극적으로 타는 방법입니다. 점잖은 야수 같고,
								언제 어디서나 매력적이면서도 당당한 911을 타고 운전의 행복을 경험하길 바랍니다. <br />
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
									href="${path}/car/reservationForm.do?cno=${car.cno}"
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
								<!-- 성능 / 제원 END -->
							</div>
						</div>
					</div>
				</div>
				<!-- 댓글 START -->
				<div class="box_comment">
					<div class="cmt_total">
						<h4 class="tit_cmt">댓글 1개</h4>
						<span class="detail_rating cmt_rating"> <em class="blind">평점</em>
							<!-- 평점 이미지 자리 --> <span class="raging_g">★★★★★</span> 평점평균자리
						</span>
					</div>
					<!-- 평점 END -->
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
							<strong class="blind">댓글 입력</strong>
							<!-- 로그인 했을 경우 -->
							<span class="txt_cmt">고객님의 평가를 남겨주세요</span>
							<textarea rows="8" cols="80" maxlength="300" class="tf_cmt"
								title="고객님의 평가를 남겨주세요"></textarea>
							<!-- 로그인 안했을 경우 -->
							<span class="txt_num">
								<strong>0</strong> / 300
							</span>
							<button type="button" class="btn_cmt">등록</button>
						</div>
						<!-- 댓글목록 START -->
						<!-- 댓글이 있을 경우 -->
						<ul class="list_comment">
							<li>
								<span class="detail_rating type_rating">
									<span class="img rating_g">
										<span class="img">★★★★★</span>
									</span>
									<span class="txt_user"> 닉네임 님 </span>
								</span>
								<p class="desc_cmt">댓글 내용</p>
								<span class="txt_date">댓글 작성 날짜 오후 06:22</span>
							</li>
						</ul>
						<!-- 댓글이 없을 경우 -->
					</div>
				</div>
				<!-- 댓글 END -->
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