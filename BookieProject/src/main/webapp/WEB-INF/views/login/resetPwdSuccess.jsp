<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password Success</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/login/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/resources/js/login/main.js"></script>
<script src="/resources/js/login/findPassword.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">BooKie</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/bookcard/main">글귀</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Q&A<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/qna/board?g=1&p=1">소설 시 희곡</a></li>
							<li><a href="/qna/board?g=2&p=1">에세이</a></li>
							<li><a href="/qna/board?g=3&p=1">인문학</a></li>
							<li><a href="/qna/board?g=4&p=1">경제경영</a></li>
							<li><a href="/qna/board?g=5&p=1">사회과학</a></li>
							<li><a href="/qna/board?g=6&p=1">종교</a></li>
							<li><a href="/qna/board?g=7&p=1">예술</a></li>
						</ul></li>
					<li><a href="/club/main">독서 클럽</a></li>
					<li><a href="/cs">고객센터</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/mypage/info"><span
							class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
					<!-- 로그인 안했을 시, Login 버튼이 보임 -->
					<sec:authorize access="isAnonymous()">
						<li><a href="/login"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</sec:authorize>
					<!-- 로그인 했을 시, Logout 버튼 보임  -->
					<sec:authorize access="isAuthenticated()">
						<li><a href='#'
							onclick="document.getElementById('logout').submit();"> <span
								class="glyphicon glyphicon-log-out"></span> Logout
						</a></li>
						<form id='logout' action="/logout" method="post"
							style="diplay: none">
							<input type="hidden" name='${_csrf.parameterName}'
								value='${_csrf.token}' />
						</form>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>

	<p class="resetPwdSuccess">비밀번호 재설정이 완료되었습니다.</p>
	<a href="/">메인 화면으로 가기</a>
</body>
</html>