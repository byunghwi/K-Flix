<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%> --%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KFLIX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/watch/cssbrowse.css">
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>

</head>
<body>

	<div class="container flex-row nav-bar ">

		<img class="logo" alt="로고"
			src="/kflix/resources/imgs/watch/kflixlogo.png">

		<ul class="nav" style="margin: 0 300px 0 0;">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">홈</a></li>
			<li class="nav-item"><a class="nav-link" href="#">TV프로그램</a></li>
			<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
			<li class="nav-item"><a class="nav-link" href="#" tabindex="-1">NEW!요즘
					대세 콘텐츠</a></li>

			<li class="nav-item"><a class="nav-link" href="#">내가 찜한 콘텐츠</a></li>
		</ul>
		<div class="profile">
			<i class="fas fa-search color_white nav-icon"></i> <i
				class="fas fa-gift color_white nav-icon"></i> <i
				class="fas fa-bell color_white nav-icon"></i> <i
				style="background-color: white; width: 40px"
				class="fas fa-child nav-icon"></i>
		</div>
	</div>

	<div id="shadow1"></div>
	<div id="carouselExampleInterval" class="carousel slide"
		style="height: 56.25vw; text-align: center;" data-bs-ride="carousel">
		<div class="carousel-inner" style="height: 56.25vw;">
			<div class="carousel-item active" data-bs-interval="1000">
				<img class="mainimg" alt="메인사진"
					src="/kflix/resources/imgs/watch/runon1.png">
			</div>
			<div class="carousel-item" data-bs-interval="100">
				<img class="mainimg" alt="로고"
					src="/kflix/resources/imgs/watch/po.png">
			</div>
			<div class="carousel-item">
				<img class="mainimg" alt="로고"
					src="/kflix/resources/imgs/movie/poster/패치.png">
			</div>
		</div>
	</div>
	<div id="list" class="container">
		<div style="position: relative; top: -327px;">


			<div class="list container">

				<c:if test="${not empty test.watch }">
					<div class="sliderow1" style="top: 0px">
						<h2 class="rowHeader1">"${login.email }"님이 시청 중인 콘텐츠</h2>
						<div class="slide_wrapper1">
							<ul class="slides1">
								<c:forEach items="${test.watch }" var="watch" varStatus="status">
									<c:forEach items="${test.movie }" var="Allmovie"
										varStatus="status">
										<c:if
											test="${watch.movie_id eq Allmovie.movie_id and watch.watch_type eq 'WATCHING'}">
											<li class="slideli1"><a class="atag"
												href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
													<div class="atagdiv">
														<img style="margin: 0;" src="${Allmovie.poster_path }"
															class="dis img1" alt="...">
														<div class="videohover">
															<video class="video" muted autoplay loop
																poster="${Allmovie.poster_path}">
																<source src="${Allmovie.teaser_path}" type="video/mp4">
															</video>
														</div>
													</div>
											</a></li>
										</c:if>
									</c:forEach>
								</c:forEach>
							</ul>
						</div>
						<div class="pagenum1"></div>
						<p class="controls1">
							<span class="backopprev1"></span> <span class="backopnext1"></span>
						</p>
						<p class="controls1">
							<span class="prev1"><i class="fas fa-chevron-left"></i></span> <span
								class="next1"><i class="fas fa-chevron-right"></i></span>
						</p>
					</div>
				</c:if>

				<c:if test="${not empty test.wish}">
					<div class="sliderow2" style="top: 38px">
						<h2 class="rowHeader2">내가 찜한 콘텐츠</h2>
						<div class="slide_wrapper2">
							<ul class="slides2">
								<c:forEach items="${test.wish }" var="wish" varStatus="status">
									<c:forEach items="${test.movie }" var="Allmovie"
										varStatus="status">
										<c:if test="${wish.movie_id eq Allmovie.movie_id }">
											<li class="slideli2"><a class="atag"
												href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
													<div class="atagdiv">
														<img style="margin: 0;" src="${Allmovie.poster_path }"
															class="d-block dis img1" alt="...">
														<div class="videohover">
															<video class="video" muted autoplay loop
																poster="${Allmovie.poster_path}">
																<source src="${Allmovie.teaser_path}" type="video/mp4">
															</video>
														</div>
													</div>
											</a></li>
										</c:if>
									</c:forEach>
								</c:forEach>

							</ul>
						</div>
						<div class="pagenum2"></div>
						<p class="controls2">
							<span class="backopprev2"></span> <span class="backopnext2"></span>
						</p>
						<p class="controls2">
							<span class="prev2"><i class="fas fa-chevron-left"></i></span> <span
								class="next2"><i class="fas fa-chevron-right"></i></span>
						</p>
					</div>
				</c:if>


				<c:set var="i" value="2" />
				<c:if test="${not empty movie_genre}">
					<c:forEach items="${movie_genre }" var="movie_genre"
						varStatus="status">
						<c:set var="i" value="${i+1}" />
						<c:forEach items="${test.genre }" var="genre" varStatus="status">
							<c:if test="${movie_genre eq genre.genre_id}">
								<c:set var="sum" value="${sum+1}" />
								<div class="sliderow${i}" style="top: ${38+38*sum}px">
									<h2 class="rowHeader${i}">${genre.genre_name }</h2>
									<div class="slide_wrapper${i}">
										<ul class="slides${i}">
											<c:forEach items="${test.movie }" var="Allmovie"
												varStatus="status">
												<c:if
													test="${Allmovie.genre_id1 eq genre.genre_id or Allmovie.genre_id2 eq genre.genre_id }">
													<li class="slideli${i}"><a class="atag"
														href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
															<div class="atagdiv">
																<img src="${Allmovie.poster_path }" class=" dis img1"
																	alt="...">
																<div class="videohover">
																	<video class="video" muted autoplay loop
																		poster="${Allmovie.poster_path}">
																		<source src="${Allmovie.teaser_path}" type="video/mp4">
																	</video>
																</div>
															</div>

													</a></li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
									<div class="pagenum${i}"></div>
									<p class="controls${i}">
										<span class="backopprev${i}"></span> <span
											class="backopnext${i}"></span>
									</p>
									<p class="controls${i}">
										<span class="prev${i}"><i class="fas fa-chevron-left"></i></span>
										<span class="next${i}"><i class="fas fa-chevron-right"></i></span>
									</p>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:if>


			</div>

		</div>

		<!-- 전체 틀이 계속 반복되야 하고 안에 알맹이가 바껴야 된다.. -->

		<script src="/kflix/resources/js/watch/jsbrowse.js"></script>
		<script type="text/javascript">
		console.log(${i});
		
		<c:forEach var="j" begin="1" end="${i}">
			console.log(${j});
			
		var 
				slides${j} = document.querySelector('.slides${j}'), 
				
				slide_wrapper${j} = document.querySelector('.slide_wrapper${j}'), 
				
				slide${j} = document.querySelectorAll('.slides${j} .slideli${j}'),
				
				currentIdx${j} = 0, 
				
				slideCount${j} = slide${j}.length, 
				
				prevBtn${j} = document.querySelector('.prev${j}'), 
				
				backopprev${j} = document.querySelector('.backopprev${j}'),
				
				backopnext${j} = document.querySelector('.backopnext${j}'), 
				
				slideWidth${j} = 250, 
				slideMargin${j} = 10, 
				slideShow${j} = 5, 
				allpagenum${j} = Math.ceil(slideCount${j} / slideShow${j}), 
				
				nextBtn${j} = document.querySelector('.next${j}'), 
				
				currentPagenum${j} = 1, 
				
				sliderow${j} = document.querySelector('.sliderow${j}'), 
				
				pagenumdiv${j} = document.querySelector('.pagenum${j}');

				console.log(slideCount${j});
		slides${j}.style.width = (slideWidth${j} + slideMargin${j}) * slideCount${j}
				- slideMargin${j} + 'px';
		slide_wrapper${j}.style.width = (slideWidth${j} + slideMargin${j}) * slideShow${j}
				- slideMargin${j} + 'px';

		
		//슬라이드 페이지 view 시 버튼 나타내기
		for (i = 1; i <= allpagenum${j}; i++) {
			if (i == 1) {
				pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
			} else {
				pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
			}
		}

		//슬라이드 마우스오버 시 버튼 나타내기
		sliderow${j}.addEventListener("mouseover", function() {
			pagenumdiv${j}.style.visibility = 'visible';

			if (slideCount${j} > slideShow${j}) {
				prevBtn${j}.style.visibility = 'visible';
				nextBtn${j}.style.visibility = 'visible';
			}

			if (currentPagenum${j} == allpagenum${j}) {
				nextBtn${j}.style.visibility = 'hidden';
			}
			if (currentPagenum${j} == 1) {
				prevBtn${j}.style.visibility = 'hidden';
			}

		});
		
		//슬라이드 마우스아웃 시 버튼 숨기기
		sliderow${j}.addEventListener("mouseout", function() {
			prevBtn${j}.style.visibility = 'hidden';
			nextBtn${j}.style.visibility = 'hidden';
			pagenumdiv${j}.style.visibility = 'hidden';
		});

		function moveSlide${j}(num) {
			slides${j}.style.left = -num * (slideWidth${j} + slideMargin${j}) + 'px';
			currentIdx${j} = num;
			currentPagenum${j} = currentIdx${j} == 0 ? 1 : Math.floor(currentIdx${j}
					/ slideShow${j}) + 1;
		}

		nextBtn${j}.addEventListener(
						'click',
						function() {
							if (currentPagenum${j} > 0) {
								moveSlide${j}(currentIdx${j} + slideShow${j});
								pagenumdiv${j}.innerHTML = ``;
								for (i = 1; i <= allpagenum${j}; i++) {
									if (i == currentPagenum${j}) {
										pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
									} else {
										pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
									}
								}
								prevBtn${j}.style.visibility = 'visible';
								backopprev${j}.style.visibility = 'visible';
								if (currentPagenum${j} == allpagenum${j}) {
									nextBtn${j}.style.visibility = 'hidden';
									backopnext${j}.style.visibility = 'hidden';
								}
							} else {
								/*moveSlide(0); 첫페이지*/
								nextBtn${j}.style.visibility = 'hidden';
								backopnext${j}.style.visibility = 'hidden';
							}
						});

		if (currentPagenum${j} == 1) {
			if (slideCount${j} <= slideShow${j}) {
				nextBtn${j}.style.visibility = 'hidden';
				backopnext${j}.style.visibility = 'hidden';
			}else{
			backopnext${j}.style.visibility = 'visible';
				
			}

			prevBtn${j}.style.visibility = 'hidden';
			backopprev${j}.style.visibility = 'hidden';
		}

		prevBtn${j}.addEventListener(
						'click',
						function() {
							if (currentPagenum${j} <= allpagenum${j}) {
								moveSlide${j}(currentIdx${j} - slideShow${j});
								pagenumdiv${j}.innerHTML = ``;
								for (i = 1; i <= allpagenum${j}; i++) {
									if (i == currentPagenum${j}) {
										pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
									} else {
										pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
									}
								}
								nextBtn${j}.style.visibility = 'visible';
								backopnext${j}.style.visibility = 'visible';
								if (currentPagenum${j} == 1) {
									prevBtn${j}.style.visibility = 'hidden';
									backopprev${j}.style.visibility = 'hidden';
								}
							} else {
								/*moveSlide(slideCount - slideShow);*/
								prevBtn${j}.style.visibility = 'hidden';
								prevBtn${j}.style.visibility = 'hidden';
							}
						});
		</c:forEach>
	</script>
</body>
</html>