<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/QnA/main.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/css/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/QnA/main.js"></script>
<style>
.ml{
	margin-left:30%;
}
.form-group{
margin-bottom: 0;
}
.col-xs-2{
padding-right:0;

}
.col-xs-3{
padding-right:0;
}
.table-bordered{
width:800px;
margin: auto;
}
.pagination > li > a{
color: #000000;
}
.pagination > li > a:focus,
.pagination > li > a:hover{
color: #000000;
}


</style>
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
		<div
			style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto"></div>
		<!-- <img src="images/books.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="350px"> -->
	</div>



	<div class="text-center" id="qnaTitle">
		<h3 id="board_title">QnA</h3>
	</div>


	<div class="container">

		<c:if test="${boardViewList.boardList.size() == 0 }">
			<!-- 글 개수가 0개일 때 -->
			<div class="content">글이 존재하지 않습니다.</div>
		</c:if>
		<c:if test="${boardViewList.boardList.size() > 0 }">
			<!-- 글 개수가 1개이상일 때 -->
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th class="col-sm-1" scope="col">번 호</th>
						<th class="col-sm-4" scope="col">제 목</th>
						<th class="col-sm-2" scope="col">작성자</th>
						<th class="col-sm-3" scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardViewList.boardList }">
						<tr onclick="board">
							<td>${board.id }</td>
							<td>${board.title }</td>
							<td>${board.writer }</td>
							<td>${board.wtDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<hr>
	</div>

	
	<!-- 검색 창 -->
	<div class="container">
		<form class="ml">
			<div class="form-group col-xs-2">
				<select class="form-control">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">글쓴이</option>
				</select>
			</div>
			<div class="form-group col-xs-3">
				<input class="form-control" type="text" name="searchInfo" />
			</div>
			<div class="form-group col-xs-2">
				<input class="btn btn-default" type="submit" value="검색" />
			</div>
		</form>
	</div>

	<!-- 페이지네이션 -->
<div class="container text-center">

<c:if test="${boardViewList.boardList.size() > 0 }">
  <nav aria-label="Page navigation example">
    <ul class="pagination">
      <c:if test="${p>5}">
      <li class="page-item"><a class="page-link" href="main?p=${pageArray.get(0)-5 }">&lt;&lt;</a></li>
      </c:if>
      <c:forEach var="pageNum" items="${pageArray }">
					<c:choose>
            <c:when test="${pageNum == boardViewList.currentPageNumber }">
              <li class="page-item"><a class="page-link" href="main?p=${pageNum }"><b>${pageNum }</b></a></li>
            </c:when>
          <c:otherwise>
              <li class="page-item"><a class="page-link" href="main?p=${pageNum }">${pageNum }</a></li>
            </c:otherwise>
  					</c:choose>
  				</c:forEach>
  				<c:if test="${pageArray.size()==5}">
      <li class="page-item"><a class="page-link" href="main?p=${nextNum }">&gt;&gt;</a></li>
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