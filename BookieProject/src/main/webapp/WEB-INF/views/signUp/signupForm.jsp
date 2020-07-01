<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/signup/main.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/css/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/signup/main.js"></script>
</head>
<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="/">BooKie</a>
	    </div>
	    <ul class="nav navbar-nav">
			<li class="active"><a href="/">글귀</a></li>
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
			<li><a href="/mypage"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
			<li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	    </ul>
	  </div>
	</nav>
	<div class="container-fluid bg">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<form class="form-container" action="/userForm" method="post">
					<!-- spring 유효성 검사로 post : SignUpController.java-->
					<h1>회원 가입 폼폼이</h1>
					<div>
						<span>이메일</span><span>*필수</span>
					</div>
					<div>
						<c:choose>
							<c:when test="${uEmail!=null }">
								<input type="text" class="form-control" value="${ uEmail}"
									name="uEmail" id="email" readonly="readonly">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" name="uEmail" id="email">
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<button class="btn btn-warning" type="button" name="emailBtn">이메일
							인증</button>
					</div>
					<div class="errorBox">
						<span class='error' id='error01'>에러 01</span>
					</div>
					<div>
						<span>비밀번호</span><span>*필수</span>
					</div>
					<div>
						<input type="password" class="form-control" name="uPwd" id="uPwd">
					</div>
					<div class="errorBox">
						<span class='error' id='error02'>에러 02</span>
					</div>
					<div>
						<span>비밀번호 확인</span><span>*필수</span>
					</div>
					<div>
						<input type="password" class="form-control" name="uPwdRe"
							id="uPwdRe">
					</div>
					<div class="errorBox">
						<span class='error' id='error03'>에러 03</span>
					</div>
					<div>
						<span>닉네임</span><span>*필수</span>
					</div>
					<div>
						<c:choose>
							<c:when test="${nickname!=null }">
								<input type="text" class="form-control" name="nickname"
									id="nickname" value="${nickname }" readonly="readonly">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" name="nickname"
									id="nickname">
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<button type="button" name="nickBtn">사용하기</button>
					</div>
					<div class="errorBox">
						<span class='error' id='error04'>에러 04</span>
					</div>
					<div>
						<span>휴대폰</span><span>*필수</span>
					</div>
					<div>
						<input type="tel" class="form-control" name="phone" id="phone">
					</div>
					<div class="errorBox">
						<span class='error' id='error05'>에러 05</span>
					</div>
					<div>
						<span>선호하는 장르</span><span>*필수</span>
					</div>
					<div>
						<input type="checkbox" name="interest" id="1" value="1"><label
							for="1">소설/시/희곡</label><input type="checkbox" name="interest"
							id="2" value="2"><label for="2">에세이</label><input
							type="checkbox" name="interest" id="3" value="3"><label
							for="3">인문학</label> <input type="checkbox" name="interest" id="4"
							value="4"><label for="4">경제/경영</label><input
							type="checkbox" name="interest" id="5" value="5"><label
							for="5">사회과학</label><input type="checkbox" name="interest" id="6"
							value="6"><label for="6">종교</label><input type="checkbox"
							name="interest" id="7" value="7"><label for="7">예술</label>
					</div>
					<div class="errorBox">
						<span class='error' id='error06'>에러 06</span>
					</div>
					<div class="errordiv">
						<c:if test="${EuEmail!=null}">
							<strong>올바른 이메일 형식이 아닙니다</strong>
						</c:if>
						<c:if test="${Enickname!=null}">
							<strong>올바른 닉네임 형식이 아닙니다</strong>
						</c:if>
						<c:if test="${Ephone!=null}">
							<strong>올바른 휴대폰번호가 아닙니다</strong>
						</c:if>
					</div>
					<div>
						<input type="submit" class="btn btn-block btn-warning"
							value="가입하기" name="submit">
					</div>
				</form>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
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
