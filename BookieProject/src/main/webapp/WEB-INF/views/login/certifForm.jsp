<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Email</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/login/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/resources/js/login/main.js"></script>
<script src="/resources/js/login/certifForm.js"></script>
</head>
<body onbeforeunload="return showNoticeRefresh()"> <!-- onunload -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">BooKie</a>
			</div>
		</div>
	</nav>
	<div id="certifFormBox">
		<input type="hidden" name="uId" value="${uId }"/><br>
		<input type="text" name="certifNum"/><br>
		<button onclick="javascript:certif(${certifVal})">인증</button>
		<!-- 
			타이머 표시(스레드 사용), 시간이 다 되면 돌아가기가 보이게 하기
			ex) $("span").css("visibility", "visible") 혹은 클래스 css를 지정해둔 뒤 $("span")의 클래스명 변경
		 --> 
		<button onclick="javascript:history.back()">돌아가기</button><br>
		<span>인증전에 페이지를 이동하실 경우 새로운 인증 절차가 필요합니다.</span>
	</div>
</body>
</html>