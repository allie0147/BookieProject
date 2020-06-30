<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실제 글 페이지</title>
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
<style type="text/css">
	/* board */
	.board_table{
		border-collapse: collapse;
		border:1px solid black;
		width:900px;
	}
	.board_table tr{
		border:1px solid black;
	}
	.board_table .title{
		text-align: center;
	}
	board_table .wtDate{
		width:150px;
	}
	board_table .upDate{
		width:150px;
	}
	board_table .writer{
		width:600px;
		text-align: right;
		padding-right:5px;
	}
	
	/* comment */
	.comment_table{
		border-collapse: collapse;
		border:1px solid black;
		width:900px;
	}
	.comment_table .comment_title{
		text-align: center;
	}
	.comment_table tr{
		border:1px solid black;
	}
	.comment_table .comment_index{
		width:5%;
	}
	.comment_table .comment_message{
		width:69%;
	}
	.comment_table .comment_writer{
		width:15%;
	}
	.comment_table .comment_button{
		width:11%;
	}
	
	/* reply */
	.reply_rep{
		width:5%;
		text-align: right;
	}
	.reply_message{
		width:69%;
	}
	.reply_writer{
		width:15%;
	}
	.reply_button{
		width:11%;
	}
</style>
</head>
<body>
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