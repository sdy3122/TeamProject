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
<link rel="stylesheet" href="${path}/resources/assets/css/main.css" />
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
							<p>${sessionScope.data.mname}님환영합니다!</p>
						</c:otherwise>
					</c:choose>
					<c:if test="${!empty fail}">
						<p>아이디중복으로인한 회원가입실패</p>
					</c:if>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="#intro">소개</a></li>
					<c:choose>
						<c:when test="${empty check}">
							<li><a href="#login">로그인</a></li>
							<li><a href="#regist">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#logout">로그아웃</a></li>
							<li><a href="#">내정보</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<div id="main">

			<article id="intro">
				<h2 class="major">학사관리</h2>
				<div>
					<ul>
						<li id="registHaksa"><a>등록</a></li>
						<li id="deleteHaksa"><a>삭제</a></li>
						<li id="searchHaksa"><a>검색</a></li>
						<li id="editHaksa"><a>수정</a></li>
						<li id="listHaksa"><a>전체출력</a></li>
					</ul>
				</div>
				<!-- 숨겨진 메뉴 토글로 보이기 -->
				<div id="hideDivUl">
					<div class="hideAll" id="registToggle">
						<ul class="listShow">
							<li><a href="#intro">학생등록</a></li>
							<li><a href="#intro">교수등록</a></li>
							<li><a href="#intro">관리자등록</a></li>
						</ul>
					</div>
					<div class="hideAll" id="deleteToggle">
						<ul class="listShow">
							<li><a href="#intro">학생삭제</a></li>
							<li><a href="#intro">교수삭제</a></li>
							<li><a href="#intro">관리자삭제</a></li>
						</ul>
					</div>
					<div class="hideAll" id="searchToggle">
						<ul class="listShow">
							<li><a href="#intro">학생검색</a></li>
							<li><a href="#intro">교수검색</a></li>
							<li><a href="#intro">관리자검색</a></li>
						</ul>
					</div>
					<div class="hideAll" id="editToggle">
						<ul class="listShow">
							<li><a href="#intro">학생수정</a></li>
							<li><a href="#intro">교수수정</a></li>
							<li><a href="#intro">관리자수정</a></li>
						</ul>
					</div>
					<div class="hideAll" id="listToggle">
						<ul class="listShow">
							<li><a href="#intro">학생출력</a></li>
							<li><a href="#intro">교수출력</a></li>
							<li><a href="#intro">관리자출력</a></li>
						</ul>
					</div>
				</div>

			</article>

			<!-- Board-->
			<article id="board">
				<h2 class="major">게시판</h2>
				<form method="post" name="goBoard">
					<table border="1">
						<tr>
							<th>글번호</th>
							<th>글작성자</th>
							<th>작성일</th>
						</tr>
						<c:forEach var="sdy" items="${dyoung}">
							<tr>
								<td><a href="board.do?bid=${sdy.bid}">${sdy.bid}</a></td>
								<td>${sdy.writer}</td>
								<td>${sdy.regdate}</td>
							</tr>
						</c:forEach>
					</table>
					<button type="submit" formaction="insert.jsp">글작성</button>
				</form>
			</article>

			<!-- Login -->
			<article id="login">
				<h2 class="major">로그인</h2>
				<form method="post" action="login.do">
					<div class="fields">
						<div class="field half">
							<label for="ID">아이디</label> <input type="text" id="inputID"
								placeholder="아이디 입력" name="memberId" required="required">
						</div>
						<div class="field half">
							<label for="PW">비밀번호</label> <input type="password" id="iputPW"
								placeholder="비밀번호 입력" name="memberPw" required="required">
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="로그인" class="primary" /></li>
						<li><input type="reset" value="리셋" /></li>
					</ul>
				</form>
			</article>
			<!-- Logout -->
			<article id="logout">
				<h2 class="major">로그아웃</h2>
				<form method="post">
					<button type="submit" class="primary" id="sdyMargin"
						formaction="logout.do">로그아웃</button>
					<button type="submit" class="primary" formaction="index.jsp">취소</button>
				</form>
			</article>
			<!-- Regist -->
			<article id="regist">
				<h2 class="major">회원가입</h2>
				<!-- onsubmit return + 함수() = 클릭시 함수호출 -->
				<form method="post" action="regist" name="registHard"
					onsubmit="return formCheck(this)">
					<div class="fields">
						<div class="field half">
							<label for="ID">아이디 15자내</label> <input type="text" id="registID"
								name="registID" required="required" placeholder="아이디 입력"
								onkeydown="inputIDCheck">
						</div>
						<div class="field half">
							<label for="irum">이름 10자내</label> <input type="text" id="irum"
								name="irum" placeholder="이름 입력" required="required">
						</div>
					</div>

					<div class="fields">
						<div class="field half">
							<label for="PW">비밀번호 15자내</label> <input type="password"
								id="registPW" name="registPW" id="registPW"
								placeholder="비밀번호 입력" onchange="checkPw()" required="required">
						</div>
						<div class="field half">
							<label for="PW">비밀번호확인</label> <input type="password"
								name="checkPW" id="checkPW" placeholder="비밀번호 재입력"
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
		</div>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; Design: 서덕영</p>
		</footer>

	</div>

	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="${path}/resources/assets/js/jquery.min.js"></script>
	<script src="${path}/resources/assets/js/browser.min.js"></script>
	<script src="${path}/resources/assets/js/breakpoints.min.js"></script>
	<script src="${path}/resources/assets/js/util.js"></script>
	<script src="${path}/resources/assets/js/main.js"></script>
	<!-- 추가 스크립트 -->
	<script>
		
	</script>
</body>
</html>
