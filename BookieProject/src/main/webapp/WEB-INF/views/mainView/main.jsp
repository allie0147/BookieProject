<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>

    .navbar-header>a{
      font-size: 30pt;
      font-family: cursive;
    }
	
  </style>
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
			<a class="navbar-brand" href="/bookie/main">BooKie</a>
		</div>
		<ul class="nav navbar-nav">
            <li><a href="/bookcard/main">글귀</a></li>
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" >Q&A<span class="caret"></span></a>
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
		<li><a href="/bookcard/main">독서 클럽</a></li>
		<li><a href="/bookie/cs">고객센터</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/bookie/mypage"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
            <li><a href="/bookie/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
          </ul>
        </div>
      </nav>
      <div class="container">
        <h2>Carousel Example</h2>
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
      <div class="container">
        <h2>Sentence</h2>
        <div class="row">
          <div class="col-md-4">
            <div class="thumbnail">
              <a href="" target="_blank">
                <img src="images/conan.jpg" alt="Lights" style="width:100%; height:300px">
                <div class="caption">
                  <p>추천 많이 받은 글귀들어갈곳1</p>
                </div>
              </a>
            </div>
          </div>
          <div class="col-md-4">
            <div class="thumbnail">
              <a href="" target="_blank">
                <img src="images/ddotty.jpg" alt="Nature" style="width:100%; height:300px">
                <div class="caption">
                  <p>추천 많이 받은 글귀들어갈곳2</p>
                </div>
              </a>
            </div>
          </div>
          <div class="col-md-4">
            <div class="thumbnail">
              <a href="" target="_blank">
                <img src="images/spider.jpg" alt="Fjords" style="width:100%; height:300px">
                <div class="caption">
                  <p>추천 많이 받은 글귀들어갈곳3</p>
                </div>
              </a>
            </div>
          </div>
        </div>

      </div>

      <div class="container">
        <div class="row col-md-6">
          <h2><a href="/qna/main">Q&A</a></h2>
          <ul class="qnaUl">
<<<<<<< HEAD
			<c:forEach var="board" items="${MainQnaBoardList }" varStatus="status">
				<li><a href="qna/detail?n=${status.index }"><em>${status.index +1}</em>${board.title }</a></li>
			</c:forEach>
=======
            <li><em>1. </em><a href="#">내 친구가 네 얘기를 해 좋아보였단 말에 괜히 화를 내 어쩌면 아직도 나 땜에 네가힘들어하길 바랬는지 몰라</a></li>
            <li><em>2. </em><a href="#">요즘 가끔 나도 모르게 우리 함께듣던 노래를해 이유없이 보고 싶어지는밤 그대내가 너무 어렸었어 </a></li>
            <li><em>3. </em><a href="#">난부담이 됐고우고 불만이됐죠 끝내너를 지우고 오늘이지나면 난 사라질 먼지 사랑이 먼지</a></li>
            <li><em>4. </em><a href="#">나 슬퍼 보인다면 그눈물은 연기 춤추는 연기 처럼 내일이면 또아무렇지 않게 또하루가 시작되</a></li>
            <li><em>5. </em><a href="#">널 잊고 살겠죠 그대내가 행복해지기만을 이곳에서 남아서 웃으며 기다릴꼐</a></li>
>>>>>>> branch 'master' of https://github.com/allie0147/BookieProject.git
          </ul>
        </div>
        <div class="row col-md-6">
          <h2><a href="/club/main">BookClub</a></h2>
          <ul class="qnaUl">
<<<<<<< HEAD
            <c:forEach var="board" items="${MainClubBoardList }" varStatus="status">
				<li><a href="qna/detail?n=${status.index }"><em>${status.index +1}</em>${board.title }</a></li>
			</c:forEach>
=======
            <li><em>1. </em><a href="#">내 친구가 네 얘기를 해 좋아보였단 말에 괜히 화를 내 어쩌면 아직도 나 땜에 네가힘들어하길 바랬는지 몰라</a></li>
            <li><em>2. </em><a href="#">요즘 가끔 나도 모르게 우리 함께듣던 노래를해 이유없이 보고 싶어지는밤 그대내가 너무 어렸었어 </a></li>
            <li><em>3. </em><a href="#">난부담이 됐고우고 불만이됐죠 끝내너를 지우고 오늘이지나면 난 사라질 먼지 사랑이 먼지</a></li>
            <li><em>4. </em><a href="#">나 슬퍼 보인다면 그눈물은 연기 춤추는 연기 처럼 내일이면 또아무렇지 않게 또하루가 시작되</a></li>
            <li><em>5. </em><a href="#">널 잊고 살겠죠 그대내가 행복해지기만을 이곳에서 남아서 웃으며 기다릴꼐</a></li>
>>>>>>> branch 'master' of https://github.com/allie0147/BookieProject.git
          </ul>
        </div>
      </div>

	<!-- store의 글자들 클릭한 뒤 다시 뒤로가기 해도 글자색 변경되지 않게 -->
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
              <h5><a href="https://www.aladin.co.kr/" target="_blank">aladin</a></h5> <!-- target 설정: 새창으로 변경 -->
              <h5><a href="http://www.bandinlunis.com/" target="_blank">bandinluis</a></h5>
              <h5><a href="http://www.yes24.com/" target="_blank">yes24</a></h5>
            </div>
            <br>
            <div class="col-sm-12" style="text-align: center;">
              <h5>Copyright &copy; 2020.ALL RIGHTS RESERVED.</h5><h5>Allie Dohee Kim</h5>
            </div>
          </div>
        </div>
      </footer>
  </body>
</html>
