<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>한잔해</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/main/css/main.css" />
<style>
</style>
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Logo -->
			<h1>
				<a href="/" id="logo"><em>페이지 이름 정해라</em></a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="current"><a href="/">메인화면</a></li>
					<li><a href="/choiceSulPage">안주 추천</a></li>
					<li><a href="#">랜덤채팅</a></li>
					<li><a href="#">게시판</a>
						<ul>
							<li><a href="#">소주게시판</a></li>
							<li><a href="#">맥주게시판</a></li>
							<li><a href="#">와인게시판</a></li>
							<li><a href="#">보드카게시판</a></li>
							<li><a href="#">위스키게시판</a></li>
						</ul></li>

					<c:choose>
						<c:when test="${empty check}">
							<li><a href="/loginPage">로그인</a>
								<ul>
									<li><a href="/findIdPage">아이디찾기</a></li>
									<li><a href="/findPwPage">비밀번호찾기</a></li>
									<li><a href="/registPage">회원가입</a></li>
								</ul></li>
						</c:when>
						<c:otherwise>
						<li><a href="/myInfoPage">${sessionScope.sessionVo.userName}님</a>
								<ul>
									<li><a class="loginATag" href="/logout">로그아웃</a></li>
									<li><a class="loginATag" href="/myInfoEdit">비밀번호변경</a></li>
									<li><a class="loginATag" href="/deleteInfoPage">회원탈퇴</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>

		</div>

		<!-- Banner -->
		<section id="banner">
			<header>
				<h2>
					이거: <em>개어렵네 <a
						href="http://html5up.net">HTML5 UP</a></em>
				</h2>
				<a href="#" class="button">Learn More</a>
			</header>
		</section>

		
		<!-- Footer -->
		<div id="footer">
			
			<!-- Copyright -->
			<div class="copyright">
				<p class="copyright">&copy; Design: 서덕영</p>
			</div>

		</div>

	</div>

	<!-- Scripts -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="${path}/resources/main/js/jquery.dropotron.min.js"></script>
	<script src="${path}/resources/main/js/browser.min.js"></script>
	<script src="${path}/resources/main/js/breakpoints.min.js"></script>
	<script src="${path}/resources/main/js/util.js"></script>
	<script src="${path}/resources/main/js/main.js"></script>

</body>
</html>