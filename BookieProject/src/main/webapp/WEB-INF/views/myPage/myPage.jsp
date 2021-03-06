<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/mypage/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="main-body">
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
				<img src="../resources/images/banner-mypage.jpg" class="img-rounded"
					alt="Cinque Terre" width="100%" height="100%">
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-4 menu-line">
					<ul class="nav">
						<li class="active"><a data-toggle="tab" href="#home"><h3>회원정보
									조회</h3></a></li>
						<br>
						<li><a data-toggle="tab" href="#menu1"><h3>내가 쓴 글 조회</h3></a></li>
						<br>
						<li><a data-toggle="tab" href="#menu2"><h3>북마크한 글귀</h3></a></li>
						<br>
						<li><a data-toggle="tab" href="#menu3"><h3>좋아요한 글귀</h3></a></li>
						<br>
					</ul>
				</div>

				<div class="container-fluid bg col-md-8">
					<div class="div-container">

						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<h3>회원정보</h3>
								<div class="panel-group my-info" id="accordion">
									<div class="container">
										<b>Email</b>
										<div id='user'>${mypageInfo.getUEmail()}</div>
									</div>
									<div class="container">
										<b>NICKNAME</b>
										<div>${mypageInfo.nickname }</div>
									</div>
									<div class="container">
										<b>PHONE</b>
										<div>${mypageInfo.phone }</div>
									</div>
									<div class="container">
										<b>INTEREST GENRE</b><br>
										<div>
											<c:forEach var="interest" items="${mypageInfo.interestList }"
												varStatus="status">
												<c:if
													test="${status.index != mypageInfo.interestList.size() - 1 }">
							${interest.genreName }, 
						</c:if>
												<c:if
													test="${status.index == mypageInfo.interestList.size() - 1 }">
							${interest.genreName }
						</c:if>
											</c:forEach>
										</div>
									</div>
									<div class="container">
										<b>가입일</b>
										<div class="">${mypageInfo.regDate }</div>
									</div>
									<div class="text-center">
										<a href="/mypage/updateForm" class="btn btn-md btn-success">수정하기</a>
										<a href="/mypage/unsubscribe" id="unsubscribe"
											class="btn btn-md btn-danger">탈퇴하기</a>
									</div>
								</div>
							</div>

							<div id="menu1" class="tab-pane fade">
								<h3>내가 쓴 글</h3>
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#card">글귀
											게시글</a></li>
									<li><a data-toggle="tab" href="#club">독서클럽 게시글</a></li>
								</ul>
								<div class="tab-content">
									<div id="card" class="tab-pane fade in active">
										<div class="panel-group">
											<h4>글귀 게시글</h4>
											<p>asdqw1231</p>
											<p>asdqw1231</p>
											<p>asdqw1231</p>
											<p>asdqw1231</p>
											<p>asdqw1231</p>

										</div>
									</div>
									<div id="club" class="tab-pane fade">
										<div class="panel-group">
											<h4>독서클럽 게시글</h4>
											<p>99090901</p>
											<p>90909031</p>
											<p>as9090w90931</p>
											<p>awwwwwwww1</p>
											<p>addddddd231</p>
										</div>
									</div>

								</div>
							</div>

							<div id="menu2" class="tab-pane fade">
								<h3>북마크한 글귀</h3>
								ㅎㄵ
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
							</div>

							<div id="menu3" class="tab-pane fade">
								<h3>좋아요한 글귀</h3>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
								<p>asas</p>
							</div>
						</div>
					</div>
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
					<p>For those who are interested in reading, after reading a book, 
						they can leave simple texts or ask and answer each other's questions, 
						and through the reading club bulletin board, you can find a reading club 
						and recruit club members.</p>
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
						<a href="https://www.aladin.co.kr/" target="_blank">aladin</a>
					</h5>
					<!-- target 설정: 새창으로 변경 -->
					<h5>
						<a href="http://www.bandinlunis.com/" target="_blank">bandinluis</a>
					</h5>
					<h5>
						<a href="http://www.yes24.com/" target="_blank">yes24</a>
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