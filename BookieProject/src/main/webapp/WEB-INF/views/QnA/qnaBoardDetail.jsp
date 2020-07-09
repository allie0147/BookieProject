<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>실제 글 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/QnA/detail.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/QnA/detail.js"></script>
</head>
<body>
	<div class="main-body">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/">BooKie</a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="/bookcard/main">글귀</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown">Q&A<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/qna/main?g=1">소설 시 희곡</a></li>
							<li><a href="/qna/main?g=2">에세이</a></li>
							<li><a href="/qna/main?g=3">인문학</a></li>
							<li><a href="/qna/main?g=4">경제경영</a></li>
							<li><a href="/qna/main?g=5">사회과학</a></li>
							<li><a href="/qna/main?g=6">종교</a></li>
							<li><a href="/qna/main?g=7">예술</a></li>
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
		</nav>

		<div class="container">
			<div
				style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto"></div>
			<!-- <img src="images/bg2.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="300px"> -->
		</div>

		<div class="container text-center">
			<h2>${board.title }</h2>
		</div>

		<div class="container">
			<table class="table table-hover table-bordered">
				<thead id="myHead">
					<tr>
						<th scope="col"># ${board.id}</th>
						<th class="wtDate" scope="col">작성일시 ${board.wtDate_str}</th>
						<c:if test="${not empty board.upDate}">
							<th class="upDate" scope="col">마지막 수정 일시 ${board.upDate }</th>
						</c:if>
						<th scope="col">작성자 ${board.writer }</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">${board.content }</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="container text-center">
			<h2>댓글</h2>
		</div>
		<sec:authorize access="isAuthenticated()">
			<form name="replyForm">
				<input type="text" name="comment" id="comment" placeholder="댓글을 작성하세요" /> <input
					type="hidden" name="board_id" value="${board.id }" /> <input
					type="submit" value="작성" name="submit">
			</form>
		</sec:authorize>
		<div class="container">
			<table class="table table-hover table-bordered" id="commentTable">
				<tbody id="commentTbody">
					<c:forEach var="comment" items="${board.commentList }"
						varStatus="status">
						<tr>
							<td scope="col" class="comment_message">${comment.message }</td>
							<td scope="col" class="comment_writer">${comment.writer}</td>
							<td scope="col" class="comment_index">${comment.wtDate_str}</td>
							<td scope="col" class="comment_button">
								<button class="commentUp" id='${comment.id}'>수정</button>
								<button class="commentDel" id="${comment.id}">삭제</button>
							</td>
						</tr>
						<c:forEach var="reply" items="${comment.replyList }">
							<tr>
								<td scope="row" class="reply_rep"><span
									class="glyphicon glyphicon-hand-right"></span></td>
								<td scope="row" class="reply_message">&nbsp;
									${reply.message }</td>
								<td class="reply_writer">${reply.writer }</td>
								<td scope="row" class="comment_button">
									<button name="replyUp" id="${reply.id}">수정</button>
									<button name="replyDel" id="${reply.id}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>




		<div class="container text-center">

			<c:if test="${boardViewList.boardList.size() > 0 }">
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
						<a href="#">aladin</a>
					</h5>
					<h5>
						<a href="#">millie</a>
					</h5>
					<h5>
						<a href="#">yes24</a>
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