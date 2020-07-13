<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrp.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/cs/main.css">
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
			<div style="margin-top: 50px; background: lightgray; width: 95%; height: 250px; margin: 50px auto 50px auto">
			<img src="../resources/images/banner-cs.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="100%"></div>
		</div>

		<!-- 고객센터 페이지의 문의 제목, 내용 입력칸 너비 줄이기, send 버튼 위치 이동(위 사진의 오른편 여백과 맞춰서) -->
		<div id="contact" class="container">
			<div class="row">
				<div class="col-md-4">
					<h3>자주 묻는 질문</h3>
					<br>
					<h4>고 객 지 원</h4>
					<p>
					<h5>AM 10:00 ~ PM 06:30</h5>
					</p>
					<p>
					<h5>Lunch PM 12:30 ~ 01:30</h5>
					</p>
					<p>
					<h5>* 법정 공휴일 제외</h5>
					</p>
				</div>
				<div class="col-md-8">
					<h2>FAQ</h2>
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#home">서비스
								공지</a></li>
						<li><a data-toggle="tab" href="#menu1">약관/방침</a></li>
						<li><a data-toggle="tab" href="#menu2">로그인/계정</a></li>
						<li><a data-toggle="tab" href="#menu3">기타문의/제안</a></li>
					</ul>
					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">
							<h3>서비스 공지사항입니다</h3>
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse1">도서전문 포털 <strong>BooKie</strong>가
												오픈했습니다.
											</a>
										</h4>
									</div>
									<div id="collapse1" class="panel-collapse collapse">
										<div class="panel-body">
											2020 경자년(庚子年), 신개념 도서정보 공유포털사이트 북키 정식 오픈! <br> 자유로운 가입과
											활동으로 서로의 의견을 주고받으세요.<br> 많은 사랑 부탁드립니다.
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse2">모바일 어플리케이션 BooKieM 개발중.</a>
										</h4>
									</div>
									<div id="collapse2" class="panel-collapse collapse">
										<div class="panel-body">
											BooKieM은 모바일과 테블릿에 최적화된 어플리케이션입니다. 현재는 개발중이며,<br> 2020년
											하반기 오픈을 목표로 열심히 작업중에 있습니다.
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse3">정기점검 날짜 공지</a>
										</h4>
									</div>
									<div id="collapse3" class="panel-collapse collapse">
										<div class="panel-body">
											국내 최대 도서정보 공유포털사이트 북키는 안전한 회원정보 관리와 보다 나은<br> 서비스를 위해 매
											주 월요일에 정기점검을 실시합니다. 점검중에는 이용이 불가합니다<br> 점검 시간은 정오부터
											2시간이며 점검 종료 후 바로 이용이 가능합니다.
										</div>
									</div>
								</div>
							</div>
						</div>

						<div id="menu1" class="tab-pane fade">
							<h3>약관 및 개인정보 처리 방침입니다</h3>
							<div class="panel-group" id="accordion2">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion2"
												href="#collapse2-1">개인정보 처리방침</a>
										</h4>
									</div>
									<div id="collapse2-1" class="panel-collapse collapse">
										<div class="panel-body">개인정보처리방침의 개정내용에 동의하지 않으시는 경우
											회원탈퇴를 요청하실 수 있으며, 공지기간 동안 이에 대한 별도의 의사표시가 없으신 경우 변경 내용에 동의한
											것으로 판단하여 각 시행일에 개정된 개인정보처리방침이 적용됩니다. 감사합니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion2"
												href="#collapse2-2">개인정보 수집 및 이용</a>
										</h4>
									</div>
									<div id="collapse2-2" class="panel-collapse collapse">
										<div class="panel-body">
											(1) 회사가 수집하는 개인정보의 항목 및 이용목적은 아래와 같습니다.<br> (2) 회사는 관련
											법령에 따라 아래 정보를 보관하고 있습니다.<br> (3) 회사는 서비스의 부정 이용행위 및 재가입을
											방지하기 위해 불량 이용자의 이메일 정보를 1년간 보관합니다.<br> (4) 회사는 다음과 같은
											방법으로 개인정보를 수집합니다.<br> 가. 회원 가입 및 서비스 이용과정에서 이용자가 개인정보
											수집에 대해 동의를 하고 직접 정보를 입력하는 경우<br> 나. 고객센터를 통한 상담 과정에서
											웹페이지, 메일, 팩스, 전화 등을 통해 회원이 개인정보를 제공하는 경우<br> 다. 오프라인에서
											진행되는 이벤트/행사에 회원이 참여하고 개인정보를 제공하는 경우<br> 라. 제휴 서비스 또는 단체
											등으로부터 개인정보를 제공받는 경우
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion2"
												href="#collapse2-3">개인정보의 파기</a>
										</h4>
									</div>
									<div id="collapse2-3" class="panel-collapse collapse">
										<div class="panel-body">
											(1) 회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 바로 파기하고 있습니다. 단, 이용자에게 개인정보
											보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보 보관 의무를 부과하는 경우에는 해당
											기간 동안 개인정보를 안전하게 보관합니다.<br> (2) 회사는 ‘개인정보 유효기간제'에 따라 1년간
											서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.<br> (3) 회원
											탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된
											개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 법령에서 보존의무를 부과한 정보에 대해서도 해당 기간
											경과 후 바로 재생이 불가능한 방법으로 파기합니다.<br> 전자적 파일 형태의 경우 복구 및 재생이
											되지 않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로
											파기합니다.
										</div>
									</div>
								</div>
							</div>
						</div>

						<div id="menu2" class="tab-pane fade">
							<h3>로그인 및 계정관련입니다</h3>
							<div class="panel-group" id="accordion3">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion3"
												href="#collapse3-1">비밀번호가 기억나지 않아요</a>
										</h4>
									</div>
									<div id="collapse3-1" class="panel-collapse collapse">
										<div class="panel-body">로그인 화면에서 '비밀번호 찾기'를 이용하시면 비밀번호를
											찾을 수 있습니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion3"
												href="#collapse3-2">비밀번호 찾기 메일이 도착하지 않아요</a>
										</h4>
									</div>
									<div id="collapse3-2" class="panel-collapse collapse">
										<div class="panel-body">메일 주소를 다시 한번 확인후 이용바랍니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion3"
												href="#collapse3-3">회원에서 탈퇴하고 싶어요</a>
										</h4>
									</div>
									<div id="collapse3-3" class="panel-collapse collapse">
										<div class="panel-body">최소 5년은 가입상태를 유지해야합니다.</div>
									</div>
								</div>
							</div>
						</div>

						<div id="menu3" class="tab-pane fade">
							<h3>기타 문의 사항들입니다</h3>
							<div class="panel-group" id="accordion4">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion4"
												href="#collapse4-1">BooKie는 무슨 뜻인가요?</a>
										</h4>
									</div>
									<div id="collapse4-1" class="panel-collapse collapse">
										<div class="panel-body">book과 cookie가 섞인건데 저도 잘 몰라요.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion4"
												href="#collapse4-2">QnA게시판에 질문이 안보여요</a>
										</h4>
									</div>
									<div id="collapse4-2" class="panel-collapse collapse">
										<div class="panel-body">일시적인 오류이니 접속을 종료후 다시 이용해주세요.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion4"
												href="#collapse4-3">비밀번호를 변경하고 싶어요</a>
										</h4>
									</div>
									<div id="collapse4-3" class="panel-collapse collapse">
										<div class="panel-body">로그인 및 계정관련 게시판에 문의 바랍니다.</div>
									</div>
								</div>
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
