<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="/kflix/resources/css/table/table.css?ver=5" />
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<meta charset="UTF-8">
<title>장르</title>
<%@include file="/WEB-INF/views/main/header_test.jsp"%>
</head>
<body>

<%@include file="../manage/navbar.jsp"%>

<section id="table_list">
<div class="container" id="board">
	<div class="d-flex justify-content-between pb-2">
	<div>
		<h1><i class="far fa-list-alt"></i> 장르</h1>
	</div>
	
	<div class="mt-3">
		<a href="./deletedList" type="button" class="btn btn-outline-secondary btn-sm">비활성 목록</a>
	</div>
	</div>

<div class="d-flex justify-content-between">
<div class="d-flex justify-content-start">
		<span>
			<button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addmodal">
			  + 추가
			</button>
		</span>
</div>	
<div class="d-flex justify-content-end">
	<!-- 컨텐츠 개수 -->
	<div class="amount pe-3">
		<select class="form-select form-select-sm" id="helpAmount">
			<option value="5">5개 씩 보기</option>
			<option value="10"selected>10개 씩 보기</option>
			<option value="20">20개 씩 보기</option>
		</select>
	</div>
	
	<div class="input-group input-group-sm mb-3 input_text">
		<input type="text" id="search_val" class="form-control" aria-describedby="button-addon2" placeholder="이름">
  		<button class="btn btn-outline-secondary" onclick="searching(1);"><i class="fas fa-search"></i></button>
  	</div>
	<div class="ps-2">
		<button class="btn btn-outline-secondary btn-sm" onclick="allView(1);">ALL</button>
	</div>
</div>
	</div>

	<div id="table_main">
	<table class="table text-center align-middle border-dark text-light" id="genretable">
		 <thead class="bg-dark">
			<tr>
				<th style="width: 150px;">#</th>
				<th style="width: 450px;">이름</th>
				<th>관리</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${genre }" var="genre" varStatus="status">
				<tr>
					<td>${genre.genre_id }</td>
					<td>${genre.genre_name }</td>
					<td>
						<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" 
								data-genreid="${genre.genre_id }" data-bs-target="#updatemodal">수정</button>
						<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" 
								data-genreid="${genre.genre_id }" data-bs-target="#deletemodal">비활성화</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>

<%@include file ="/resources/include/movie/pagecode.jsp" %>

</section>

<%@ include file="/resources/include/movie/alertModal.jsp" %>
<%@ include file="/resources/include/genre/enabledModal.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>
		
<script src="/kflix/resources/js/movie/pagenate.js?ver=2"></script>
<script src="/kflix/resources/js/genre/genre.js?ver=1"></script>
<script src="/kflix/resources/js/genre/enabled.js?ver=13"></script>
<script>
$(document).ready(function() { 
	$('#genre').prepend('<span class="nav-clicked"></span>');
});

</script>
</body>
</html>