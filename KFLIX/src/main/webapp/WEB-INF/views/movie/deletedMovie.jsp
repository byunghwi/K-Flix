<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="/kflix/resources/css/movie/movie.css" />
<meta charset="UTF-8">
<title>삭제된 목록</title>

</head>
<body>


<div class="container pt-5">
	<div class="d-flex justify-content-end">
		<a href="./movieindex" class="btn btn-secondary btn-sm">관리 페이지</a>
	</div>
	
	<div class="d-flex justify-content-center">
		<h1>삭제 목록</h1>
	</div>
	
<div class="d-flex justify-content-end">

<%@include file ="/resources/include/movie/searching.jsp" %>

</div>

<section style="padding-top: 20px;" id="movielist">
	<table class="table table-striped table-danger text-center align-middle" id="movietable">
		<thead>
		<tr>
			<th>ID</th>
			<th>포스터</th>
			<th>제목</th>
			<th>장르</th>
			<th>감독</th>
			<th>상영시간</th>
			<th>등록일</th>
			<th>관리</th>
		</tr>
		</thead>
  		<tbody>
		<c:forEach items="${movie }" var="movie" varStatus="status">
			<tr>
				<td>${movie.movie_id }</td>
				<td><img alt="사진" src="${movie.poster_path }"/></td>
				<td>${movie.movie_title }</td>
				<td>${movie.director_name }</td>
				<td>${movie.genre_name1 } / ${movie.genre_name2 }</td>
				<td>${movie.play_time }분</td>
				<td><fmt:formatDate value="${movie.reg_date }" pattern="yy/MM/dd"/></td>
				<td>
				<button type="button" class="btn btn-warning" data-bs-toggle="modal" 
							data-movieid="${movie.movie_id }" data-bs-target="#recoverymodal">복구</button>
					<%-- <a href="./detail/${movie.movie_id }" class="btn btn-info text-light">상세보기</a> --%>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</section>

<%@include file ="/resources/include/movie/pagecode.jsp" %>

</div>

<%@include file ="/resources/include/movie/disModal.jsp" %>

  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/kflix/resources/js/movie/deletedrest.js?ver=4"></script>

</body>
</html>