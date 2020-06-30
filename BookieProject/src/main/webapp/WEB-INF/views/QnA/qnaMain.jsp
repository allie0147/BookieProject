<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/QnA/main.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/css/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/QnA/main.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/bookie/main">BooKie</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/bookcard/main">글귀</a></li>
				<li class="dropdown active"><a class="dropdown-toggle"
					data-toggle="dropdown" href="/qna/main">Q&A<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/qna/main?g=1">소설 시 희곡</a></li>
						<li><a href="/qna/main?g=2">에세이</a></li>
						<li><a href="/qna/main?g=3">인문학</a></li>
						<li><a href="/qna/main?g=4">경제경영</a></li>
						<li><a href="/qna/main?g=5">사회과학</a></li>
						<li><a href="/qna/main?g=6">종교</a></li>
						<li><a href="/qna/main?g=7">예술</a></li>
					</ul></li>
				<li><a href="/bookcard/main">독서 클럽</a></li>
				<li><a href="/bookie/cs">고객센터</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/bookie/mypage"><span
						class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
				<li><a href="/bookie/login"><span
						class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h2>Rounded Corners</h2>
		<div
			style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto"></div>
		<!-- <img src="images/books.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="350px"> -->
	</div>

	<h3 id="board_title">QnA</h3>
	<div id="boardList">
		<c:if test="${boardViewList.boardList.size() == 0 }">
			<!-- 글 개수가 0개일 때 -->
			<div class="content">글이 존재하지 않습니다.</div>
		</c:if>
		<c:if test="${boardViewList.boardList.size() > 0 }">
			<!-- 글 개수가 1개이상일 때 -->
			<table class="board_qna">
				<thead>
					<tr>
						<td>글번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardViewList.boardList }">
						<!-- onclick fucntion 빼기 -->
						<tr onclick="location.href='/qna/detail?b=${board.id}'"
							style="cursor: pointer">
							<td>${board.id }</td>
							<td>${board.title }</td>
							<td>${board.writer }</td>
							<td>${board.wtDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
	<hr>

	<!-- 검색 창 -->
	<div class="searchBar">
		<form>
			<select name="option">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">글쓴이</option>
			</select> <input type="text" name="searchInfo" /> <input type="submit"
				value="검색" />
		</form>
	</div>

	<!-- 페이지네이션 -->
	<c:if test="${boardViewList.boardList.size() > 0 }">
		<!-- 글 개수가 1개이상일 때 -->
		<div class="page">
			<ul class="pagenation">
				<c:if test="${p>5}">
					<li><a href="main?p=${pageArray.get(0)-5 }">&lt;&lt;</a></li>
				</c:if>
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
				<c:if test="${pageArray.size()==5}">
					<li><a href="main?p=${nextNum }">&gt;&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>

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