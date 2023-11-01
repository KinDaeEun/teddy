<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/resources/css/newsContent.css">
<script type="text/javascript">
	function clip() {

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
</script>
</head>
<body class="mg mg_view" oncontextmenu="return false"
	onselectstart="return false" ondragstart="return false">
	<div class="container" id="containerDIV">
		<div class="body pd_top" id="bodyDIV">
			<div class="contents" id="depth_main">
				<!-- inner start -->
				<div class="mgz_inner">
					<div class="enc_cnt">
						<div class="title_icon">
							<span>NEWS</span>
						</div>
						<div class="view_cnt">
							<h4 id="title">${news.n_title }</h4>
							<div class="txt_view_info">
								<span class="info_date">${news.n_date }</span>
								<!-- <div class="mg_sns sns_center">
									<a href="#" class=" sns u_btn_sns"> <span class="inner">
											<em></em> <span>공유</span>
									</span>
									</a>
								</div> -->
							</div>
							<!-- txt_view_info END -->
							<div class="article_cnt">
								<p>
									<img src="${path }/resources/images/news/${news.n_img }">
								</p>
								<p>${news.n_content }</p>
							</div>
							<div class="rept_share">
								<ul>
									<li><a href="#" class="btn btn-outline-secondary btn-sm"
										onclick="clip(); return false;">공유하기 </a> <a
										href="${path }/news/newsList.do"
										class="btn btn-outline-secondary btn-sm">돌아가기</a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
				<!-- inner end -->
				<!-- side start -->

			</div>
			<div class="cnt_side side">
				<div class="thmnil_cnt">
					<h3 class="title_idx_news">최신뉴스</h3>
					<div class="line"></div>
					<div class="thmnil_area">
						<ul class="thmnil_list">
							<c:forEach var="news" items="${newslist }">
								<li><a href="${path }/news/newsContent.do?nno=${news.nno}">
										<span class="img_article"> <img
											src="${path }/resources/images/news/${news.n_cover_img }">
									</span> <span class="smry"> <strong class="tit_smry">${news.n_title }</strong>
											<span class="cnt_smry"></span> <span class="cat">${news.n_date }</span>
									</span>
								</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- side end -->
			</div>
		</div>
	</div>

	<textarea></textarea>
</body>
</html>