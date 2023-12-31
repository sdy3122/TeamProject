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
<link rel="stylesheet" href="${path}/resources/login/css/index.css" />
<style>
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="content">
				<div class="inner">
					<h1>술안주추천</h1>
					<c:choose>
						<c:when test="${empty check}">
							<p id="loginSession">로그인하세요</p>
						</c:when>
						<c:otherwise>
							<p>${sessionScope.sessionVo.userName}님환영합니다!</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<nav>
				<ul>
					<c:choose>
						<c:when test="${empty check}">
							<li><a href="#intro">소개</a></li>
							<li><a href="#login">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#choiceSul">술 선택</a></li>
							<li><a href="#logout">로그아웃</a></li>
							<li><a href="#myInfo">내정보</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<div class="miniMenu">
				<a href="#findId" id="firstA">아이디 찾기</a>
				<a href="#findPw">비밀번호 찾기</a>
				<a href="#regist" id="lastA">회원가입</a>
			</div>
		</header>

		<!-- Main -->
		<div id="main">

			<article id="intro">
				<h2 class="major">소개</h2>
				<div>
					<p>원하는 술 누르면 랜덤한 안주 3개를 추천해주고 간단한 한줄평</p>
				</div>
			</article>

			<article id="choiceSul">
				<h2 class="major">술 클릭!</h2>
				<div id="moveCenter">
					<div>
						<input id="soju" type="button" value="소주"
							onclick="hideMenu(); sojuRandomFood();" /> <input id="beer"
							type="button" value="맥주" onclick="hideMenu(); beerRandomFood()" />
						<input id="wine" type="button" value="와인"
							onclick="hideMenu(); wineRandomFood()" /> <input id="vodka"
							type="button" value="보드카" onclick="hideMenu(); vodkaRandomFood()" />
						<input id="whiskey" type="button" value="위스키"
							onclick="hideMenu(); whiskeyRandomFood()" />
					</div>
					<div id="randomFoodList">
						<p id="goFoodEva">마음에 안들면 다시 클릭</p>
						<button type="submit" class="showFood" id="showFood1">randomfood1</button>
						<button type="submit" class="showFood" id="showFood2">randomfood2</button>
						<button type="submit" class="showFood" id="showFood3">randomfood3</button>
					</div>
				</div>
				<div id="showBoardList">
					<button type="submit" value="" id="showBoardList">추천안주후기보러가기</button>
				</div>

			</article>

			<!-- Login -->
			<article id="login">
				<h2 class="major">로그인</h2>
				<form method="post" action="login"
					onsubmit="return loginCheckInfo()" accept-charset="UTF-8">
					<div class="fields">
						<div class="field half">
							<label for="ID">아이디</label> <input type="text" id="inputLoginId"
								placeholder="아이디 입력" name="userId" required="required">
						</div>
						<div class="field half">
							<label for="PW">비밀번호</label> <input type="password" id="inputLoginPw"
								placeholder="비밀번호 입력" name="userPw" required="required">
						</div>
					</div>
					<div class="myFields" id="loginInputDiv">
						<div class="myField">
							<label class="myLabel" for="loginInputLabel">loglogloglog</label>
						</div>
					</div>
					<div class="btnFields">
						<div class="field">
							<input type="submit" value="로그인" class="primary" />
						</div>
					</div>
				</form>
			</article>

			<!-- Delete -->
			<article id="delete">
				<h2 class="major">회원탈퇴</h2>
				<form>
					<div class="btnFields">
						<div class="field half">
							<button type="button" class="primary"
								onclick="location.href='/controller/deleteUser'">회원탈퇴</button>
							<button type="button" class="primary"
								onclick="location.href='#myInfo'">취소</button>
						</div>
					</div>
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
							<label for="ID">ID 15자내</label> <input type="text"
								id="inputUserId" name="userId" required="required"
								placeholder="아이디 입력" maxlength="15" value="">
						</div>
						<div class="field half">
							<label>ID중복체크</label>
							<button type="button" class="primary" id="IdDupCheck">체크</button>
						</div>
						<!-- 중복체크여부확인 -->
						<input type="hidden" id="DupCheck" name="DupCheck" value="UnCheck" />
					</div>
					<div class="myFields" id="IdDupWarning">
						<div class="myField">
							<label class="myLabel" for="IdLabelWarning">IDIDIDIDID</label>
						</div>
					</div>
					<div class="fields">
						<div class="field">
							<label for="irum">이름 10자내</label> <input type="text"
								id="userName" maxlength="10" name="userName" placeholder="이름 입력"
								required="required">
						</div>
					</div>

					<div class="fields">
						<div class="field half">
							<label for="PW">비밀번호 15자내</label> <input type="password"
								name="registPW" id="registPW" maxlength="15"
								placeholder="비밀번호 입력" onchange="checkPw()" required="required">
						</div>
						<div class="field half">
							<label for="PW">비밀번호확인</label> <input type="password"
								name="userPw" id="checkPW" placeholder="비밀번호 재입력" maxlength="15"
								onchange="checkPw()" required="required">
						</div>
					</div>
					<div class="myFields" id="PwDupWarning">
						<div class="myField">
							<label class="myLabel" for="PwLabelWarning">PWPWPWPWPW</label>
						</div>
					</div>

					<div class="fields">
						<div class="field half">
							<label>주민등록번호 앞자리</label> <input type="text" name="rn1" id="rn1"
								placeholder="주민등록번호 앞자리" maxlength="6" required="required"
								onkeyup="moveNext(this,6,document.registHard.rn2)">
						</div>
						<div class="field half">
							<label>뒷자리</label> <input type="password" name="rn2" id="rn2"
								placeholder="주민등록번호 뒷자리" maxlength="7" required="required"
								onkeyup="moveNext(this,7,document.registHard.sendBtn)">
						</div>
					</div>
					<div class="myFields" id="RnDupWarning">
						<div class="myField">
							<label class="myLabel" for="RnLabelWarning">RNRNRNRN</label>
						</div>
					</div>
					<div class="btnFields">
						<div class="field half">
							<input type="submit" value="회원가입" class="primary" name="sentBtn" />
							<input type="button" value="ID재입력" onclick="reInput();" />
						</div>
					</div>
				</form>
			</article>

			<!-- MyInfo -->
			<article id="myInfo">
				<h2 class="major">내정보</h2>
				<form action="">
					<table>
						<tr>
							<!-- 세션값을 빼올때는 sessionScope.세션이름.세션에있는값 으로 작성하면된다 -->
							<td>이름</td>
							<td><input type="text" name="userName"
								value="${sessionScope.sessionVo.userName}" readonly="readonly"></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="userId"
								value="${sessionScope.sessionVo.userId}" readonly="readonly"></td>
						</tr>
						<tr>
							<td>작성 게시글 수</td>
							<td><input type="text" name="writeCount"
								value="${sessionScope.cnt}" readonly="readonly"></td>
						</tr>
					</table>
					<div class="btnFields">
						<div class="field half">
							<button type="button"
								onclick="location.href='/controller/logout'" class="primary">로그아웃</button>
							<button type="button" onclick="location.href='#myInfoEdit'"
								class="primary">비밀번호변경</button>
							<button type="button" onclick="location.href='#delete'"
								class="primary">회원탈퇴</button>
						</div>
					</div>
				</form>
			</article>

			<!-- InfoEdit -->
			<article id="myInfoEdit">
				<h2 class="major">비밀번호변경</h2>
				<form method="post" accept-charset="UTF-8"
					onsubmit="return changePw()" action="userInfoEdit">
					<div class="fields" id="inputPw">
						<div class="field">
							<label>현재 비밀번호</label> <input type="password" id="nowPw"
								name="inputPw" required="required" placeholder="현재 비밀번호 입력">
						</div>
					</div>
					<div class="fields">
						<div class="field">
							<label>새 비밀번호</label> <input type="password" name="newRegistPw"
								id="newRegistPw" maxlength="15" placeholder="새 비밀번호 입력"
								onchange="checkNewPw()" required="required">
						</div>
						<div class="field">
							<label>비밀번호 확인</label> <input type="password" name="userPw"
								id="newCheckPw" placeholder="새 비밀번호 확인" maxlength="15"
								onchange="checkNewPw()" required="required">
						</div>
					</div>
					<div class="myFields" id="NewPwDupWarning">
						<div class="myField">
							<label class="myLabel" for="NewPwLabelWarning">PWPWPWPWPW</label>
						</div>
					</div>
					<div class="btnFields">
						<div class="field half">
							<button type="submit" class="primary">비밀번호변경</button>
							<button type="button" onclick="location.href='#myInfo'"
								class="primary">뒤로가기</button>
						</div>
					</div>
				</form>
			</article>

			<article id="findId">
				<h2 class="major">아이디찾기</h2>
				<form method="post" action="findId" name="findId"
					onsubmit="return formCheckFindId(this)" accept-charset="UTF-8">
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
					<div class="myFields" id="SRnDupWarningId">
						<div class="myField">
							<label class="myLabel" for="SRnLabelWarningId">RNRNRNRN</label>
						</div>
					</div>
					<div class="btnFields">
						<div class="field half">
							<input type="submit" value="찾기" class="primary"
							name="sentBtn" />
						</div>
					</div>
				</form>
			</article>

			<article id="findPw">
				<h2 class="major">비밀번호찾기</h2>
				<form method="post" action="findPw" name="findPw"
					onsubmit="return formCheckFindPw(this)" accept-charset="UTF-8">
					<div class="fields">
						<div class="field half">
							<label for="Name">이름입력</label> <input type="text" id="userName"
								name="userName" required="required" placeholder="이름 입력"
								maxlength="10">
						</div>
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
					<div class="myFields" id="SRnDupWarningPw">
						<div class="myField">
							<label class="myLabel" for="SRnLabelWarningPw">RNRNRNRN</label>
						</div>
					</div>
					<div class="btnFields">
						<div class="field half">
							<input type="submit" value="찾기" class="primary"
							name="sentBtn" />
						</div>
					</div>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Scripts -->
	<script src="${path}/resources/login/js/browser.min.js"></script>
	<script src="${path}/resources/login/js/breakpoints.min.js"></script>
	<script src="${path}/resources/login/js/util.js"></script>
	<script src="${path}/resources/login/js/main.js"></script>

</body>
</html>