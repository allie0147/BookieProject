<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/bootMain.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style media="screen">
    #searchButton{
      float: right;
      margin-top: 0;
      margin-bottom: 20px;
    }
    .navbar-header>a{
      font-size: 30pt;
      font-family: cursive;
    }
    body{
    background: ivory;
    }
    hr{
    margin-bottom:0;
    }
    #more{
      float: right;
      margin-right:30px;
    }
  </style>
</head>
<body>
<!--로고 글귀 q&a 독서클럽 고객센터 마이페이지 로그인-->
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/bookie/main">BooKie</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/bookcard/main">글귀</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Q&A<span class="caret"></span></a>
        <ul class="dropdown-menu">
			<li><a href="/bookie/QnA?g=1">소설 시 희곡</a></li>
			<li><a href="/bookie/QnA?g=2">에세이</a></li>
			<li><a href="/bookie/QnA?g=3">인문학</a></li>
			<li><a href="/bookie/QnA?g=4">경제경영</a></li>
			<li><a href="/bookie/QnA?g=5">사회과학</a></li>
			<li><a href="/bookie/QnA?g=6">종교</a></li>
			<li><a href="/bookie/QnA?g=7">예술</a></li>
        </ul>
      </li>
      <li class="active"><a href="/club/main">독서클럽</a></li>
      <li><a href="/bookie/cs">고객센터</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/bookie/mypage"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
      <li><a href="/bookie/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
    </ul>
  </div>
</nav>
<div class="container">
  <h2>Rounded Corners</h2>
  <p>독서클럽 이미지 들어갈곳</p>
  <img src="images/bookClub.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="300px">
</div>
<div class="container">
	<h3>독서클럽</h3>
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



	<footer style="background-color: #333333; color: #ffffff;">
	  <div class="container">
	    <br>
	    <div class="row" style="color: #9D9D9D;">
	      <div class="col-sm-4"><h4>Introduce</h4><p>I have studied Java, HTML, Python, Jquari, etc. and I want to make a space where I can exchange questions and answers related to books.</p>
	      </div>
	      <div class="col-sm-4"><h4>Contact</h4>
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
	      <div class="col-sm-12" style="text-align: center;">
	        <h5>Copyright &copy; 2020.ALL RIGHTS RESERVED.</h5><h5>Allie Dohie Kim</h5>
	      </div>
	    </div>
	  </div>
	</footer>
</body>
</html>