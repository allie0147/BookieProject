<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북키 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/mainview/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/resources/js/randomImage.js"></script>
</head>
<body onload="showImage()">
	<div class="main-body">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">BooKie</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="/bookcard/main">글귀</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Q&A<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/qna/board?g=1&p=1">소설 시 희곡</a></li>
								<li><a href="/qna/board?g=2&p=1">에세이</a></li>
								<li><a href="/qna/board?g=3&p=1">인문학</a></li>
								<li><a href="/qna/board?g=4&p=1">경제경영</a></li>
								<li><a href="/qna/board?g=5&p=1">사회과학</a></li>
								<li><a href="/qna/board?g=6&p=1">종교</a></li>
								<li><a href="/qna/board?g=7&p=1">예술</a></li>
							</ul></li>
						<li><a href="/club/main">독서 클럽</a></li>
						<li><a href="/cs">고객센터</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/mypage/info"><span
								class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
						<!-- 로그인 안했을 시, Login 버튼이 보임 -->
						<sec:authorize access="isAnonymous()">
							<li><a href="/login"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</sec:authorize>
						<!-- 로그인 했을 시, Logout 버튼 보임  -->
						<sec:authorize access="isAuthenticated()">
							<li><a href='#'
								onclick="document.getElementById('logout').submit();"> <span
									class="glyphicon glyphicon-log-out"></span> Logout
							</a></li>
							<form id='logout' action="/logout" method="post"
								style="diplay: none">
								<input type="hidden" name='${_csrf.parameterName}'
									value='${_csrf.token}' />
							</form>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="container slide-head">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
				
					<div class="item active group-form">
					<a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId=4346197" target="blank">
					<div class="col-xs-6 slide-div">
						<img src="../resources/images/books-${slideBooksWithId8.img}.jpg" alt="test"
							style="width: 45%; height: 310px;">
					</div>
					<div class="col-xs-6" style="color:black">
							 <div>
							 <br><br>
								    <span>★★★★★</span><em style="color:red">10 score</em>
							  </div><br>
								<div>
								    <span><i>${slideBooksWithId8.writer}</i></span>
							   </div><br>    
						    <div>
								    <span>인문/교양 1위</span>
							   </div><br>
								    
						    <div>
						    <br>
								    <h4 class="h4">《인생의 태도》는 불행한 어제, 불안한 내일과 작별하고 오직 지금을 살아가는 지혜를 말하는 책이다. 
								    타인의 기준에 얽매이지 않고 자신의 가능성을 믿고 충실한 오늘을 사는 인생의 태도만이 자신의 삶을 구원한다는 것이다.
								    당신은 스스로에게 만족스러운 사람인가?아니면 타인에게 만족스러운 사람인가?</h4>
							  </div>
					 </div>
						 </a>
					</div>

					<div class="item group-form">
					<a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId=4015026" target="blank">
					<div class="col-xs-6 slide-div">
						<img src="../resources/images/books-${slideBooksWithId7.img}.jpg" alt="test"
							style="width: 45%; height: 310px;">
					</div>
					<div class="col-xs-6" style="color:black">
							 <div><br><br>
								    <span>★★★★☆</span><em style="color:red">9 score</em>
							  </div><br>
								    <div>
								    <span><i>${slideBooksWithId7.writer}</i></span>
							   </div><br> 
						    <div>
								    <span>에세이 최고 순위 2위</span>
							   </div><br>
								    
						    <div>
						    <br>
								    <h4 class="h4">우리는 자기 자신 외에 그 무엇도 될 수 없고, 될 필요도 없다. 진짜 나로 살기 위한 조언, 어른이 처음인 당신을 위한 단단한 위로를 들어본다.</h4>
							  </div>
					 </div>
						 </a>
					</div>
					
					<div class="item group-form">
					<a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId=4320524" target="blank">
					<div class="col-xs-6 slide-div">
						<img src="../resources/images/books-${slideBooksWithId6.img}.jpg" alt="test"
							style="width: 45%; height: 310px;">
					</div>
					<div class="col-xs-6" style="color:black">
							 <div><br><br>
								    <span>★★★★☆</span><em style="color:red">9.9 score</em>
							  </div><br>
								   <div>
								    <span><i>${slideBooksWithId6.writer}</i></span>
							   </div><br>  
						    <div>
								    <span>소설 주간 7위</span>
							   </div><br>
								    
						    <div>
						    <br>
								    <h4 class="h4">일한지 한 달 정도 지났을 무렵, 레이토는 순찰을 돌다 여대생 유미와 마주친다. 
								    유미는 자신의 아버지가 여기서 도대체 무슨 기도를 하는지 파헤치려 뒤쫓아 온 것. 레이토는 반은 호기심에, 반은 어쩌다보니 유미에게 협력하게 된다..</h4>
							  </div>
					 </div>
						 </a>
					</div>

				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<div class="container">
			<h2>
				<a href="/bookcard/main">BookCard</a>
			</h2>
			<div class="row">
				<c:forEach var="board" items="${bookCardBoardList }"
					varStatus="status">
					<div class="col-md-4">
						<div class="thumbnail">
							<div class="img">
								<!-- background-image:url('../resources/images/bookcard-images-${randomImageNumIter.next()}.jpg')" -->
								<p class="cap">${board.content }</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container">
			<div class="row col-md-6">
				<h2>
					<a href="/qna/main">Q&A</a>
				</h2>
				<ul class="qnaUl">
					<c:forEach var="board" items="${MainQnaBoardList }"
						varStatus="status">
						<li><a href="qna/detail?b=${board.id }"><em>${status.index +1}</em>.&nbsp;${board.title }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="row col-md-6">
				<h2>
					<a href="/club/main">BookClub</a>
				</h2>
				<ul class="qnaUl">
					<c:forEach var="board" items="${MainClubBoardList }"
						varStatus="status">
						<li><a href="club/detail?b=${board.id}"><em>${status.index +1}</em>.&nbsp;${board.title }</a></li>
					</c:forEach>
				</ul>
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
						<a href="https://www.aladin.co.kr/" target="_blank">aladin</a>
					</h5>
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
