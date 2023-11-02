<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/newsMain.css">
<script>
window.uiTabT1 = function(e) {
    var t = e.slice(e.indexOf("#") + 1)
      , n = t.slice(0, -1)
      , s = t.slice(t.lastIndexOf(0))
      , o = document.getElementById(n).getElementsByTagName("li");
    for (i = 0; i <= o.length - 1; i++)
        o[i].className = o[i].className.replace("active", ""),
        document.getElementById(n + (i + 1)).className = document.getElementById(n + (i + 1)).className.replace("active", "");
    o[s - 1].className += " active",
    document.getElementById(t).className += " active"
}
,
window.uiTabT2 = function(e) {
    var t = e.slice(e.indexOf("#") + 1)
      , n = t.slice(0, -1)
      , s = (t.slice(t.lastIndexOf(0)),
    document.getElementById(n).getElementsByTagName("div"))
      , o = 0;
    for (h = 0; h <= s.length - 1; h++)
        s[h].parentNode.id == undefined || null == s[h].parentNode.id ? l = 0 : l = s[h].parentNode.id,
        l == n && o++;
    for (i = 1; i <= o; i++)
        document.getElementById(n + i).className = document.getElementById(n + i).className.replace("active", "");
    document.getElementById(t).className += " active"
}
;
</script>
</head>
<body class="n" oncontextmenu="return false"
	onselectstart="return false" ondragstart="return false">
	<div class="container pg_top v_hb" style="width: 1000px;">
		<div class="body" id="bodydiv">
			<!-- carousel start -->
			<div id="carouselExampleInterval"
				class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:forEach var="pic" items="${newslist }">
						<div class="carousel-item active cover_pic"
							data-bs-interval="2000" style="height: 400px;">
							<img src="${path }/resources/images/news/${pic.n_cover_img}"
								class="d-block" alt="..." style="width: 100%; height: 100%">
						</div>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- carousel end -->
			<div class="news">
				<div class="news_area">
					<h3 class="title">뉴스</h3>
					<c:forEach var="news" items="${newslist }" varStatus="v">
						<ul class="news_list">
						<c:if test="${v.index < 3 }">
							<li><a href="${path }/news/newsContent.do?nno=${news.nno}">
									<span class="news_img"> <img
										src="${path }/resources/images/news/${news.n_cover_img }">
								</span> <span class="smry"> <strong class="n_title">${news.n_title }</strong>
										<span class="n_cont"> <strong class="contents"></strong>
									</span> <span class="n_date">${news.n_writer }</span> <span
										class="n_date">${news.n_date }</span>
								</span>
							</a></li></c:if>
						</ul>
					</c:forEach>
				</div>
			</div>

			<div class="tab_review">
				<div id="exo" class="tab_wrp">
					<div id="exo1" class="tab1 active">
						<p>
							<a href="#exo1" onclick="uiTabT1(this.href);return false;">최신뉴스</a>
						</p>
						<div class="sec">
							<ul>
								<li><a
									href="${path }/news/newsContent.do?nno=${recent.nno}"> <img
										class="sec_img"
										src="${path }/resources/images/news/${recent.n_cover_img}">
								</a>
									<dl>
										<dt>
											<a href="#">${recent.n_title }</a>
										</dt>
										<dd>
											<span class="date">${recent.n_date }</span>
										</dd>
									</dl></li>
							</ul>
						</div>
					</div>
					<div id="exo2" class="tab2">
						<p>
							<a href="#exo2" onclick="uiTabT2(this.href);return false;">인기뉴스</a>
						</p>
						<div class="sec">
							<ul>
								<li style="text-align: center;">준비중 입니다</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>