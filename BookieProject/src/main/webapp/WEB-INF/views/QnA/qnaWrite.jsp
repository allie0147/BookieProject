<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/css/bootstrap.min.js"></script>
<!-- summernote -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"	rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
					data-toggle="dropdown">Q&A<span class="caret"></span></a>
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
	</nav>

	<div class="container">
		<div
			style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto"></div>
		<!-- <img src="images/books.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="350px"> -->
	</div>

	<div class="container">
		<form class="form-container text-center" action="index.html"
			method="post">
			<div class="form-inline text-left">
				<div class="form-group">
					<input type="text" class="form-control col-sm-8" placeholder="제목">
				</div>
				<div class="form-group">
					<select class="form-control" name="genre" style="cursor: pointer;">
						<option value="0" selected="selected">==장르 선택==</option>
						<option value="1">소설/시/희곡</option>
						<option value="2">에세이</option>
						<option value="3">인문학</option>
						<option value="4">경제경영</option>
						<option value="5">사회과학</option>
						<option value="6">종교</option>
						<option value="7">예술</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<textarea class="form-control " id="summernote" name="content"></textarea>
				<button type="submit" name="submitButton"
					class="btn btn-default btn-block">작성하기</button>
			</div>
		</form>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$('#summernote').summernote({
				placeholder : '이곳에 글을 작성하세요',
				height : 400,
				maxheight : 2000,
				focus : true,
				codeviewFilter : false,
				codeviewIframeFilter : true
			});
		});
	</script>
</body>
</html>