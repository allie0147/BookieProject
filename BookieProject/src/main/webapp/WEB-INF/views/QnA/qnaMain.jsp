<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/css/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function search(){
		$("form").on("submit", function(){
			var formData = $("form").eq(0).serialize();
			
			console.log(formData);
			
			if(formData.searchInfo !== ""){
				$.ajax({
					url:"/qna/main",
					type:"post",
					data:formData,
					success:function(boardViewList){ 
						
						console.dir(boardViewList);
						
						if(boardViewList.boardList != null){
							$("#boardList").html(
									"<table style='border:1px solid black'>"+
										+"<thead>"
											+"<tr>"
												+"<td>글번호</td>"
												+"<td>제목</td>"
												+"<td>작성자명</td>"
												+"<td>작성일시</td>"
											+"</tr>"
										+"</thead>");
							$("#boardList").append("<tbody>");
							boardViewList.boardList.forEach(function(board){
								console.dir(board);
								$("#boardList").append("<tr><td>"+board.id+"</td>");
								$("#boardList").append("<td>"+board.title+"</td>");
								$("#boardList").append("<td>"+board.writer+"</td>");
								$("#boardList").append("<td>"+board.wtDate+"</td></tr>");
							});
							$("#boardList").append("</tbody>");
							$("#boardList").append("</table>")
						}else{
							$("#boardList").html("해당 조건을 만족하는 게시글이 없습니다.");
						}
					}
				});
			}else{
				alert("검색 요소를 입력해주세요.");
			}
			return false;
		});
	});
</script>
<style>
	#board_title{
		display:inline-block;
		text-align:center;
		margin:auto;
	}
	#boardList{
		width:600px;
		margin:auto;
		height:500px;
	}

	.board_qna{
		border:1px solid black;
		border-radius: 7px;	
		width:100%;
		height:100%;
		text-align: center;
	}
	.board_qna tr{
		border:1px solid black;
	}
	thead>tr{
		color:black;
	}
	.page{
		text-align: center;
	}
	.pagenation{
		list-style:none;
		display:inline-block;
		margin:auto;
		width: 60%;
		height:10px;
		text-align:center;
		text-decoration: none;
	}
	.pagenation li{
		display: inline;
		text-align: center;
	}
	.pagenation a{
		display:inline-block;
		text-decoration: none;
		color:black;
		padding:5px 12px;
	}
	.pagenation a:hover {
		background-color:lightgray;
		border-radius: 4px;
	}
	.pageNumber{
		margin:auto 5px auto 5px;
		text-decoration: none;
		color:black;
	}
	.searchBar{
		margin:auto;
		width:600px;
		text-align: right;
	}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/bookie/main">BooKie</a>
			</div>
		<ul class="nav navbar-nav">
			<li><a href="/bookcard/main">글귀</a></li>
			<li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown" href="/qna/main">Q&A<span class="caret"></span></a>
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
		<h2>Rounded Corners</h2>
		<div style="margin-top:50px; background:lightgray; width:95%; height:250px; margin:50px auto 50px auto"></div>
		<!-- <img src="images/books.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="350px"> -->
	</div>

	<h3 id="board_title">QnA</h3>
	<div id="boardList">
		<c:if test="${boardViewList.boardList.size() == 0 }"><!-- 글 개수가 0개일 때 -->
			<div class="content">글이 존재하지 않습니다.</div>
		</c:if>
		<c:if test="${boardViewList.boardList.size() > 0 }"><!-- 글 개수가 1개이상일 때 -->
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
					<c:forEach var="board" items="${boardViewList.boardList }" >
						<tr onclick="location.href='/qna/detail?b=${board.id}'" style="cursor:pointer">
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
		</select>
		<input type="text" name="searchInfo"/>
		<input type="submit" value="검색"/>
	</form>
</div>

<!-- 페이지네이션 -->
<div class="page">
	<ul class="pagenation">
		<li><a href="main?p=${prevNum }">&lt;&lt;</a></li>
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
		<li><a href="main?p=${nextNum }">&gt;&gt;</a></li>
	</ul>
</div>

<!-- footer -->
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
              <h5><a href="https://www.aladin.co.kr/">aladin</a></h5>
              <h5><a href="http://www.bandinlunis.com/">bandinluis</a></h5>
              <h5><a href="http://www.yes24.com/">yes24</a></h5>
            </div>
            <br>
            <div class="col-sm-12" style="text-align: center;">
              <h5>Copyright &copy; 2020.ALL RIGHTS RESERVED.</h5><h5>Allie Dohie Kim</h5>
            </div>
          </div>
        </div>
      </footer>
</body>
</html>