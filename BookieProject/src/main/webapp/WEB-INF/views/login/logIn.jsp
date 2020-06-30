<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	form{
		width: 310px;
		height: 500px;
		margin: auto;
		border: 1px solid black;
		padding: 20px;
		padding-top: 50px;
		font-size: 18pt;
		line-height: 1.8;
		background: ivory;
	}
	p{
		text-align: center;
		font-size: 13pt;
		margin-top: 5px;
}
	a{
	text-decoration: none;	
}
	.boxSize{
		width: 300px;
		height: 35px;
	}
	.logInButton{
		width: 200px;
		height: 32px;
		margin-left: 55px;
	}
	.naver{
		background:  #00e673;
		color: white;
		border: none;
		width: 300px;
		height: 50px;
		font-size: 18pt;
	}
	.kakao{
		background: #ffff00;
		border: none;
		width: 300px;
		height: 50px;
		font-size: 18pt;
	}	
</style>
</head>
<body>
<form action="">
	아이디<br>
	<input class="boxSize" name="idInput" type="text" placeholder="abc@gmail.com"><br>
	비밀번호<br>
	<input class="boxSize" name="passwordInput" type="password" placeholder="password"><br>
	<button class="logInButton" name="logInButton" type="button" onclick="alert('로그인버튼')">LOG IN</button><br>
	<p><a href="naver.com" target="_blank">아이디 </a>/<a href="naver.com" target="_blank"> 비밀번호 찾기</a><br></p>
	<br>
	<button class="naver" type="button" name="naverButton" onclick="alert('네이버')">NAVER</button><br>
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=cd1ddf2d9fa9a72e806a543b015dd1bd&redirect_uri=http://localhost:8080/kakaologin&response_type=code">카카오 로그인</a>
</form>
</body>
</html>