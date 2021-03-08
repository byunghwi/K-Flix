<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style type="text/css">
.popup {
	position: fixed;
	top: 50%;
	left: 50%;
}

.handle {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
	width: 100%;
	height: 20px;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/main/header_test.jsp"%>
	<span class="anchor" id="abody"></span>
	<div id="modalbackground">
		<div id="confirm">
			<i class="fas fa-power-off logout"></i> <i
				style="color: #aa2929; font-size: 50px" class="far fa-times-circle"></i>
			<p style="color: white; font-weight: bold; font-size: 22px;">이용권
				구매 요청</p>
			<p style="color: #dcdcdc; font-size: 16px; font-weight: 300;">구매
				후 무제한 감상을 시작해 보세요.</p>
			<div id="confirmbtn">이용권 구매하기</div>
		</div>
	</div>

	<div id="shadow1"></div>
	<div id="carouselExampleInterval" class="carousel slide"
		style="height: 56.25vw; text-align: center;" data-bs-ride="carousel">
		<div class="carousel-inner" style="height: 56.25vw;">
			<div class="carousel-item active">
				<!-- data-bs-interval="10000" -->
				<img class="mainimg" alt="메인사진"
					src="/kflix/resources/imgs/watch/po4.png">
			</div>
			<div class="carousel-item">
				<img class="mainimg" alt="메인사진"
					src="/kflix/resources/imgs/watch/runon1.png">
			</div>
			<div class="carousel-item">
				<img class="mainimg" alt="메인사진"
					src="/kflix/resources/imgs/watch/po.png">
			</div>
			<div class="carousel-item">
				<img class="mainimg" alt="메인사진"
					src="/kflix/resources/imgs/watch/po2.png">
			</div>
			<div class="carousel-item">
				<img class="mainimg" alt="메인사진"
					src="/kflix/resources/imgs/watch/po3.png">
			</div>

		</div>
	</div>

	<div id="list" class="container">
		<div id="slides"
			style="position: relative; top: -476px; padding: 100px 0; overflow: hidden;">

			<div class="list container">
				<c:if test="${not empty test.watching }">
					<span class="anchor" id="awatching"></span>
					<c:set var="i" value="${i+1}" />
					<div class="sliderow${i} }">
						<!--  style="top: 0px" -->
						<h2 class="rowHeader${i}">"${login.email }"님이 시청 중인 콘텐츠</h2>
						<div class="slide_wrapper${i}">
							<ul class="slides${i}">
								<c:forEach items="${test.watch }" var="watch" varStatus="status">
									<c:forEach items="${test.movie }" var="Allmovie"
										varStatus="status">
										<c:if
											test="${watch.movie_id eq Allmovie.movie_id and watch.watch_type eq 'WATCHING'}">
											<li class="slideli${i}"><a
												onclick="framshow(${watch.movie_id})" class="atag">
													<div class="atagdiv">
														<img style="margin: 0;" src="${Allmovie.poster_path }"
															class="dis img1" alt="...">
														<progress class="probar" value="${watch.view_point }"
															max="${Allmovie.play_time * 60 }"> </progress>
														<div class="videohover">
															<img style="margin: 0;" src="${Allmovie.poster_path }"
																class="modalimg" alt="...">
															<div class="hovervideo">
																<video class="video" muted autoplay loop
																	poster="${Allmovie.poster_path}">
																	<source src="${Allmovie.teaser_path}" type="video/mp4">
																</video>
															</div>
															<div class="comment">
																<div style="font-size: 18px;">
																	<c:choose>
																		<c:when test="${Allmovie.rating eq 'all' }">
																			<p class="ratingsty"
																				style="background-color: green; font-size: 20px;">ALL</p>
																		</c:when>
																		<c:when test="${Allmovie.rating eq '12' }">
																			<p class="ratingsty"
																				style="background-color: #dfb039; color: black;">${Allmovie.rating }</p>
																		</c:when>
																		<c:when test="${Allmovie.rating eq '15' }">
																			<p class="ratingsty"
																				style="background-color: #cd6d34">${Allmovie.rating }</p>
																		</c:when>
																		<c:when test="${Allmovie.rating eq '19' }">
																			<p class="ratingsty"
																				style="background-color: #c52e37">${Allmovie.rating }</p>
																		</c:when>
																		<c:otherwise>
																			<p class="ratingsty"
																				style="background-color: #c52e37">${Allmovie.rating }</p>
																		</c:otherwise>
																	</c:choose>
																	${Allmovie.movie_title }
																</div>
																<div style="position: absolute; top: 21px; right: 30px;">
																	<span
																		style="font-family: 'Acme', ' Oswald ', sans-serif; margin-right: 5px">
																		<fmt:formatDate value="${Allmovie.reg_date }"
																			pattern="yyyy.MM" />
																	</span> • ${Allmovie.play_time }분
																</div>
																<div style="position: absolute; top: 53px; right: 30px;">
																	<span
																		style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid; padding: 3px 7px;">
																		<i class="fas fa-thumbs-up"></i>
																	</span> <span
																		style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid white; background-color: white; padding: 3px 10px; color: black;">
																		${Allmovie.movie_rank }</span>
																</div>
																<div class="infotable1">
																	<table>
																		<tr align="left">
																			<td colspan="1"><span class="c-gay">감독: </span>
																				<c:forEach items="${AllDirector }" var="AllDirector"
																					varStatus="status">
																					<c:if
																						test="${Allmovie.director_id eq AllDirector.director_id }">
									${AllDirector.director_name }
								</c:if>
																				</c:forEach></td>
																		</tr>
																		<tr align="left">
																			<td><span class="c-gay">출연: </span> <c:forEach
																					items="${AllActor }" var="AllActor"
																					varStatus="status">
																					<c:if
																						test="${Allmovie.actor_id1 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
																							test="${Allmovie.actor_id2 eq AllActor.actor_id }">, 
									</c:if>
																					</c:if>
																					<c:if
																						test="${Allmovie.actor_id2 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
																							test="${Allmovie.actor_id3 eq AllActor.actor_id }">, 
									</c:if>
																					</c:if>

																					<c:if
																						test="${Allmovie.actor_id3 eq AllActor.actor_id }">
									${AllActor.actor_name }
									</c:if>
																				</c:forEach></td>
																		</tr>
																		<tr align="left">
																			<td><span class="c-gay">개요: </span>${Allmovie.country }영화
																				<c:forEach items="${AllGenre }" var="AllGenre"
																					varStatus="status">
																					<c:if
																						test="${Allmovie.genre_id1 eq AllGenre.genre_id }">
																			${AllGenre.genre_name} 
																					</c:if>
																					<c:if
																						test="${Allmovie.genre_id2 eq AllGenre.genre_id }">
																				${AllGenre.genre_name }
																					</c:if>
																				</c:forEach></td>
																		</tr>
																	</table>
																</div>
															</div>
														</div>
													</div>
											</a></li>
										</c:if>
									</c:forEach>
								</c:forEach>
							</ul>
						</div>
						<div class="pagenum${i}"></div>
						<p class="controls${i}">
							<span class="backopprev${i}"></span> <span class="backopnext${i}"></span>
						</p>
						<p class="controls${i}">
							<span class="prev${i}"><i class="fas fa-chevron-left"></i></span>
							<span class="next${i}"><i class="fas fa-chevron-right"></i></span>
						</p>
					</div>
				</c:if>

				<c:if test="${not empty test.wish}">
					<span class="anchor" id="awish"></span>
					<c:set var="i" value="${i+1}" />
					<div class="sliderow${i} }">
						<!--  style="top: 38px" -->
						<h2 class="rowHeader${i}">내가 찜한 콘텐츠</h2>
						<div class="slide_wrapper${i}">
							<ul class="slides${i}">
								<c:forEach items="${test.wish }" var="wish" varStatus="status">
									<c:forEach items="${test.movie }" var="Allmovie"
										varStatus="status">
										<c:if test="${wish.movie_id eq Allmovie.movie_id }">
											<li class="slideli${i}"><a
												onclick="framshow(${Allmovie.movie_id})" class="atag">
													<div class="atagdiv">
														<img style="margin: 0;" src="${Allmovie.poster_path }"
															class="d-block dis img1" alt="...">
														<div class="videohover">
															<img style="margin: 0;" src="${Allmovie.poster_path }"
																class="modalimg" alt="...">
															<div class="hovervideo">
																<video class="video" muted autoplay loop
																	poster="${Allmovie.poster_path}">
																	<source src="${Allmovie.teaser_path}" type="video/mp4">
																</video>
															</div>
															<div class="comment">
																<div style="font-size: 18px;">
																	<c:choose>
																		<c:when test="${Allmovie.rating eq 'all' }">
																			<p class="ratingsty"
																				style="background-color: green; font-size: 20px;">ALL</p>
																		</c:when>
																		<c:when test="${Allmovie.rating eq '12' }">
																			<p class="ratingsty"
																				style="background-color: #dfb039; color: black;">${Allmovie.rating }</p>
																		</c:when>
																		<c:when test="${Allmovie.rating eq '15' }">
																			<p class="ratingsty"
																				style="background-color: #cd6d34">${Allmovie.rating }</p>
																		</c:when>
																		<c:when test="${Allmovie.rating eq '19' }">
																			<p class="ratingsty"
																				style="background-color: #c52e37">${Allmovie.rating }</p>
																		</c:when>
																		<c:otherwise>
																			<p class="ratingsty"
																				style="background-color: #c52e37">${Allmovie.rating }</p>
																		</c:otherwise>
																	</c:choose>
																	${Allmovie.movie_title }
																</div>
																<div style="position: absolute; top: 21px; right: 30px;">
																	<span
																		style="font-family: 'Acme', ' Oswald ', sans-serif; margin-right: 5px">
																		<fmt:formatDate value="${Allmovie.reg_date }"
																			pattern="yyyy.MM" />
																	</span> • ${Allmovie.play_time }분
																</div>
																<div style="position: absolute; top: 53px; right: 30px;">
																	<span
																		style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid; padding: 3px 7px;">
																		<i class="fas fa-thumbs-up "></i>
																	</span> <span
																		style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid white; background-color: white; padding: 3px 10px; color: black;">
																		${Allmovie.movie_rank }</span>
																</div>
																<div class="infotable1">
																	<table>
																		<tr align="left">
																			<td colspan="1"><span class="c-gay">감독: </span>
																				<c:forEach items="${AllDirector }" var="AllDirector"
																					varStatus="status">
																					<c:if
																						test="${Allmovie.director_id eq AllDirector.director_id }">
									${AllDirector.director_name }
								</c:if>
																				</c:forEach></td>
																		</tr>
																		<tr align="left">
																			<td><span class="c-gay">출연: </span> <c:forEach
																					items="${AllActor }" var="AllActor"
																					varStatus="status">
																					<c:if
																						test="${Allmovie.actor_id1 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
																							test="${Allmovie.actor_id2 eq AllActor.actor_id }">, 
									</c:if>
																					</c:if>
																					<c:if
																						test="${Allmovie.actor_id2 eq AllActor.actor_id  }">
									${AllActor.actor_name }<c:if
																							test="${Allmovie.actor_id3 eq AllActor.actor_id }">, 
									</c:if>
																					</c:if>

																					<c:if
																						test="${Allmovie.actor_id3 eq AllActor.actor_id }">
									${AllActor.actor_name }
									</c:if>
																				</c:forEach></td>
																		</tr>
																		<tr align="left">
																			<td><span class="c-gay">개요: </span>${Allmovie.country }영화
																				• <c:forEach items="${AllGenre }" var="AllGenre"
																					varStatus="status">
																					<c:if
																						test="${Allmovie.genre_id1 eq AllGenre.genre_id }">
																			${AllGenre.genre_name}</c:if>
																					<c:if
																						test="${Allmovie.genre_id2 eq AllGenre.genre_id }">
																				${AllGenre.genre_name } </c:if>
																				</c:forEach></td>
																		</tr>
																	</table>
																</div>
															</div>
														</div>
													</div>
											</a></li>
										</c:if>
									</c:forEach>
								</c:forEach>

							</ul>
						</div>
						<div class="pagenum${i}"></div>
						<p class="controls${i}">
							<span class="backopprev${i}"></span> <span class="backopnext${i}"></span>
						</p>
						<p class="controls${i}">
							<span class="prev${i}"><i class="fas fa-chevron-left"></i></span>
							<span class="next${i}"><i class="fas fa-chevron-right"></i></span>
						</p>
					</div>
				</c:if>

				<c:set var="i" value="${i+1}" />
				<span class="anchor" id="atop"></span>
				<div id="top10" class="sliderow${i} }">
					<h2 class="rowHeader${i}">KFLIX의 TOP 10 콘텐츠</h2>
					<div class="slide_wrapper${i}">
						<ul class="slides${i}">
							<c:forEach items="${Ranking }" var="Ranking" varStatus="status">
								<li class="slideli${i}"><a
									onclick="framshow(${Ranking.movie_id})" class="atag">
										<div class="atagdiv">
											<img style="margin: 0;" src="${Ranking.poster_path }"
												class="d-block dis img1" alt="...">
											<div class="videohover">
												<img style="margin: 0;" src="${Ranking.poster_path }"
													class="modalimg" alt="...">
												<div class="hovervideo">
													<video class="video" muted autoplay loop
														poster="${Ranking.poster_path}">
														<source src="${Ranking.teaser_path}" type="video/mp4">
													</video>
												</div>
												<div class="comment">
													<div style="font-size: 18px;">
														<c:choose>
															<c:when test="${Ranking.rating eq 'all' }">
																<p class="ratingsty"
																	style="background-color: green; font-size: 20px;">ALL</p>
															</c:when>
															<c:when test="${Ranking.rating eq '12' }">
																<p class="ratingsty"
																	style="background-color: #dfb039; color: black;">${Ranking.rating }</p>
															</c:when>
															<c:when test="${Ranking.rating eq '15' }">
																<p class="ratingsty" style="background-color: #cd6d34">${Ranking.rating }</p>
															</c:when>
															<c:when test="${Ranking.rating eq '19' }">
																<p class="ratingsty" style="background-color: #c52e37">${Ranking.rating }</p>
															</c:when>
															<c:otherwise>
																<p class="ratingsty" style="background-color: #c52e37">${Ranking.rating }</p>
															</c:otherwise>
														</c:choose>
														${Ranking.movie_title }
													</div>
													<div style="position: absolute; top: 21px; right: 30px;">
														<span
															style="font-family: 'Acme', ' Oswald ', sans-serif; margin-right: 5px">
															<fmt:formatDate value="${Ranking.reg_date }"
																pattern="yyyy.MM" />
														</span> • ${Ranking.play_time }분
													</div>
													<div style="position: absolute; top: 53px; right: 30px;">
														<span
															style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid; padding: 3px 7px;">
															<i class="fas fa-thumbs-up "></i>
														</span> <span
															style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid white; background-color: white; padding: 3px 10px; color: black;">
															${Ranking.movie_rank }</span>
													</div>
													<div class="infotable1">
														<table>
															<tr align="left">
																<td colspan="1"><span class="c-gay">감독: </span> <c:forEach
																		items="${AllDirector }" var="AllDirector"
																		varStatus="status">
																		<c:if
																			test="${Ranking.director_id eq AllDirector.director_id }">
									${AllDirector.director_name }
								</c:if>
																	</c:forEach></td>
															</tr>
															<tr align="left">
																<td><span class="c-gay">출연: </span> <c:forEach
																		items="${AllActor }" var="AllActor" varStatus="status">
																		<c:if
																			test="${Ranking.actor_id1 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
																				test="${Ranking.actor_id2 eq AllActor.actor_id }">, 
									</c:if>
																		</c:if>
																		<c:if
																			test="${Ranking.actor_id2 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
																				test="${Ranking.actor_id3 eq AllActor.actor_id }">, 
									</c:if>
																		</c:if>

																		<c:if
																			test="${Ranking.actor_id3 eq AllActor.actor_id }">
									${AllActor.actor_name }
									</c:if>
																	</c:forEach></td>
															</tr>
															<tr align="left">
																<td><span class="c-gay">개요: </span>${Ranking.country }영화,
																	<c:forEach items="${AllGenre }" var="AllGenre"
																		varStatus="status">
																		<c:if
																			test="${Ranking.genre_id1 eq AllGenre.genre_id }">
																			${AllGenre.genre_name}
																			<c:if
																				test="${Ranking.genre_id2 eq AllGenre.genre_id }"></c:if>
																		</c:if>
																		<c:if
																			test="${Ranking.genre_id2 eq AllGenre.genre_id }">
																				${AllGenre.genre_name } </c:if>
																	</c:forEach></td>
															</tr>
														</table>
													</div>
												</div>
											</div>
										</div>
								</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="pagenum${i}"></div>
					<p class="controls${i}">
						<span class="backopprev${i}"></span> <span class="backopnext${i}"></span>
					</p>
					<p class="controls${i}">
						<span class="prev${i}"><i class="fas fa-chevron-left"></i></span>
						<span class="next${i}"><i class="fas fa-chevron-right"></i></span>
					</p>
				</div>

				<c:if test="${not empty movie_genre}">
					<span class="anchor" id="amovie"></span>
					<c:forEach items="${movie_genre }" var="movie_genre"
						varStatus="status">
						<c:set var="i" value="${i+1}" />
						<c:forEach items="${test.genre }" var="genre" varStatus="status">
							<c:if test="${movie_genre eq genre.genre_id}">
								<!--  <c:set var="sum" value="${sum+1}" /> -->
								<div class="sliderow${i}">
									<!-- style="top: ${76+38*sum}px" -->
									<h2 class="rowHeader${i}">${genre.genre_name }</h2>
									<div class="slide_wrapper${i}">
										<ul class="slides${i}">
											<c:forEach items="${test.movie }" var="Allmovie"
												varStatus="status">
												<c:if
													test="${Allmovie.genre_id1 eq genre.genre_id or Allmovie.genre_id2 eq genre.genre_id }">
													<li class="slideli${i}"><a
														onclick="framshow(${Allmovie.movie_id})" class="atag">
															<div class="atagdiv">
																<img src="${Allmovie.poster_path }" class="dis img1"
																	alt="...">
																<div class="videohover">
																	<img style="margin: 0;" src="${Allmovie.poster_path }"
																		class="modalimg" alt="...">
																	<div class="hovervideo">
																		<video class="video" muted autoplay loop
																			poster="${Allmovie.poster_path}">
																			<source src="${Allmovie.teaser_path}"
																				type="video/mp4">
																		</video>
																	</div>
																	<div class="comment">
																		<div style="font-size: 18px;">
																			<c:choose>
																				<c:when test="${Allmovie.rating eq 'all' }">
																					<p class="ratingsty"
																						style="background-color: green; font-size: 20px;">ALL</p>
																				</c:when>
																				<c:when test="${Allmovie.rating eq '12' }">
																					<p class="ratingsty"
																						style="background-color: #dfb039; color: black;">${Allmovie.rating }</p>
																				</c:when>
																				<c:when test="${Allmovie.rating eq '15' }">
																					<p class="ratingsty"
																						style="background-color: #cd6d34">${Allmovie.rating }</p>
																				</c:when>
																				<c:when test="${Allmovie.rating eq '19' }">
																					<p class="ratingsty"
																						style="background-color: #c52e37">${Allmovie.rating }</p>
																				</c:when>
																				<c:otherwise>
																					<p class="ratingsty"
																						style="background-color: #c52e37">${Allmovie.rating }</p>
																				</c:otherwise>
																			</c:choose>
																			${Allmovie.movie_title }
																		</div>
																		<div
																			style="position: absolute; top: 21px; right: 30px;">
																			<span
																				style="font-family: 'Acme', ' Oswald ', sans-serif; margin-right: 5px">
																				<fmt:formatDate value="${Allmovie.reg_date }"
																					pattern="yyyy.MM" />
																			</span> • ${Allmovie.play_time }분
																		</div>
																		<div
																			style="position: absolute; top: 53px; right: 30px;">
																			<span
																				style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid; padding: 3px 7px;">
																				<i class="fas fa-thumbs-up "></i>
																			</span> <span
																				style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid white; background-color: white; padding: 3px 10px; color: black;">
																				${Allmovie.movie_rank }</span>
																		</div>
																		<div class="infotable1">
																			<table>
																				<tr align="left">
																					<td colspan="1"><span class="c-gay">감독:
																					</span> <c:forEach items="${AllDirector }"
																							var="AllDirector" varStatus="status">
																							<c:if
																								test="${Allmovie.director_id eq AllDirector.director_id }">
									${AllDirector.director_name }
								</c:if>
																						</c:forEach></td>
																				</tr>
																				<tr align="left">
																					<td><span class="c-gay">출연: </span> <c:forEach
																							items="${AllActor }" var="AllActor"
																							varStatus="status">
																							<c:if
																								test="${Allmovie.actor_id1 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
																									test="${Allmovie.actor_id2 eq AllActor.actor_id }">, 
									</c:if>
																							</c:if>
																							<c:if
																								test="${Allmovie.actor_id2 eq AllActor.actor_id  }">
									${AllActor.actor_name }<c:if
																									test="${Allmovie.actor_id3 eq AllActor.actor_id }">, 
									</c:if>
																							</c:if>

																							<c:if
																								test="${Allmovie.actor_id3 eq AllActor.actor_id }">
									${AllActor.actor_name }
									</c:if>
																						</c:forEach></td>
																				</tr>
																				<tr align="left">
																					<td><span class="c-gay">개요: </span>${Allmovie.country }영화
																						• <c:forEach items="${AllGenre }" var="AllGenre"
																							varStatus="status">
																							<c:if
																								test="${Allmovie.genre_id1 eq AllGenre.genre_id }">
																			${AllGenre.genre_name}</c:if>
																							<c:if
																								test="${Allmovie.genre_id2 eq AllGenre.genre_id }">
																				${AllGenre.genre_name } </c:if>
																						</c:forEach></td>
																				</tr>
																			</table>
																		</div>
																	</div>
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

	</div>
	<iframe id="infoframe" name="browse" src="" width="400px"
		height="300px" allowTransparency="true"
		style="filter: chroma(color = #999999)"></iframe>
	<!-- 전체 틀이 계속 반복되야 하고 안에 알맹이가 바껴야 된다.. -->

	<script src="/kflix/resources/js/watch/jsbrowse.js"></script>

	<script type="text/javascript">
	test = document.getElementById('testdsf');
	hometag = document.querySelector('.hometag')
	movietag = document.querySelector('.movietag') 
	top10tag = document.querySelector('.top10tag') 
	wishtag = document.querySelector('.wishtag')
	
	if(window.location.pathname == "/kflix/browse"){
		hometag.style.fontWeight = '700';
		hometag.style.color = '#fff';
	}
	hometag.addEventListener('click',function tagstyle(){
		hometag.style.fontWeight = '700';
		hometag.style.color = '#fff';
		
		movietag.style.fontWeight = '100';
		movietag.style.color = '#e5e5e5';
		top10tag.style.fontWeight = '100';
		top10tag.style.color = '#e5e5e5';
		wishtag.style.fontWeight = '100';
		wishtag.style.color = '#e5e5e5';
	});
	
	movietag.addEventListener('click',function tagstyle(){
		movietag.style.fontWeight = '700';
		movietag.style.color = '#fff';
		
		hometag.style.fontWeight = '100';
		hometag.style.color = '#e5e5e5';
		top10tag.style.fontWeight = '100';
		top10tag.style.color = '#e5e5e5';
		wishtag.style.fontWeight = '100';
		wishtag.style.color = '#e5e5e5';
	});
	
	top10tag.addEventListener('click', function tagstyle(){
		top10tag.style.fontWeight = '700';
		top10tag.style.color = '#fff';
		
		hometag.style.fontWeight = '100';
		hometag.style.color = '#e5e5e5';
		movietag.style.fontWeight = '100';
		movietag.style.color = '#e5e5e5';
		wishtag.style.fontWeight = '100';
		wishtag.style.color = '#e5e5e5';
	});
	
	wishtag.addEventListener('click', function tagstyle(){
		wishtag.style.fontWeight = '700';
		wishtag.style.color = '#fff';
		
		hometag.style.fontWeight = '100';
		hometag.style.color = '#e5e5e5';
		movietag.style.fontWeight = '100';
		movietag.style.color = '#e5e5e5';
		top10tag.style.fontWeight = '100';
		top10tag.style.color = '#e5e5e5';
	});
	
	anchor = document.querySelectorAll('.anchor')
	
	
	<c:if test="${member.ticket_id == 0 || empty member.ticket_id}">
	anchor.forEach(function(anchorItem) {
		anchorItem.style.height = "120px";
		anchorItem.style.marginTop = "-120px"; 
});
	
	</c:if>
	/* 	modalbackground = document.getElementById('modalbackground');
	console.log(${member.ticket_id}+"dlek");
	<c:if test="${member.ticket_id == 0 || empty member.ticket_id}">
	modalbackground.style.display = 'block';
	body.style.overflow = 'hidden';
	</c:if> */

	var payMsg = '${payMsg}';
	if(payMsg === 'success'){
		alert('이용권이 정상적으로 구매되었습니다. \r\n이제 KFLIX를 마음껏 즐겨보세요.');
	}
	
	
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
		
		slideWidth${j} = 300, 
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
						if (currentPagenum${j} > allpagenum${j}) {
							moveSlide${j}(0);
							prevBtn${j}.style.visibility = 'hidden';
							backopprev${j}.style.visibility = 'hidden';
							pagenumdiv${j}.innerHTML = ``;
							for (i = 1; i <= allpagenum${j}; i++) {
								if (i == currentPagenum${j}) {
									pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
								} else {
									pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
								}
							}
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