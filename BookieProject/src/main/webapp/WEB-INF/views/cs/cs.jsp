<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrp.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/cs/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/">BooKie</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/bookcard/main">글귀</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Q&A<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/qna/main?g=1">소설 시 희곡</a></li>
						<li><a href="/qna/main?g=2">에세이</a></li>
						<li><a href="/qna/main?g=3">인문학</a></li>
						<li><a href="/qna/main?g=4">경제경영</a></li>
						<li><a href="/qna/main?g=5">사회과학</a></li>
						<li><a href="/qna/main?g=6">종교</a></li>
						<li><a href="/qna/main?g=7">예술</a></li>
					</ul></li>
				<li><a href="/club/main">독서 클럽</a></li>
				<li><a href="/cs">고객센터</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/mypage"><span
						class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
				<!-- 로그인 안했을 시, Login 버튼이 보임 -->
			 <sec:authorize access="isAnonymous()">
				<li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			 </sec:authorize>
			<!-- 로그인 했을 시, Logout 버튼 보임  -->
			<sec:authorize access="isAuthenticated()">
				<li><a href='#' onclick="document.getElementById('logout').submit();" >
				<span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			<form id= 'logout' action="/logout" method="post" style="diplay:none">
				<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}'/>
			</form>
		 	</sec:authorize>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div
			style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto"></div>
		<!-- <img src="images/books.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="350px"> -->
	</div>

	<!-- 고객센터 페이지의 문의 제목, 내용 입력칸 너비 줄이기, send 버튼 위치 이동(위 사진의 오른편 여백과 맞춰서) -->
	<div id="contact" class="container">
		<h3>문의하기</h3>
		<br>
		<div class="row">
			<div class="col-md-4">
				<h4>고 객 지 원</h4>
				<p>
				<h5>AM 10:00 ~ PM 06:30</h5>
				</p>
				<p>
				<h5>Lunch PM 12:30 ~ 01:30</h5>
				</p>
				<p>
				<h5>* 법정 공휴일 제외</h5>
				</p>
			</div>
			<div class="col-md-8">
				<div class="row">
					<form class="form-inline">
						<div class="form-group">
							<label for="exampleInputName2">Name</label> <input type="text"
								class="form-control" id="exampleInputName2" placeholder="이름">&nbsp;&nbsp;
						</div>
						<div class="form-group">
							<label for="exampleInputEmail2">Email</label> <input type="email"
								class="form-control" id="exampleInputEmail2" placeholder="이메일">
						</div>
					</form>
					<hr>
					<input class="form-control" id="comments" name="comments"
						placeholder="제목" rows="1"></input>
					<textarea class="form-control" id="comments" name="comments"
						placeholder="내용" rows="5"></textarea>
					<br>
					<div class="row">
						<div class="col-md-12 form-group">
							<button class="btn pull-right btn-default" type="submit">Send</button>
						</div>
					</div>
				</div>
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
