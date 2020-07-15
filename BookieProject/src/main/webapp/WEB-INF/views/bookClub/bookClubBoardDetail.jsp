<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실제 글 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/bookclub/detail.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/resources/js/bookclub/detail.js"></script>
</head>
<body>
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
		<div class="container">
			<div
				style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto">
				<img src="../resources/images/banner-detail.jpg" class="img-rounded"
					alt="Cinque Terre" width="100%" height="100%">
			</div>
		</div>
		<div class="container article_container">
			<div class="container text-center">
				<h2 id='title'>${board.title }</h2>
			</div>
			<div class='container boardContainer' style='margin-bottom: 5px;'>
				<button class='Btn btn btn-default' style='margin-left: 2%'
					onclick='location.href="/club/main"'>목록</button>
				<c:if test="${board.userId==userId}">
					<div class='BtnDiv'>
						<button class='Btn btn btn-warning'
							onclick='location.href="/club/edit?b=${board.id}"'>수정</button>
						<button class='Btn btn btn-danger' name='delBtn'>삭제</button>
					</div>
				</c:if>
			</div>
			<div class="container boardContainer">
				<table class="table table-bordered">
					<thead id="myHead">
						<tr>
							<th scope="col" id='boardId'># ${board.id}</th>
							<th scope="col" id='${genre.id}'>장르 ${board.genre }</th>
							<th scope="col">작성자 ${board.writer }</th>
							<th class="wtDate" scope="col">작성일 ${board.wtDate_str }</th>
							<c:if test="${not empty board.upDate}">
								<th class="upDate" scope="col">수정일 ${board.upDate}</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5" id='content'>${board.content }</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="container text-center">
				<h2>댓글</h2>
			</div>
			<div class="container">
				<ul class="container" id="com_ul">
					<c:forEach var="comment" items="${board.commentList }"
						varStatus="status">
						<li class="comment_list" id="li_${comment.id }">
							<div class="boardContainer commentContainer">
								<div class="commentContainer" id='div_${comment.id}'>
									<div class="comment_writer writer">
										<span>${comment.writer}</span>
									</div>
									<div class="comment_message" id="${comment.id}">
										<span>${comment.message}</span>
									</div>
									<div class="comment_index">
										<span class="wdate">${comment.wtDate_str }</span>
										<sec:authorize access="isAuthenticated()">
											<a class="writeReply" id="${comment.id }">댓글쓰기</a>
										</sec:authorize>
									</div>
									<c:if test="${comment.userId == userId}">
										<div class="comment_aTag">
											<a class="commentUp" id='${comment.id}'>수정</a> <a
												class="commentDel" id="${comment.id}">삭제</a>
										</div>
									</c:if>
								</div>
							</div>
						</li>
						<ul id='ul_${comment.id }'>
							<c:forEach var="reply" items="${comment.replyList }">
								<li class="comment_list">
									<div class="container boardContainer replyContainer">
										<div class="commentContainer" id='div_R${reply.id}'>
											<div class="reply_rep">
												<span class="glyphicon glyphicon-hand-right"></span>
											</div>
											<div class="reply_writer writer">
												<span>${reply.writer} </span>
											</div>
											<div class="reply_message" id='R${reply.id }'>
												<span>${reply.message }</span>
											</div>
											<div class="comment_index">
												<span class='wdate'>${reply.wtDate}</span>
											</div>
											<c:if test="${reply.userId == userId}">
												<div class="comment_aTag">
													<a class="replyUp" id="${reply.id}">수정</a> <a
														class="replyDel" id="${reply.id}">삭제</a>
												</div>
											</c:if>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</c:forEach>
				</ul>
				<div class="comment_box">
					<sec:authorize access="isAnonymous()">
						<textarea class="comment_input" readonly="readonly"
							placeholder="로그인 후 이용하세요"></textarea>
						<input class="comment_submit" type="button" value="등록" />
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<div class='writer comment_nickname'>${nickname}</div>
						<form name="commentForm">
							<label for="submit" class="label_summit"> <textarea
									rows='1' name="comment" id="comment" class="comment_input"
									placeholder="댓글을 남겨보세요"></textarea> <input type="hidden"
								name="board_id" value="${board.id }" /><input type="submit"
								class="comment_submit" value="등록" name="submit"></label>
						</form>
					</sec:authorize>
				</div>
			</div>
		</div>
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