<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글귀게시판 검색 결과</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/bookcard/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/resources/js/bookcard/search.js"></script>
<script src="/resources/js/randomImage.js"></script>
</head>
<body onload="showImage()">
	<div class="main-body">
		<!--로고 글귀 q&a 독서클럽 고객센터 마이페이지 로그인-->
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
		<div class='loader_card'></div>
		<div class="black_box main-body"></div>
		<div class="container">
			<div
				style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto">
				<img src="../resources/images/banner-card.jpg" class="img-rounded"
					alt="Cinque Terre" width="100%" height="100%">
			</div>
		</div>

		<div class="container">
			<div class="row">
				<c:if test="${boardViewList.bookCardBoardList.size() == 0}">
					<div class="content">글이 존재하지 않습니다.</div>
				</c:if>
				<c:if test="${boardViewList.bookCardBoardList.size() > 0 }">
					<c:forEach var="board" items="${boardViewList.bookCardBoardList }"
						varStatus="status">
						<div class="col-md-4">
							<div class="thumbnail">
								<div class="img">
									<div class="wrapGlyph">
										<p id="board_id" style="display: none">${board.id}</p>
										<c:if test="${board.userId == userId}">
											<a class="glyph edit"><span
												class="glyphicon glyphicon-edit"></span></a>
											<a class="glyph delete"><span
												class="glyphicon glyphicon-trash"></span></a>
										</c:if>
									</div>
									<p class="content">${board.content }</p>
									<div>
										<p class="writer">${board.writer }</p>
										<div class="like">
											<sec:authorize access="isAuthenticated()">
												<a class="heart glyph"><span
													class='glyphicon glyphicon-heart-empty'></span></a>
												<p class="count">${board.likeCnt }</p>
											</sec:authorize>
											<sec:authorize access="isAnonymous()">
												<a class="any_heart glyph"><span class='glyphicon glyphicon-heart'></span></a>
												<p class="count">${board.likeCnt }</p>
											</sec:authorize>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<div class="container" id="wrapBtn">
				<sec:authorize access="isAuthenticated()">
					<a class="btn write-button"><span
						class="glyphicon glyphicon-pencil"></span><span id="id"
						style="display: none;">${userId}</span>&nbsp;글쓰기</a>
				</sec:authorize>

				<div id="searchButton" class="input-group col-xs-4 ">
					<input type="text" class="form-control" placeholder="검색"
						name="query">
					<div class="input-group-btn">
						<button id="bcbSearchSb" class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</div>

			<!-- 페이지네이션 -->
			<div class="container text-center">
				<c:if test="${boardViewList.bookCardBoardList.size() > 0 }">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${p>5}">
								<li class="page-item"><a class="page-link"
									href="main?p=${pageArray.get(0)-5 }">&lt;&lt;</a></li>
							</c:if>
							<c:forEach var="pageNum" items="${pageArray }">
								<c:choose>
									<c:when test="${pageNum == boardViewList.currentPageNumber }">
										<li class="page-item"><a class="page-link"
											href="main?p=${pageNum }"><b>${pageNum }</b></a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="main?p=${pageNum }">${pageNum }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pageArray.size()==5}">
								<li class="page-item"><a class="page-link"
									href="main?p=${nextNum }">&gt;&gt;</a></li>
							</c:if>
						</ul>
					</nav>
				</c:if>
			</div>
		</div>
		<footer id="footerBg">
			<div class="container">
				<br>
				<div class="row" id="footerFont">
					<div class="col-sm-4">
						<h4>Introduce</h4>
						<p>I have studied Java, HTML, Python, Jquari, etc. and I want
							to make a space where I can exchange questions and answers
							related to books.</p>
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