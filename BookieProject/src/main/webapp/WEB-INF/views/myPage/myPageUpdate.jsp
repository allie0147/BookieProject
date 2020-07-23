<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/mypage/update.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/resources/js/mypage/update.js"></script>
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
		<div class="container">
			<div style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto">
			<img src="../resources/images/banner-mypageUpdate.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="100%"></div>
		</div>

		<div class="container">
			<div class="container-fluid bg">
				<div class="div-container">
					<form class="form-container">
						<div>
							<input type="hidden" name="id" value="${mypageInfo.id}" />
						</div>
						<div class="form-group text-white">
							<b>Email</b> <input type="email" class="form-control"
								name="email" value="${mypageInfo.getUEmail() }"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="inputNickName">NICKNAME</label> <input type="text"
								class="form-control" id="inputNickName" name="nickname"
								value="${mypageInfo.nickname }">
						</div>
						<div class="form-group">
							<label for="phone">PHONE</label> <input type="text"
								class="form-control" id="phone" name="phone"
								value="${mypageInfo.phone }">
						</div>
						<div class="form-group">
							<label for="inputPassword1">INTEREST GENRE</label><br>
							<c:forEach var="interest" items="${allInterestList }"
								varStatus="status">
								<c:if
									test="${mypageInfo.interestList.contains(interest) == false}">
									<input type="checkbox" id="gen${interest.genreId }"
										name="interest" value="${interest.genreId }">
									<label for="gen${interest.genreId }">${interest.genreName }</label>&nbsp;
							</c:if>
								<c:if
									test="${mypageInfo.interestList.contains(interest) == true}">
									<input checked="checked" type="checkbox"
										id="gen${interest.genreId }" name="interest"
										value="${interest.genreId }">
									<label for="gen${interest.genreId }">${interest.genreName }</label>&nbsp;
							</c:if>
							</c:forEach>
						</div>
						<div class="form-group">
							<b>가입일</b> <input type="text" class="form-control"
								name="inputRegDate" value="${mypageInfo.regDate }"
								readonly="readonly">
						</div>
						<p>* Email과 가입일은 수정 할 수 없습니다</p>
						<hr>
						<div class="col text-center">
							<input type="submit" value="수 정" class="btn btn-success">
						</div>
					</form>
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
						<a href="https://www.aladin.co.kr/" target="_blank">aladin</a>
					</h5>
					<h5>
						<a href="http://www.bandinlunis.com/" target="_blank">bandinluis</a>
					</h5>
					<h5>
						<a href="http://www.yes24.com/" target="_blank">yes24</a>
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