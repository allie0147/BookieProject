<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북키 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/mainview/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 주소 이걸로 쓰면됨 -->
	<!-- <a href="/bookie/main">메인</a><br /> 
<a href="/bookie/bookcard">북카드</a><br />
<a href="/bookie/QnA">QnA</a><br />
<a href="/bookie/bookclub">북클럽</a><br />
<a href="/bookie/mypage">마이페이지</a><br />
<a href="/bookie/cs">고객센터</a><br /> 
<a href="/bookie/login">로그인</a> -->
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
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <img src="images/famous1.jpg" alt="famous" style="width:100%;height: 350px;">
            </div>

            <div class="item">
              <img src="images/famous2.png" alt="famous" style="width:100%;height: 350px;">
            </div>

            <div class="item">
              <img src="images/famous3.jpg" alt="famous" style="width:100%;height: 350px;">
            </div>
          </div>

          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>


<!-- 각 게시판 제목 보다 오른쪽으로 이동 -->
<!-- 이 곳 a 태그들에 따로 디자인 주기(a태그 안의 텍스트에 폰트 변경, 크기 키우기 -->
	<div class="container">
		<h2><a href="/bookcard/main">BookCard</a></h2>
		<div class="row">
			<c:forEach var="board" items="${bookCardBoardList }" varStatus="status">
				<div class="col-md-4">
					<div class="thumbnail">
						<a href="/bookcard/detail?b=${board.id }" target="_blank">
							<c:if test="${randomImageNumIter.hasNext() }">
								<div class="img" style="background-image:url('../resources/images/bookcard-images-${randomImageNumIter.next()}.jpg')" >
									<p class="caption">안녕하세요 반갑습니다 헬로</p><!-- ${board.content } -->
								</div>
							</c:if>
						</a>
					</div>
				</div>
			</c:forEach>	
			
		</div>
	</div>
		<!-- 글이 없어도 어느 정도 공간을 유지하도록 박스 크기 지정 -->
	<div class="container">
		<div class="row col-md-6">
			<h2><a href="/qna/main">Q&A</a></h2>
			<ul class="qnaUl">
				<c:forEach var="board" items="${MainQnaBoardList }" varStatus="status">
					<li><a href="qna/detail?b=${status.index+1 }"><em>${status.index +1}</em>${board.title }</a></li>
				</c:forEach>
			</ul>
        </div>
        <!-- 글이 없어도 어느 정도 공간을 유지하도록 박스 크기 지정 -->
		<div class="row col-md-6">
			<h2><a href="/club/main">BookClub</a></h2>
			<ul class="qnaUl">
				<c:forEach var="board" items="${MainClubBoardList }" varStatus="status">
					<!-- <a href="qna/detail?b=${status.index }"> a 태그 클릭시 이동 페이지 status.index 수정 -->
					<li><a href="qna/detail?b=${status.index }"><em>${status.index +1}</em>${board.title }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<!-- store의 글자들 클릭한 뒤 다시 뒤로가기 해도 글자색 변경되지 않게 -->
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
			<h5><a href="https://www.aladin.co.kr/" target="_blank">aladin</a></h5> <!-- target 설정: 새창으로 변경 -->
			<h5><a href="http://www.bandinlunis.com/" target="_blank">bandinluis</a></h5>
			<h5><a href="http://www.yes24.com/" target="_blank">yes24</a></h5>
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
