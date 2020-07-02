<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
			<li><a href="/mypage"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
			<li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	    </ul>
	  </div>
	</nav>

	<table class="board_table">
		<thead>

			<tr>
				<td class="title" colspan="3">${board.title }</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="wtDate">작성일시 ${board.wtDate }</td>
				<td class="upDate">마지막 수정 일시 ${board.upDate }</td>
				<td class="writer">작성자 ${board.writer }</td>
			</tr>
			<tr>
				<td colspan="3">내용 ${board.content }</td>
			</tr> 
		</tbody>
	</table>
	<br>
	<hr>
	<br>
	
	<table class="comment_table">
		<thead class="comment_title">
			<tr>
				<td colspan="4">댓글</td>
			</tr>
		</thead>
		<c:forEach var="comment" items="${board.commentList }" varStatus="status">
		<!-- board.userId가 세션 user의 id와 동일할 경우 수정, 삭제 버튼 생성 -->
			<tr>
				<td class="comment_index">${status.index + 1 }</td>
				<td class="comment_message">${comment.message }</td>
				<td class="comment_writer">${comment.writer }</td>
				<td class="comment_button">
					<button onclick="ComUpdateForm(${comment.id})">수정</button>
					<button onclick="ComEelete(${comment.id})">삭제</button>
				</td>
			</tr>
		<c:forEach var="reply" items="${comment.replyList }">
				<tr>
					<td class="reply_rep">&nbsp;&nbsp;  →</td>
					<td class="reply_message">&nbsp; ${reply.message }</td>
					<td class="reply_writer">${reply.writer }</td>
					<td class="comment_button">
						<button onclick="RepUpdateForm(${reply.id})">수정</button>
						<button onclick="RepDelete(${reply.id})">삭제</button>
					</td>
				</tr>
			</c:forEach>	
		</c:forEach>
	</table>
</body>
</html>