<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/css/bootstrap.min.js"></script>
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
      input{
        border:none;
        background:none;
      }
    </style>
</head>
<body>
  <!--로고 글귀 q&a 독서클럽 고객센터 마이페이지 로그인-->
	<nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="/bookie/main">BooKie</a>
          </div>
          <ul class="nav navbar-nav">
            <li class="active"><a href="/bookcard/main">글귀</a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/qna/main">Q&A<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="/bookie/QnA?g=1">소설 시 희곡</a></li>
                <li><a href="/bookie/QnA?g=2">에세이</a></li>
                <li><a href="/bookie/QnA?g=3">인문학</a></li>
                <li><a href="/bookie/QnA?g=4">경제경영</a></li>
                <li><a href="/bookie/QnA?g=5">사회과학</a></li>
                <li><a href="/bookie/QnA?g=6">종교</a></li>
                <li><a href="/bookie/QnA?g=7">예술</a></li>
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
    <!-- <img src="images/mypage2.png" class="img-rounded" alt="Cinque Terre" width="95%" height="250px">-->
  </div>
 
<!--  정보를 보여주기만 하고 별도의 수정 페이지 만들기 -->
<div class="container">
  <div class="row">
    <h3>MyPage</h3>
    <hr>
  </div>
  <div class="col-md-8">
    <table>
      <form action="#">
      <tr>
        <td>EMAIL</td>
        <td><input type="email" name="email" value="htth0411@naver.com" placeholder= value; readonly></td>
      </tr>
      <tr>
        <td>NICKNAME</td>
        <td><input type="text" name="nickName" value="뀨잉" placeholder= value;></td>
      </tr>
      <tr>
        <td>PHONE</td>
        <td><input type="text" name="phone" value="010-8274-7414" placeholder= value;></td>
      </tr>
      <tr>
        <td>GENRE</td>
        <td>
            <input type="checkbox" id="gen1" name="gen1" value="sosihe">
            <label for="gen1"> 소설, 시, 희곡</label>&nbsp;
            <input type="checkbox" id="gen2" name="gen2" value="esse">
            <label for="gen2"> 에세이</label>&nbsp;
            <input type="checkbox" id="gen3" name="gen3" value="inmoon">
            <label for="gen3"> 인문학</label>&nbsp;
            <input type="checkbox" id="gen4" name="gen4" value="inmoon">
            <label for="gen4"> 경제 경영</label>&nbsp;
            <input type="checkbox" id="gen5" name="gen5" value="inmoon">
            <label for="gen5"> 사회 과학</label>&nbsp;
            <input type="checkbox" id="gen6" name="gen6" value="inmoon">
            <label for="gen6"> 종교</label>&nbsp;
            <input type="checkbox" id="gen7" name="gen7" value="inmoon">
            <label for="gen7"> 예술</label>&nbsp;
          </td>
      </tr>
      <tr>
        <td>REGDATE</td>
        <td><input type="text" name="email" value="2020.06.29" placeholder= value; readonly></td>
      </tr>

      <tr>
        <td><input type="submit" value="Submit"></td>
      </tr>
      </form>
    </table>
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
