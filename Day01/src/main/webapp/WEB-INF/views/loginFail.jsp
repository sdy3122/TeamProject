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
				<h2 class="major">로그인 실패</h2>
				<form method="post" action="login" name="loginHard"
					accept-charset="UTF-8">
					<div class="fields">
						<div class="field half">
							<label for="ID">아이디</label> <input type="text" id="userId"
								placeholder="아이디 입력" name="userId" required="required">
						</div>
						<div class="field half">
							<label for="PW">비밀번호</label> <input type="password" id="userPw"
								placeholder="비밀번호 입력" name="userPw" required="required">
						</div>
					</div>
					<div class="btnFields">
						<div class="field half">
							<button type="submit" class="primary">로그인</button>
					<button type="button" onclick="location.href='#findId'"
						class="primary">ID찾기</button>
					<button type="button" onclick="location.href='#findPw'"
						class="primary">PW찾기</button>
					<button type="button" onclick="location.href='#regist'"
						class="primary">회원가입</button>
						</div>
					</div>
					<p>
						<br><a href="/controller/">메인화면</a>
					</p>
				</form>
			</article>
		</header>

		<!-- Main -->
		<div id="main">

			<article id="findId">
				<h2 class="major">아이디찾기</h2>
				<form method="post" action="findId" name="findId"
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
							<label for="Rn1">주민등록번호 앞자리</label> <input type="text" name="rn1"
								id="rn1" placeholder="주민등록번호 앞자리" maxlength="6"
								required="required"
								onkeyup="moveNext(this,6,document.findId.rn2)">
						</div>
						<div class="field half">
							<label for="Rn2">뒷자리</label> <input type="password" name="rn2"
								id="rn2" placeholder="주민등록번호 뒷자리" maxlength="7"
								required="required"
								onkeyup="moveNext(this,7,document.findId.sendBtn)">
						</div>
					</div>
					<div class="myFields" id="RnDupWarning">
						<div class="myField">
							<label class="myLabel" for="RnLabelWarning">RNRNRNRN</label>
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="ID찾기" class="primary"
							name="sentBtn" /></li>
					</ul>
				</form>
			</article>
			
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
			
			<!-- Regist -->
			<article id="regist">
				<h2 class="major">회원가입</h2>
				<!-- onsubmit return + 함수() = 클릭시 함수호출 -->
				<form method="post" action="regist" name="registHard"
					onsubmit="return formCheck(this)" accept-charset="UTF-8">
					<div class="fields">
						<div class="field half">
							<label for="ID">아이디 15자내</label> <input type="text" id="userId"
								name="userId" required="required" placeholder="아이디 입력"
								maxlength="15" onkeydown="inputIDCheck">
						</div>
						<div class="field half">
							<label for="irum">이름 10자내</label> <input type="text" id="userName"
								maxlength="10" name="userName" placeholder="이름 입력"
								required="required">
						</div>
					</div>

					<div class="fields">
						<div class="field half">
							<label for="PW">비밀번호 15자내</label> <input type="password"
								id="registPW" name="registPW" maxlength="15"
								placeholder="비밀번호 입력" onchange="checkPw()" required="required">
						</div>
						<div class="field half">
							<label for="PW">비밀번호확인</label> <input type="password"
								name="userPw" id="checkPW" placeholder="비밀번호 재입력" maxlength="15"
								onchange="checkPw()" required="required">
						</div>
					</div>

					<div class="fields">
						<div class="field half">
							<label for="PW">주민등록번호 앞자리</label> <input type="text" name="rn1"
								id="rn1" placeholder="주민등록번호 앞자리" maxlength="6"
								required="required"
								onkeyup="moveNext(this,6,document.registHard.rn2)">
						</div>
						<div class="field half">
							<label for="PW">뒷자리</label> <input type="password" name="rn2"
								id="rn2" placeholder="주민등록번호 뒷자리" maxlength="7"
								required="required"
								onkeyup="moveNext(this,7,document.registHard.sendBtn)">
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="회원가입" class="primary"
							name="sentBtn" /></li>
						<li><input type="reset" value="리셋" /></li>
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
	<script src="${path}/resources/js/loginFail.js"></script>
	<!-- 추가 스크립트 -->
	<script>
		
	</script>
</body>
</html>