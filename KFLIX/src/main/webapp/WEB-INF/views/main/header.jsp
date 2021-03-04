<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/cssheader.css">

<style type="text/css">
</style>
</head>
<body>
	<%-- <h1>TEST 확인용 -> ${login}</h1> --%>
	<div class="container flex-row nav-bar ">
		<a href="/kflix/browse"><img id="logo" alt="로고"
			src="/kflix/resources/imgs/watch/kflixlogo.png"> </a>
		<ul class="nav" style="margin: 0 300px 0 0;">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/kflix/browse#abody">홈</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/kflix/browse#amovie">영화</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/kflix/browse#atop" tabindex="-1">요즘 대세 콘텐츠!</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/kflix/browse#awish">내가 찜한 콘텐츠</a></li>
		</ul>
		<div class="profile">
			<form id="searchform" action="/kflix/browse/search"></form>
			<input id="search" type="checkbox" style="display: none;"> <input
				id="searchinput" form="searchform" name="searchValue" type="text"
				style="display: none;border-radius: 0.4rem;"> <label for="search"><i
				class="fas fa-search color_white nav-icon"></i></label> <i
				class="fas fa-gift color_white nav-icon"></i> <i
				class="fas fa-bell color_white nav-icon"></i>




			<div
				style="text-align: right; font-size: 22px; display: inline-block;">
				<div class="btn-group" role="group">
					<button id="btnGroupDrop1" type="button" class="btn"
						data-bs-toggle="dropdown" aria-expanded="false"
						style="box-shadow: 0 0 0 0;">
						<i style="background-color: white; width: 40px"
							class="fas fa-user nav-icon"></i>
					</button>
					<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
						<li><a href="logout" class="dropdown-item">로그아웃</a></li>
						<li><div class="dropdown-item">
								<a href="" id="ticket">티켓구매</a>
							</div></li>
						<li><div class="dropdown-item">
								<a href="/kflix/service">고객센터</a>
							</div></li>
					</ul>
				</div>
			</div>

		</div>
	</div>

</body>

<script type="text/javascript">
	search = document.getElementById('search');
	searchinput = document.getElementById('searchinput');

	search.addEventListener("click", function() {
		if (search.checked) {
			searchinput.style.display = 'inline-block';
		} else {
			if (searchinput.value != "") {
				console.log("서치 합니다")
				document.getElementById(searchinput.getAttribute('form'))
						.submit();
				searchinput.value = "";
			}
			searchinput.style.display = 'none';
		}
	});

	$(document)
			.ready(
					function() {
						$('#ticket')
								.click(
										function() {
											var email = '${login.email}';

											$
													.ajax({
														type : 'POST',
														url : "${pageContext.request.contextPath}/ticket/cert",
														dataType : "text",
														data : "email=" + email,
														success : function(
																result) {
															if (result == "Y") {
																alert('인증처리된 회원입니다.\r\n이용권 구매페이지로 이동합니다.');
																document.location.href = '${pageContext.request.contextPath}/ticket/info';
															} else if (result == "N"
																	|| result == ""
																	|| result == null) {
																if (confirm('이용권을 구매하시려면 본인 인증을 먼저 해주세요. \r\n 본인 인증페이지로 이동할까요?')) {
																	document.location.href = '${pageContext.request.contextPath}/ticket/info';
																}
															}
														},
														error : function(error) {
															alert('[ 에러발생 ]'
																	+ error);
														}
													});
										})

					})
</script>
</html>