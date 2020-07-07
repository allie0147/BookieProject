<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="/">BooKie</a>
	    </div>
	    <ul class="nav navbar-nav">
			<li><a href="/bookcard/main">글귀</a></li>
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Q&A<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/qna/main?g=1">소설 시 희곡</a></li>
						<li><a href="/qna/main?g=2">에세이</a></li>
						<li><a href="/qna/main?g=3">인문학</a></li>
						<li><a href="/qna/main?g=4">경제경영</a></li>
						<li><a href="/qna/main?g=5">사회과학</a></li>
						<li><a href="/qna/main?g=6">종교</a></li>
						<li><a href="/qna/main?g=7">예술</a></li>
					</ul>
	      	</li>
	      <li><a href="/club/main">독서 클럽</a></li>
	      <li><a href="/cs">고객센터</a></li>
	    </ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/mypage/info"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
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
		<!-- <img src="images/mypage2.png" class="img-rounded" alt="Cinque Terre" width="95%" height="250px">-->
	</div>

<div class="container">
  <div class="container-fluid bg">
		<div class="div-container">

				<form class="form-container" action="#" method="post">
					<div class="form-group text-white">
						<b>Email</b> <input type="email" class="form-control" name="name"
							value="my@email.com" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="inputNickName">NICKNAME</label> <input type="text"
							class="form-control" id="inputNickName" name="nicname"
							value="userNicName">
					</div>
					<div class="form-group">
						<label for="phone">PHONE</label> <input type="text"
							class="form-control" id="phone" name="phone"
							value="000-0000-0000">
					</div>
					<div class="form-group">
						<label for="inputPassword1">GENRE</label><br> <input
							type="checkbox" id="gen1" name="gen1" value="sosihe"> <label
							for="gen1"> 소설, 시, 희곡</label>&nbsp; <input type="checkbox"
							id="gen2" name="gen2" value="esse"> <label for="gen2">
							에세이</label>&nbsp; <input type="checkbox" id="gen3" name="gen3"
							value="inmoon"> <label for="gen3"> 인문학</label>&nbsp; <input
							type="checkbox" id="gen4" name="gen4" value="inmoon"> <label
							for="gen4"> 경제 경영</label>&nbsp; <input type="checkbox" id="gen5"
							name="gen5" value="inmoon"> <label for="gen5"> 사회
							과학</label>&nbsp; <input type="checkbox" id="gen6" name="gen6"
							value="inmoon"> <label for="gen6"> 종교</label>&nbsp; <input
							type="checkbox" id="gen7" name="gen7" value="inmoon"> <label
							for="gen7"> 예술</label>&nbsp;
					</div>
					<div class="form-group">
						<b>가입일</b> <input type="text" class="form-control"
							name="inputRegDate" value="2020-06-30" readonly="readonly">
					</div>
					<p>* Email과 가입일은 수정 할 수 없습니다</p>
          <hr>
					<div class="col text-center">
						<button type="submit" class="btn btn-danger">수 정</button>
					</div>
				</form>
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
							to make a space where I can exchange questions and answers
							related to books.</p>
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
						<!-- target 설정: 새창으로 변경 -->
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