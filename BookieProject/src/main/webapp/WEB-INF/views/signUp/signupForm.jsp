<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/css/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/signUp.js" />"></script>
</head>

<body>
	<form action="/bookie/userForm" method="post">
		<!-- spring 유효성 검사로 post : SignUpController.java-->
		<h1>회원 가입 폼폼이</h1>
		<div>
			<span>이메일</span><span>*필수</span>
		</div>
		<div>
			<c:choose>
				<c:when test="${uEmail!=null }">
					<input type="text" class="input" value="${ uEmail}" name="uEmail"
						id="email" readonly="readonly">
				</c:when>
				<c:otherwise>
					<input type="text" class="input" name="uEmail" id="email">
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<button type="button" name="emailBtn">이메일 인증</button>
		</div>
		<div class="errorBox">
			<span class='error' id='error01'>에러 01</span>
		</div>
		<div>
			<span>비밀번호</span><span>*필수</span>
		</div>
		<div>
			<input type="password" class="input" name="uPwd" id="uPwd">
		</div>
		<div class="errorBox">
			<span class='error' id='error02'>에러 02</span>
		</div>
		<div>
			<span>비밀번호 확인</span><span>*필수</span>
		</div>
		<div>
			<input type="password" class="input" name="uPwdRe" id="uPwdRe">
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
					<input type="text" class="input" name="nickname" id="nickname"
						value="${nickname }" readonly="readonly">
				</c:when>
				<c:otherwise>
					<input type="text" class="input" name="nickname" id="nickname">
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
			<input type="tel" class="input" name="phone" id="phone">
		</div>
		<div class="errorBox">
			<span class='error' id='error05'>에러 05</span>
		</div>
		<div>
			<input type="checkbox" name="interest" id="1" value="1"><label
				for="1">소설/시/희곡</label><input type="checkbox" name="interest" id="2"
				value="2"><label for="2">에세이</label><input type="checkbox"
				name="interest" id="3" value="3"><label for="3">인문학</label>
			<input type="checkbox" name="interest" id="4" value="4"><label
				for="4">경제/경영</label><input type="checkbox" name="interest" id="5"
				value="5"><label for="5">사회과학</label><input type="checkbox"
				name="interest" id="6" value="6"><label for="6">종교</label><input
				type="checkbox" name="interest" id="7" value="7"><label
				for="7">예술</label>
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
			<input type="submit" value="가입하기" name="submit">
		</div>
	</form>

	<footer style="background-color: #333333; color: #ffffff;">
		<div class="container">
			<br>
			<div class="row" style="color: #9D9D9D;">
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
				<div class="col-sm-12" style="text-align: center;">
					<h5>Copyright &copy; 2020.ALL RIGHTS RESERVED.</h5>
					<h5>Allie Dohee Kim</h5>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>
