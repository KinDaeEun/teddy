<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 타이틀 */
.c_title {
	text-align: center;
}

.qna_help {
	width: 500px;
	height: 100px;
	border: 1px solid #EAEAEA;
	border-radius: 5px;
	text-align: center;
	margin: 0 auto;
}

.faq-image {
	text-align: center;
}
</style>
</head>
<body>
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
	<h3 class="c_title">FAQ</h3>
	<br>
	<section class="accordion" id="accordionExample">
		<div class="inner">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">테디 홈페이지에
						회원가입을 했으나 로그인이 되지 않습니다. 왜 그런가요?</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<p>
							정보통신망법 개정 및 회원 고객님의 개인정보보호를 위하여 홈페이지에 1년 이상 로그인하지 않는 경우, 회원정보의 보호
							및 운영의 효율성을 위해 휴면계정으로 전환됩니다.<br>휴면계정으로 로그인이 되지 않을 경우, 본인인증을
							통해 해제 후 이용이 가능합니다. 또한, 홈페이지에 1년 이상 비로그인 시 분리보관 후 4년 후 탈퇴/파기 합니다.
						</p>
						<p>*휴면계정 해제(본인 인증)가 불가하거나 정상 로그인이 되지 않는 경우는 기아
							고객센터(123-456-7890)로 문의하여 주시기 바랍니다.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="inner">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">차량을 렌트할
						수 있는 최소연령은 어떻게 되나요?</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					<div class="accordion-body">일반적으로 차량을 렌트할 수 연령대는 21세에서 70세
						사이이며, 25세 이하와 70세 이상인 운전자에게는 추가요금이 발생할 수 있습니다.</div>
				</div>
			</div>
		</div>
		<div class="inner">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">시승
						신청은 어떻게 해야 하나요?</button>
				</h2>
				<div id="collapseThree" class="accordion-collapse collapse"
					data-bs-toggle="collapse" aria-labelledby="headingThree"
					data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<p>
							테디는 시승체험 편의 고객만족을 위해 다양한 시승서비스를 제공하고 있습니다. 고객님께서 희망하시는 가까운 센터에서
							최고의 서비스를 직접 만나실 수 있습니다. 시승 신청은 테디 홈페이지(<a href="#">www.teddy.com</a>)
							회원가입 및 로그인 후 신청하실 수 있으며, 예약 취소 시 재신청은 1주일 후부터 가능합니다.
						</p>
						<a href="#">시승신청 바로가기</a>
						<div class="faq-image">
							<img src="${path}/resources/images/faq/teddyfaq.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="inner">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingFour">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseFour"
						aria-expanded="false" aria-controls="collapseFour">시승 당사자
						외에 다른 사람이 대신 차량을 예약할 수 있나요?</button>
				</h2>
				<div id="collapseFour" class="accordion-collapse collapse"
					aria-labelledby="headingFour" data-bs-parent="#accordionExample">
					<div class="accordion-body">다른 사람의 예약을 대신 할 수는 있지만, 주운전자의
						요구조건이 모두 충족하는지 반드시 확인해 주시기 바랍니다.</div>
				</div>
			</div>
		</div>
		<div class="inner">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingFive">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseFive"
						aria-expanded="false" aria-controls="collapseFour">시동이 안
						걸리는 원인과 조치 방법은 어떻게 되나요?</button>
				</h2>
				<div id="collapseFive" class="accordion-collapse collapse"
					aria-labelledby="headingFive" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<p>
							① 시동을 걸었는데 엔진이 돌지 않을 때 먼저 배터리 이상을 의심해 봅니다. 경음기를 울려 보고 전조등을 켜 봅니다.
							이들 장치가 작동하지 않으면 배터리가 완전히 방전된 것입니다. 점프 케이블로 다른 차의 배터리를 연결해 시동을
							걸어주시거나 정비업체 또는 보험사를 통해 조치를 받아주셔야 합니다.<br> ② 전조등과 경음기는 정상인데
							엔진이 돌지 않을 때 스마트키의 위치가 부적절한 곳에 있거나 스마트키 배터리 불량일 경우 스타트 모터가 구동되지 않아
							엔진이 돌지 않을 수 있습니다. 이런 경우에는 스마트키를 센터 콘솔 위에 두고, 스마트키 배터리 방전 여부를 먼저
							확인 해 보는 방법도 필요합니다. 또한 스마트키를 도어 포켓에 두면 인식이 잘되지 않아 스타트 모터 구동이 안 되는
							경우도 있습니다.<br> ③ 엔진이 돌아가는 소리는 들리는데 시동이 켜지지 않을 때 점화플러그에서 불꽃이
							발생하지 않거나 연료가 제때 공급되지 않을 때 일어나는 현상입니다. 요 즘 나오는 차량은 전자제어 방식이기 때문에
							운전자가 엔진을 점검하기 어렵습니다. 정비업체의 도움을 받아 주시기 바랍니다.<br> ④ 여름철 엔진 과열로
							시동이 안 걸릴 때 폭염 속에 차를 장시간 방치하거나 엔진이 과열되면 시동이 안 걸릴 때가 있습니다. 이때는 에어컨
							및 엔진 OFF 한 채로 보닛을 열어 통풍 시킴으로서 자연스럽게 냉각되도록 해야 합니다. 냉각수 누수 또는 냉각팬
							미작동 시에는 가까운 서비스센터 및 AUTO Q를 방문하셔야 합니다.<br> ⑤ 겨울철 이유 없이 시동이 안
							걸릴 때 동절기 추운 날씨 때문에 시동이 안 걸릴 경우가 있습니다. 이 경우 시동 스위치를 ON 상태로 두고 2~3분
							정도 기다린 후에 시동을 걸어주면 됩니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>

	<div class="qna_help">
		<div>
			1:1 문의 <br>더 궁금하신 내용이 있으시면 1:1 문의를 이용해 주세요.<br> <a href="${path }/help/helpInsertForm.do"
				>1:1 문의 바로가기</a>
		</div>
	</div>
	<br>
	<br>
	<br>
</body>
</html>