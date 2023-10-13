<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/board/css/main.css" />
</head>
<body class="single is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="/">메인화면</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="#">통합커뮤니티</a></li>
					<li><a href="#">소주</a></li>
					<li><a href="#">맥주</a></li>
					<li><a href="#">와인</a></li>
					<li><a href="#">보드카</a></li>
					<li><a href="#">위스키</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="#">
							<h3>Lorem ipsum</h3>
							<p>Feugiat tempus veroeros dolor</p>
					</a></li>
					<li><a href="#">
							<h3>Dolor sit amet</h3>
							<p>Sed vitae justo condimentum</p>
					</a></li>
					<li><a href="#">
							<h3>Feugiat veroeros</h3>
							<p>Phasellus sed ultricies mi congue</p>
					</a></li>
					<li><a href="#">
							<h3>Etiam sed consequat</h3>
							<p>Porta lectus amet ultricies</p>
					</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions stacked">
					<li><a href="#" class="button large fit">Log In</a></li>
				</ul>
			</section>

		</section>

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">${showBoard.title}</a>
						</h2>
					</div>
					<div class="meta">
						<time class="published" datetime="${showBoard.regdate}">${showBoard.regdate}</time>
						<a href="#" class="author"><span class="name">${showBoard.writer}</span><img
							src="images/avatar.jpg" alt="" /></a>
					</div>
				</header>
				<p>${showBoard.content}</p>
				<footer>
					<ul class="stats">
						<li><a href="#" class="icon solid fa-heart">${showBoard.likeBtn}</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer>
			</article>

		</div>

		<!-- Footer -->
		<section id="footer">
			<p class="copyright">
				&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.
				Images: <a href="http://unsplash.com">Unsplash</a>.
			</p>
		</section>

	</div>

	<!-- Scripts -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="${path}/resources/board/js/browser.min.js"></script>
	<script src="${path}/resources/board/js/breakpoints.min.js"></script>
	<script src="${path}/resources/board/js/util.js"></script>
	<script src="${path}/resources/board/js/main.js"></script>

</body>
</html>