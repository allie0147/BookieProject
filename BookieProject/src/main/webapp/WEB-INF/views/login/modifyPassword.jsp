<%@page import="com.project.bookie.dto.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/mainview/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.resetPwdForm{
		text-align: center;
		margin:100px auto 100px auto;
	}
</style>
<script type="text/javascript">
	$(function resetPwd(){
		$("form").on("submit", function(){
			let pwd = $("input[name=uPwd]").eq(0).val();
			let ckPwd = $("input[name=uPwdCheck]").eq(0).val();
			
			
			/*
				let emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
                if (emailCheck.test(u_email) == true) {
                    console.log("확인");
                    $('#error01').hide();
                    u_email = encodeURIComponent(u_email);
                }
			*/
			if(pwd == ckPwd){
                let num = pwd.search(/[0-9]/g);
                let eng = pwd.search(/[a-z]/ig);
                let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
                let pwdCheck = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/);
                
                if (pwdCheck.test(pwd) == true) {
                    let conf = confirm("비밀번호를 수정하시겠습니까?");
                    if(conf){
                    	 
                    }
                    let formData = $("form").eq(0).serialize();
					
    				$.ajax({
    					url:"/resetPwdinDb",
    					type:"post",
    					data:formData,
    					success:function(){
    						alert("비밀번호가 변경되었습니다.");
    						location.href="/";
    					}
    				});
                } else if (pwd == "") {
                    alert('비밀번호를 입력해주세요');
                } else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)) {
                    alert('사용불가능한 비밀번호입니다');
                } else if (pwd.length > 17||pwd.length < 8) {
                   alert('최소 8자리 이상 16자리 이하의 비밀번호를 입력하세요');
                }
			}else {
				alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			}
			return false;
		});
	});
</script>
</head>
<body>
	<!-- nav bar -->
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
	
	<!-- 결과(한번 수정하고 나서 또 다시 같은 링크로 들어올 경우 키가 갱신된 후기 때문에 유효하지 않은 접근임을 알림 -->
	<div class="resetPwdForm">
		<c:if test="${user != null }">
			<form>
				<input type="hidden" name="uId" value="${user.getId() }"/>
				
				<label for="email">이메일</label><br>
				<input id="email" type="text" name="uEmail" value="${user.getUEmail() }" readonly="readonly"/><br>
				
				<label id="pwd">새로운 비밀번호 입력</label><br>
				<input id="pwd" type="password" name="uPwd"/><br>
				
				<label id="pwdCk">새로운 비밀번호 확인</label><br>
				<input type="password" name="uPwdCheck"/><br>
				<!-- 비밀번호와 비밀번호 확인란의 값이 같은지 유효성 검사 필요 -->
				
				<input type="submit" value="변경" />	
			</form>
		</c:if>
		<c:if test="${user == null }">
			<p>유효하지 않은 접근입니다.</p><br>
			<a href="/">메인 화면으로 이동</a>
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