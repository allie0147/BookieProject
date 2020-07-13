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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/QnA/detail.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
					<li><a href="/mypage"><span
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
			<div style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto">
			<img src="../resources/images/banner-detail.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="100%"></div>
		</div>

		<div class="container article_container">
			<div class="container text-center">
				<h2>${board.title }</h2>
			</div>
			<div class="container boardContainer">
				<table class="table table-bordered">
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
			<div class="container">
				<ul class="container" id="com_ul">
					<c:forEach var="comment" items="${board.commentList}"
						varStatus="status">
						<li class="comment_list" >
							<div class="boardContainer commentContainer" >
								<div class="commentContainer" id='div_${comment.id}'>
									<div class="comment_writer writer">
										<span>${comment.writer}</span>
									</div>
									<div class="comment_message" id="${comment.id}">
										<span>${comment.message}</span>
									</div>
									<div class="comment_index">
										<span class="wdate">${comment.wtDate_str }</span><a
											class="writeReply">답글쓰기</a>
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
						<c:forEach var="reply" items="${comment.replyList }">
							<li class="comment_list">
								<div class="container boardContainer commentContainer">
									<div class="commentContainer">
										<div class="reply_rep">
											<span class="glyphicon glyphicon-hand-right"></span>
										</div>
										<div class="reply_writer writer">
											<span>${reply.writer} </span>
										</div>
										<div class="reply_message" id=${reply.id }>
											<span>${reply.message }</span>
										</div>
										<div class="reply_index">
											<span>${reply.wtDate_str }</span><a class="writeReply">답글쓰기</a>
										</div>
										<div class="comment_aTag">
											<a class="replyUp" id="${reply.id}">수정</a> <a
												class="replyDel" id="${reply.id}">삭제</a>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</c:forEach>
				</ul>
				<div class="comment_box">
					<sec:authorize access="isAnonymous()">
						<textarea class="comment_input" type="text" readonly="readonly"
							placeholder="로그인 후 이용하세요" ></textarea>
						<input class="comment_submit" type="button" value="등록" />
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<div class='writer comment_nickname'>${nickname}</div>
						<form name="replyForm">
						<label for="submit" class="label_summit">
							<textarea rows='1' name="comment" id="comment" class="comment_input"
								placeholder="댓글을 남겨보세요"></textarea>
							<input type="hidden" name="board_id" value="${board.id }" /><input type="submit"
								class="comment_submit" value="등록" name="submit"></label>
						</form>
					</sec:authorize>
				</div>
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