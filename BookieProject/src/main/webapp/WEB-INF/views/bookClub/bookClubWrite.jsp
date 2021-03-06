<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>club 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- summernote -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/bookclub/write.js"></script>
<link rel="stylesheet" href="/resources/css/totalCss.css">
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
		<div class='loader'></div>
		<div class="black-box"></div>
		<div class="container">
			<div
				style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto">
				<img src="../resources/images/banner-write.jpg" class="img-rounded"
					alt="Cinque Terre" width="100%" height="100%">
			</div>
		</div>

		<div class="container">
			<form class="form-container text-center">
				<div class="form-group text-left row">
					<div class="col-xs-12">
						<c:choose>
							<c:when test="${not empty board.title}">
								<input type="text" class="form-control" name="title"
									value='${board.title }'>
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" name="title"
									placeholder="제목">
							</c:otherwise>
						</c:choose>
					</div>
					<input type="hidden" id="hidden" name="uEmail"
						value="${user.getUEmail()}"> <input type="hidden"
						id="board_id" value="${board.id }">
				</div>
				<div class="form-group">
					<c:choose>
						<c:when test="${not empty board.content }">
							<textarea class="form-control" id="summernote" name="content">${board.content}</textarea>
							<button type="button" name="editButton"
								class="btn btn-default btn-block">수정하기</button>
						</c:when>
						<c:otherwise>
							<textarea class="form-control " id="summernote" name="content"></textarea>
							<button type="submit" name="submitButton"
								class="btn btn-default btn-block">작성하기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</div>
	<footer id="footerBg">
		<div class="container">
			<br>
			<div class="row" id="footerFont">
				<div class="col-sm-4">
					<h4>Introduce</h4>
					<p>For those who are interested in reading, after reading a book, 
						they can leave simple texts or ask and answer each other's questions, 
						and through the reading club bulletin board, you can find a reading club 
						and recruit club members.</p>
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
				placeholder : '글을 작성하세요...',
				lang : 'ko-KR',
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