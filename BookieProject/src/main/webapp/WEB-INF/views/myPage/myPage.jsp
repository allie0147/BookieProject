<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<script type="text/javascript">
function deleteUser(){
	let conf = confirm("정말 탈퇴하시겠습니까?");
	let uId = ${mypageInfo.id};
	console.log(uId);
	if(conf){
		$.ajax({
			url:"/mypage/delete",
			type:"post",
			data:{
				"uId":uId,
			},
			success:function(data){
				if(data == "true"){
					alert("탈퇴되었습니다.");
					location.href="/logout";					
				}
			}
		});
	}
}

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
				<li><a href="/mypage/info"><span
						class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
			<!-- 로그인 했을 시, Logout 버튼 보임  -->
			<sec:authorize access="isAuthenticated()">
				<li><a href='#' onclick="document.getElementById('logout').submit();" >
				<span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			<form id= 'logout' action="/logout" method="post" style="diplay:none">
				<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}'/>
			</form>
		 	</sec:authorize>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div
			style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto"></div>
		<!-- <img src="images/mypage2.png" class="img-rounded" alt="Cinque Terre" width="95%" height="250px">-->
	</div>
	<div class="container">
		<div class="container-fluid bg">
			<div class="div-container">
				
				<div class="container">
					<b>Email</b>
					<div>${mypageInfo.getUEmail() }</div>
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
					<c:forEach var="interest" items="${mypageInfo.interestList }" varStatus="status">
						<c:if test="${status.index != mypageInfo.interestList.size() - 1 }">
							${interest.genreName }, 
						</c:if>
						<c:if test="${status.index == mypageInfo.interestList.size() - 1 }">
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
					<a href="/mypage/updateForm" class="btn btn-md btn-default">수정하기</a>
					<a href="javascript:deleteUser()" class="btn btn-md btn-default">탈퇴하기</a>
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
