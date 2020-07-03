<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/css/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function name(){
		function ComUpdateForm(id){
			
		}
		
		function ComEelete(id){
			
		}
		
		function RepUpdateForm(id){
			
		}
		
		function RepDelete(id){
			
		}
	});
</script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/">BooKie</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/bookcard/main">글귀</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Q&A<span class="caret"></span></a>
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
				<li><a href="/login"><span
						class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<img src="images/bg2.jpg" class="img-rounded" alt="Cinque Terre"
			width="100%" height="300px">
	</div>

	<div class="container text-center">
		<h2>${board.title }</h2>
	</div>

	<div class="container">
		<table class="table table-hover table-bordered">
			<thead id="myHead">
				<tr>
					<th scope="col">#</th>
					<th class="wtDate" scope="col">작성일시 ${board.wtDate }</th>
					<th class="upDate" scope="col">마지막 수정 일시 ${board.upDate }</th>
					<th scope="col">작성자 ${board.writer }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td colspan="3">내용 ${board.content }</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container text-center">
		<h2>댓글</h2>
	</div>
	<div class="container">
		<table class="table table-hover table-bordered">
			<thead id="myHead">
				<c:forEach var="comment" items="${board.commentList }"
					varStatus="status">
					<tr>
						<th scope="col" class="comment_index">${status.index + 1 }</th>
						<th scope="col" class="comment_message">${comment.message }</th>
						<th scope="col" class="comment_writer">${comment.writer }</th>
						<th scope="col" class="comment_button">
							<button onclick="ComUpdateForm(${comment.id})">수정</button>
							<button onclick="ComEelete(${comment.id})">삭제</button>
						</th>
					</tr>
					<c:forEach var="reply" items="${comment.replyList }">
			</thead>
			<tbody>
				<tr>
					<td scope="row" class="reply_rep"><span
						class="glyphicon glyphicon-hand-right"></span></td>
					<td scope="row" class="reply_message">&nbsp; ${reply.message }</td>
					<td class="reply_writer">${reply.writer }</td>
					<td scope="row" class="comment_button">
						<button onclick="RepUpdateForm(${reply.id})">수정</button>
						<button onclick="RepDelete(${reply.id})">삭제</button>
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
					<h5>Allie Dohie Kim</h5>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>