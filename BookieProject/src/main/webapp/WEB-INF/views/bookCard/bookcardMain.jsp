<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/bookcard/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
		<div style="margin-top:50px; background:lightgray; width:95%; height:250px; margin:50px auto 50px auto"></div>
		<!-- <img src="images/books.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="350px"> -->
	</div>
	<div class="container">

	  <div class="container">
	    <h2>Best3</h2>
	    <div class="row">
	      <div class="col-md-4">
	        <div class="thumbnail">
	          <a href="" target="_blank">
	            <img src="" alt="Lights" style="width:100%; height:400px">
	             <div class="caption">
	              <p>.</p>
	          </a>
	        </div>
	      </div>
	      <div class="col-md-4">
	        <div class="thumbnail">
	          <a href="" target="_blank">
	            <img src="" alt="Nature" style="width:100%; height:400px">
	            <div class="caption">
	              <p>.</p>
	            </div>
	          </a>
	        </div>
	      </div>
	      <div class="col-md-4">
	        <div class="thumbnail">
	          <a href="" target="_blank">
	            <img src="" alt="Fjords" style="width:100%; height:400px">
	            <div class="caption">
	              <p>.</p>
	            </div>
	          </a>
	        </div>
	      </div>
	    </div>
	    <div id="searchButton" class="input-group col-xs-4 ">
	      <input type="text" class="form-control" placeholder="검색" name="search">
	      <div class="input-group-btn">
	        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	      </div>
	    </div>
	  </div>


	<h2>Recommend</h2>
	  <div class="row">
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Lights" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책1</p>
	          </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Nature" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책2</p>
	          </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Fjords" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책3</p>
	          </div>
	        </a>
	      </div>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Lights" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책2-1</p>
	          </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Nature" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책2-2</p>
	          </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Fjords" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책2-3</p>
	          </div>
	        </a>
	      </div>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Lights" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책3-1</p>
	          </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Nature" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책3-2</p>
	          </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="" target="_blank">
	          <img src="" alt="Fjords" style="width:100%; height:350px">
	          <div class="caption">
	            <p>랜덤으로 추천하는 책3-3</p>
	          </div>
	        </a>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 페이지네이션 -->
	<div class="page">
		<ul class="pagenation">
			<li><a href="main?p=${prevNum }">&lt;&lt;</a></li>
			<c:forEach var="pageNum" items="${pageArray }">
				<c:choose>
					<c:when test="${pageNum == boardViewList.currentPageNumber }">
						<li><a href="main?p=${pageNum }"><b>${pageNum }</b></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="main?p=${pageNum }">${pageNum }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li><a href="main?p=${nextNum }">&gt;&gt;</a></li>
		</ul>
	</div>
	 <footer id="footerBg">
	      <div class="container">
	        <br>
	        <div class="row" id="footerFont">
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
	          <div class="col-sm-12 text-center">
	            <h5>Copyright &copy; 2020.ALL RIGHTS RESERVED.</h5><h5>Allie Dohee Kim</h5>
	          </div>
	        </div>
	      </div>
	    </footer>
	
	  </body>
	</html>
