<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/bootMain.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style media="screen">
    #searchButton{
      float: right;
      margin-top: 0;
      margin-bottom: 20px;
    }
    .navbar-header>a{
      font-size: 30pt;
      font-family: cursive;
    }
    body{
      background: ivory;
    }
    textarea{
      resize: none;
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
      <li class="active"><a href="/bookcard/main">글귀</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/qna/main">Q&A<span class="caret"></span></a>
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
      <li class="active"><a href="/bookcard/main">독서 클럽</a></li>
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
  <div style="margin-top:50px; background:lightgray; width:95%; height:250px"></div>
  <!-- <img src="images/customer.png" class="img-rounded" alt="Cinque Terre" width="95%" height="300px"> -->
</div>


  <!-- 고객센터 페이지의 문의 제목, 내용 입력칸 너비 줄이기, send 버튼 위치 이동(위 사진의 오른편 여백과 맞춰서) -->
  <div id="contact" class="container">
    <h3>문의하기</h3>
    <br>
    <div class="row">
      <div class="col-md-4">
        <h4>고 객 지 원</h4>
        <p><h5>AM 10:00 ~ PM 06:30</h5></p>
        <p><h5>Lunch  PM 12:30 ~ 01:30</h5></p>
        <p><h5>* 법정 공휴일 제외</h5></p>
      </div>
      <div class="col-md-8">
        <div class="row">
          <form class="form-inline">
            <div class="form-group">
              <label for="exampleInputName2">Name</label>
              <input type="text" class="form-control" id="exampleInputName2" placeholder="이름">&nbsp;&nbsp;
            </div>
            <div class="form-group">
              <label for="exampleInputEmail2">Email</label>
              <input type="email" class="form-control" id="exampleInputEmail2" placeholder="이메일">
            </div>
          </form>
          <hr>
        <input class="form-control" id="comments" name="comments" placeholder="제목" rows="1"></input>
        <textarea class="form-control" id="comments" name="comments" placeholder="내용" rows="5"></textarea>
        <br>
        <div class="row">
          <div class="col-md-12 form-group">
            <button class="btn pull-right" type="submit">Send</button>
          </div>
        </div>
      </div>
    </div>
</div>
</div>
	
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
