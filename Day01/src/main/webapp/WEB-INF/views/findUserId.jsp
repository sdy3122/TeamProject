<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>회원정보조회</title>
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
				<h2 class="major">아이디조회결과</h2>
				<form method="post" accept-charset="UTF-8">
					<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName"
							value="${inputName}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>주민등록번호 앞자리</td>
						<td><input type="text" name="userRn1"
							value="${inputRn1}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>조회된 아이디</td>
						<td><input type="text" name="userId"
							value="${findId}" readonly="readonly"></td>
					</tr>
				</table>
					<button type="button" onclick="location.href='#findPw'"
						class="primary">PW찾기</button>
					<button type="submit" formaction="/controller"
						class="primary">메인화면</button>
				</form>
			</article>
		</header>

		<!-- Main -->
		<div id="main">

			<article id="findPw">
				<h2 class="major">비밀번호찾기</h2>
				<form method="post" action="findPw" name="findPw"
					onsubmit="return formCheck(this)" accept-charset="UTF-8">
					<div class="fields">
						<div class="field half">
							<label for="Name">이름입력</label> <input type="text" id="userName"
								name="userName" required="required" placeholder="이름 입력"
								maxlength="10">
						</div>
					</div>
					<div class="fields">
						<div class="field half">
							<label for="ID">아이디입력</label> <input type="text" id="userId"
								name="userId" required="required" placeholder="아이디 입력"
								maxlength="10">
						</div>
					</div>
					<div class="fields">
						<div class="field half">
							<label for="Rn1">주민등록번호 앞자리</label> <input type="text" name="rn1"
								id="rn1" placeholder="주민등록번호 앞자리" maxlength="6"
								required="required"
								onkeyup="moveNext(this,6,document.findPw.rn2)">
						</div>
						<div class="field half">
							<label for="Rn2">뒷자리</label> <input type="password" name="rn2"
								id="rn2" placeholder="주민등록번호 뒷자리" maxlength="7"
								required="required"
								onkeyup="moveNext(this,7,document.findPw.sendBtn)">
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="비밀번호찾기" class="primary"
							name="sentBtn" /></li>
					</ul>
				</form>
			</article>

			<!-- 여가 끝남 -->
		</div>

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