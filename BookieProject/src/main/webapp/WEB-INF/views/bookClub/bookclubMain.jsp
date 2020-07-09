<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서 클럽</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/bookclub/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="main-body">
	<!--로고 글귀 q&a 독서클럽 고객센터 마이페이지 로그인-->
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
		<div style="margin-top:50px; background:lightgray; width:95%; height:250px; margin:50px auto 50px auto"></div>
		<!-- <img src="images/books.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="350px"> -->
	</div>
	<div class="container">
		<a href="club/main?g=1"></a>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번 호</th>
					<th>제 목</th>
					<th>닉네임</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardViewList.boardList }">



				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- pageNation 구현 -->
</div>
 <footer id="footerBg">
    <div class="container">
      <br>
      <div class="row" id="footerFont">
        <div class="col-sm-4">
          <h4>Introduce</h4>
          <p>I have studied Java, HTML, Python, Jquari, etc. and I want to make a space where I can exchange questions
            and answers related to books.</p>
        </div>
        <div class="col-sm-4">
          <h4>Contact</h4>
          <p><span class="glyphicon glyphicon-map-marker"></span>Jongak, Seoul</p>
          <p><span class="glyphicon glyphicon-phone"></span>Phone: +82 1082747414</p>
          <p><span class="glyphicon glyphicon-envelope"></span>Email: hth0411@naver.com</p>
        </div>
        <div class="col-sm-4">
          <h4>store</h4>
          <h5><a href="https://www.aladin.co.kr/">aladin</a></h5>
          <h5><a href="http://www.bandinlunis.com/">bandinluis</a></h5>
          <h5><a href="http://www.yes24.com/">yes24</a></h5>
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