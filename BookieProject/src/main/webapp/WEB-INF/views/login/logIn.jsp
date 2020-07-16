<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
</head>
<body>
	<div class="main-body">
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
							data-toggle="dropdown">Q&A<span class="caret"></span></a>
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
					</ul>
				</div>
			</div>
		</nav>

		<div class="container-fluid bg">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="form-container">
						<form action="/loginProc" method="post">
							<div class="form-group text-white">
								<label for="inputEmail1">Email</label>
								<c:choose>
									<c:when test="${not empty loginEmail}">
										<input type="email" class="form-control" id="inputEmail1"
											name="uEmail" aria-describedby="emailHelp"
											required="required" value="${loginEmail}">
									</c:when>
									<c:otherwise>
										<input type="email" class="form-control" id="inputEmail1"
											name="uEmail" aria-describedby="emailHelp"
											required="required">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="form-group">
								<c:choose>
									<c:when test="${not empty loginPwd}">
										<label for="inputPassword1">Password</label>
										<input type="password" class="form-control"
											id="inputPassword1" name="uPwd" required="required"
											value="${loginPwd}">
									</c:when>
									<c:otherwise>
										<label for="inputPassword1">Password</label>
										<input type="password" class="form-control"
											id="inputPassword1" name="uPwd" required="required">
									</c:otherwise>
								</c:choose>
							</div>
							<c:if test="${not empty ERRORMSG }">
								<div class="alert alert-danger" role="alert"
									style='margin-top: 10px; font-size: small; word-spacing: 1px;'>
									<span>${ERRORMSG}</span>
								</div>
							</c:if>
							<div>
								<label><input type="checkbox" name='remember-me' /> 자동
									로그인 </label>
							</div>
							<input type="submit" class="btn btn-block btn-info" value="LogIn">
							<input type="hidden" id="hidden" name='${_csrf.parameterName}'
								value='${_csrf.token}'>
						</form>
						<button id="signup" type="button"
							class="btn btn-block btn-default" style="margin-top: 5px;">회원가입</button>
						<div class="text-center">
							<p>
								<span><a href="javascript:popupEmail()">이메일찾기</a></span> <span
									class="vertical"></span>&nbsp; <span><a
									href="javascript:popupPassword()">비밀번호 찾기</a></span>
							</p>
						</div>
						<hr>
						<a class="btn btn-block btn-warning"
							href="https://kauth.kakao.com/oauth/authorize?client_id=cd1ddf2d9fa9a72e806a543b015dd1bd&redirect_uri=http://localhost:8080/kakaologin&response_type=code">카카오
							로그인</a>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
			</div>
		</div>
	</div>
	<footer id="footerBg">
		<div class="container">
			<br>
			<div class="row" id="footerFont">
				<div class="col-sm-4">
					<h4>Introduce</h4>
					<p>I have studied Java, HTML, Python, Jquari, etc. and I want
						to make a space where I can exchange questions and answers related
						to books.</p>
				</div>
				<div class="col-sm-4">
					<h4>Contact</h4>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span>Jongak, Seoul
					</p>
					<p>
						<span class="glyphicon glyphicon-phone"></span>Phone: +82
						1082747414
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span>Email:
						hth0411@naver.com
					</p>
				</div>
				<div class="col-sm-4">
					<h4>store</h4>
					<h5>
						<a href="https://www.aladin.co.kr/">aladin</a>
					</h5>
					<h5>
						<a href="http://www.bandinlunis.com/">bandinluis</a>
					</h5>
					<h5>
						<a href="http://www.yes24.com/">yes24</a>
					</h5>
				</div>
				<br>
				<div class="col-sm-12 text-center">
					<h5>Copyright &copy; 2020.ALL RIGHTS RESERVED.</h5>
					<h5>Allie Dohee Kim</h5>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>