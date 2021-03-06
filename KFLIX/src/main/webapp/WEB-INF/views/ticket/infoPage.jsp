<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<!-- <script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
 
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css"> 
 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
	
<link href="/kflix/resources/css/ticket/ticket.css" rel="stylesheet">
	

<style>
 body, html {
	background: #141414;
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	cursor: default;
	width: 100%; 
	height: 100%;
	margin: 0;
	padding : 0;

}

body {
    margin: 0;
    font-family: var(--bs-font-sans-serif);
    font-size: 1rem;
    font-weight: 700;
    line-height: 1.5;
    color: #212529;
   /*  background-color: #fff; */
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
}

/*  
div.total_wrap {
	width: 100%;
	height: 100%;

}

/* .total_wrap header, footer, nav, section {
	//border : 1px solid #999;  
}

.total_wrap header {
	height: 7%;
	background-color: aqua;
	background-color: rgba( 0, 0, 0, 1 );
}

 
 .total_wrap nav, section {
	float: left;
	height: 85%;
}

.total_wrap nav {
	background-color: goldenrod;
	width: 10%;
}

.total_wrap section {
 	background-color: green; 
	width: 90%;
}

.total_wrap footer{
	background-color: blue;
	clear: both;
	height: 8%;
}

*/
</style>

</head>
<body>

<%@include file="/WEB-INF/views/main/header_test.jsp"%>

<div class = "total_wrap">	

	<nav>
		네비게이션
	</nav>
	
	<section>
		<div class="contents">
			<c:choose>
				<c:when test="${member.cert eq 'N' && sendChk eq 'OK'}">
					<div>이메일을 전송했습니다.</div>
				</c:when>
		
				<c:when test="${member.cert eq 'N'}">
					<button id="sendEmail" onclick="sendEmail();">이메일 인증 보내기</button>
				</c:when>
		
				<c:when test="${member.cert eq 'Y'}">
					<div>이메일인증이 완료된 회원입니다.</div>
					<button type="button" data-toggle="modal"
						data-target="#registerModal2">이용권 구매</button>
				</c:when>
		
			</c:choose>
		</div>
			<!-- 회원가입 모달 -->
			<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="login-form-wrap">
					<div class="logform-content">
						<div id="vertical-flip" class="card">
							<div class="flip">
								<div class="front">
									<form id="form"
										action="${pageContext.request.contextPath}/ticket/kakaoPay"
										method="post">
										<div class="box-input">
											<div class="text-first">이용권을 선택해주세요.</div>
		
											<div class="text-second">원하는 멤버쉽 요금제를 선택하고 KFLIX의 모든 컨텐츠를
												즐겨보세요</div>
											<div>
		
											<c:if test="${not empty tickets }">
												<table border="1" style="width: 80%; margin-top: 30px; margin-bottom: 30px;" align="center" >
												<c:forEach items="${tickets }" var = "ticket">
													<tr style="height: 50px; border: 5px; border-color: white;">
														<td colspan="2">${ticket.ticket_name }</td>
														<td colspan="2">${ticket.ticket_price }</td>
													</tr>						
												</c:forEach>
		
												</table>			
											</c:if>
												
											</div>
											<button type="button" onclick="kakaopay();">구매</button>
											<button type="button" onclick="removePay();">정기결제해제</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<footer>
			footer
		</footer>
</div>
	<script type="text/javascript">
		function sendEmail() {

			document.getElementById('sendEmail').disabled = true;
			window.location.href = "/kflix/ticket/sendEmail";
		}

		function kakaopay() {
			var form = document.getElementById('form');

/* 			if(!$(':radio[name="ticket_class"]:checked').val()){
				alert('요금제를 선택해주세요');
				return;
			} */
			
			form.submit();
		}

		function removePay(){
			var form = document.getElementById('form');
			form.action = "${pageContext.request.contextPath}/ticket/removeKakaoPay"
			form.submit();
		}
	</script>
</body>
</html>