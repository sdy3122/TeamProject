<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>회원정보조회실패</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/css/loginFail.css" />
<style>
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<article id="login">
				<h2 class="major">비밀번호조회결과</h2>
				<form method="post" accept-charset="UTF-8">
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="userName" value="${inputName}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>주민등록번호 앞자리</td>
							<td><input type="text" name="userRn1" value="${inputRn1}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="userId" value="${inputId}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<p>해당 정보로 조회되는 비밀번호가 없습니다</p>
						</tr>
					</table>
					<p>
						<br> <a href="/controller/">메인화면</a>
					</p>
				</form>
			</article>
		</header>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; Design: 서덕영</p>
		</footer>

	</div>

	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="${path}/resources/js/jquery.min.js"></script>
	<script src="${path}/resources/js/browser.min.js"></script>
	<script src="${path}/resources/js/breakpoints.min.js"></script>
	<script src="${path}/resources/js/util.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<!-- 추가 스크립트 -->
	<script>
		
	</script>
</body>
</html>