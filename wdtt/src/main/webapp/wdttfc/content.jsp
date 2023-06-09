<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>



<ul class="page-scroll-list">
	<li id="tag1" class="active"></li>
	<li id="tag2"></li>
	<li id="tag3"></li>
</ul>
<div class="section" id="sec1">
	<%@ include file="header.jsp"%>
	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
       <image href="${path}/wdttfc/image/kilShoot.jpg" width="100%"
						height="100%" fill="#777" /></svg>

				<div class="container">
					<div class="carousel-caption text-start">
						<h1>야, 너도 할 수 있어</h1>
						<br>
						<p>우당탕탕 FC와 함께라면 너도 할 수 있어. 손흥민 박지성 차범근 우병길 let's go</p>
						<p>
							<a class="btn btn-lg btn-primary"
								href="${path}/wdttfc/signUp.jsp">회원가입하러가기</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
         <image href="${path}/wdttfc/image/wow.jpg" width="100%"
						height="100%" fill="#777" /></svg>

				<div class="container">
					<div class="carousel-caption">
						<h1>내가 여기서 뭘 할 수 있는데!?</h1>
						<br>
						<p>우당탕탕FC 인원들의 자유로운 소통을 확인해 봐, 너도 충분히 할 수 있어 Just Do It!</p>
						<p>
							<a class="btn btn-lg btn-primary" href="${path}/wdttfc/login.jsp">로그인
								하러가기</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
        <image href="${path}/wdttfc/image/big.png" width="100%"
						height="100%" fill="#777" /></svg>

				<div class="container">
					<div class="carousel-caption text-end">
						<h1>그래서 언제 차는데?</h1>
						<br>
						<p>매주 금요일 20시 경기도 고양시 덕양구 공양왕길 123-4 (원당동 1037) 왕능골 풋살장에서 보자!</p>
						<p>
							<a class="btn btn-lg btn-primary" href="${path}/news_servlet/newsList.do">확인하러가기</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<button class="slide-arrows carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="slide-arrows carousel-control-next" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<div class="section" id="sec2">
	<p>section 2</p>
</div>
<div class="section" id="sec3">
	<%@ include file="footer.jsp"%>
</div>
<!--   원스크롤 스크립트소스 공통 js 파일에다가 적용시킬것 -->
<script type="text/javascript">
	$(document).ready(
			function() {
				var delay = false;
				var currentPage = 1;
				var pageCount = $(".section").length;
				var swipe = document.getElementsByTagName('.section');

				$(document).on(
						'mousewheel DOMMouseScroll',
						function(event) {
							event.preventDefault();
							if (delay)
								return;
							delay = true;
							setTimeout(function() {
								delay = false
							}, 100)

							var wd = event.originalEvent.wheelDelta
									|| -event.originalEvent.detail;
							// 	        console.log(wd);

							if (wd < 0) {
								if (currentPage < pageCount) {
									currentPage++;
								}
							} else {
								if (1 < currentPage) {
									currentPage--;
								}
							}

							$('html,body').animate(
									{
										scrollTop : $('#sec' + currentPage)
												.offset().top
									}, 700);

							$('#tag' + currentPage).addClass('active');
							for (var i = 1; i <= pageCount; i++) {
								if (i != currentPage) {
									$('#tag' + i).removeClass('active');
								}
							}
						});
			});
</script>